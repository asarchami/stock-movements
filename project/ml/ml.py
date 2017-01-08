"""Machine learning libraries to update data."""
import pandas as pd
# import os.path

from datetime import date, timedelta
import datetime
import urllib2
import httplib
from bs4 import BeautifulSoup
from time import sleep
import random

from nltk.sentiment.vader import SentimentIntensityAnalyzer

from pandas_datareader import data


def add_article(link, symbol, title, date):
    """Get article from the provided link."""
    article = {}
    article['Url'] = "http://www.reuters.com/"+link
    article['Title'] = title
    article['Symbol'] = symbol
    article['Date'] = date
    soup = BeautifulSoup(urllib2.urlopen(article['Url']), "lxml")
    article['Article'] = soup.find_all(
        'span', {"id": "article-text"})[0].text.replace('\n', ' ')
    article['Time'] = soup.find_all(
        'span', {"class": "timestamp"})[0].text
    # this is needed for not being blocked!!!
    sleep(random.randint(1, 6)/10.0)
    sid = SentimentIntensityAnalyzer()
    article['compound'] = sid.polarity_scores(article['Article'])['compound']
    article['neg'] = sid.polarity_scores(article['Article'])['neg']
    article['neu'] = sid.polarity_scores(article['Article'])['neu']
    article['pos'] = sid.polarity_scores(article['Article'])['pos']
    return pd.DataFrame([article])


def get_news(symbol, day):
    """Get all news links."""
    url = "http://www.reuters.com/finance/stocks" + \
        "/companyNews?symbol={}&date={}".format(
            symbol, day.strftime('%m%d%Y'))
    articles = []

    news = BeautifulSoup(
        urllib2.urlopen(url), "lxml").find_all('div', {"id": "companyNews"})
    for i in xrange(2):
        for feature in news[i].find_all('h2'):
            link = feature.find('a')
            if link.has_attr('href'):
                articles.append(add_article(
                    link['href'], symbol, link.text, day))
    sleep(random.randint(1, 6)/10.0)
    if articles:
        return pd.concat(articles)


def get_quotes(symbol, start_date):
    """Get quotes."""
    end_date = date.today().strftime('%m/%d/%Y')
    symbol = symbol.replace('.N', '')
    try:
        sleep(2)
        ret = data.DataReader(symbol,
                              data_source='yahoo',
                              start=start_date, end=end_date)
    except (urllib2.URLError, IOError) as e:
        print symbol, e.args
        sleep(10)
        ret = data.DataReader(symbol,
                              data_source='google',
                              start=start_date, end=end_date)
        ret['Adj Close'] = None
        pass
    ret['Symbol'] = symbol
    return ret


calculate_slopes = lambda x: pd.Series([
        x['Close'] - x['Prev_Close'],
        x['Next_Close'] - x['Close'],
        (x['Next_Close'] - x['Close']) - (x['Close'] - x['Prev_Close']),
    ])


def update_data(symbol):
    """Update data."""
    sym = pd.read_csv('datasets/temp/{}.csv'.format(symbol),
                      encoding='utf-8',
                      index_col=0).sort_values(by='Date',
                                               ascending=True)
    sym = sym[['Date', 'Symbol', 'Close', 'High', 'Low', 'Open', 'Volume',
               'compound', 'neg', 'neu', 'pos', 'Next_Close', 'Next_Open',
               'Prev_Close', 'Prev_Slope', 'Next_Slope', 'Diff_Slope']]
    start_date = datetime.datetime.strptime(
        sym.iloc[-1, :]['Date'], "%Y-%m-%d").date() + timedelta(days=1)
    end_date = date.today()
    if start_date < end_date:
        start_date = start_date - timedelta(days=1)
        days = [start_date + timedelta(n) for n in range(
            (end_date - start_date).days)]
        sentiments = []
        for day in days:
            try:
                sentiments.append(get_news(symbol, day))
            except (urllib2.URLError, IOError, httplib.HTTPException) as e:
                print e.args
    #     data = pd.concat(data)

        sentiments = pd.concat(sentiments)
        sentiments = sentiments[['Date', 'Symbol', 'compound',
                                 'neg', 'neu', 'pos']]

        quotes = get_quotes(symbol, start_date)
        quotes = quotes.reset_index()

        quotes = quotes.drop('Adj Close', axis=1)
        quotes['Date'] = pd.to_datetime(quotes['Date'], format='%Y-%m-%d')
        quotes = quotes[['Date', 'Symbol', 'Close', 'High',
                         'Low', 'Open', 'Volume']]

        q_a = quotes.set_index(['Date', 'Symbol']).join(
            sentiments.set_index(['Date', 'Symbol']),
            rsuffix='r').reset_index()
        q_a = q_a.copy()
        # used fo calculating next day's slope
        q_a['Next_Close'] = q_a['Close'].shift(-1)
        # for some possible prediction
        q_a['Next_Open'] = q_a['Open'].shift(-1)
        # used fo calculating previous day's slope
        q_a['Prev_Close'] = q_a['Close'].shift(1)

        tmp = q_a.apply(calculate_slopes, axis=1)
        tmp.columns = ['Prev_Slope', 'Next_Slope', 'Diff_Slope']
        q_a = pd.concat([q_a, tmp], axis=1)
        f = q_a.iloc[0, :].copy()
        f['Prev_Close'] = sym.iloc[-2, :]['Close']
        f['Prev_Slope'] = f['Close']-sym.iloc[-2, :]['Close']
        f['Diff_Slope'] = f['Next_Slope']-f['Close']+sym.iloc[-2, :]['Close']
        q_a.iloc[0, :] = f

#         return q_a

        sym = pd.concat([sym.drop(sym.index[len(sym)-1]), q_a], axis=0)
        sym['Date'] = pd.to_datetime(sym['Date'], format='%Y-%m-%d')
        sym = sym.reset_index().drop('index', axis=1)
#         return sym
#         sym.to_csv('datasets/temp/{}.csv'.format(symbol),
#                    encoding='utf-8')
    return sym
