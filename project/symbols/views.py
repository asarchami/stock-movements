"""Default view."""
########################
#        imports       #
########################
from project.models import Symbol  # pragma: no cover
from flask import render_template, Blueprint, jsonify, \
    Response  # pragma: no cover
from flask_login import login_required  # pragma: no cover
from project.ml import ml as ml
import json
import os
import pandas as pd
from sklearn.externals import joblib

# import os  # pragma: no cover

##########################
#         config         #
##########################

symbols_blueprint = Blueprint(
    'symbols', __name__,
    template_folder='templates'
)

########################
#        routes        #
########################
# use decorators to link the function to a url


@symbols_blueprint.route('/symbols')
@login_required
def symbols():
    """Json for symbols."""
    return render_template('symbols.html')


@symbols_blueprint.route('/symbols.json')
# @login_required
def symbols_json():
    """Json for symbols."""
    symbols = Symbol.query.all()
    return jsonify(symbols_list=[symbol.serialize for symbol in symbols])


@symbols_blueprint.route('/symbol/<symbol>')
@login_required
def symbol_show(symbol):
    """Show symbol info."""
    symbol = Symbol.query.filter(symbol == symbol).first()
    file_path = os.getcwd() + \
        "/project/static/datasets/news_quotes/{}.json".format(symbol.symbol)
    table = pd.read_json(
        file_path).sort_values(by='Date', ascending=False)
    table = table[(table['compound'].notnull())]
    # table = table[['Open', 'Close', 'High', 'Low', 'Volume',
    #                'compound', 'neu', 'pos', 'neg',
    #                'Next_Open', 'Next_Close']]

    orig = table.copy()
    file_path = os.getcwd() + "/project/static/datasets/models/all.sav"
    all_dic = {}
    if os.path.exists(file_path):
        all_dic = joblib.load(file_path)
    lr_model = all_dic['lr_model']
    table = table[['Close', 'High', 'Low', 'Open', 'Volume', 'compound',
                   'neg', 'neu', 'pos', 'Next_Open', 'Prev_Slope']]
    pred = lr_model.predict(table)
    table = table.reset_index()
    table['pred_difference'] = pred[0]
    table = table.set_index('index')
    table['Next_Close'] = orig['Next_Close']
    table['pred_N_Close'] = table['pred_difference'] + 2*table['Close'] - \
        orig['Prev_Close']
    table['Date'] = orig['Date']

    table = table.set_index('Date')
    table = table[['Open', 'Close', 'High', 'Low', 'Volume',
                   'compound', 'neu', 'pos', 'neg',
                   'Next_Close', 'pred_N_Close']]

    table = table.to_html(
        classes='table table-striped table-bordered table-hover')
    return render_template('show.html', symbol=symbol, table=table)


@symbols_blueprint.route("/Symbol/update/<symbol>")
@login_required
def symbol_update(symbol):
    """Update symbol info."""
    return render_template('update_symbol.html', symbol=symbol)


@symbols_blueprint.route('/symbol/<symbol>.json')
# @login_required
def show_symbol_json(symbol):
    """Json for symbols."""
    file_path = os.getcwd() + \
        "/project/static/datasets/news_quotes/{}.json".format(symbol)
    with open(file_path) as data_file:
        data = json.load(data_file)

    resp = Response(json.dumps(data), status=200, mimetype='application/json')
    # resp.headers['Link'] = ''

    return resp
