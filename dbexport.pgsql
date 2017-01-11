--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE alembic_version OWNER TO dev;

--
-- Name: portfolio_symbols; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE portfolio_symbols (
    id integer NOT NULL,
    portfolio_id integer NOT NULL,
    symbol_id integer NOT NULL,
    price double precision NOT NULL,
    date timestamp without time zone,
    number integer NOT NULL
);


ALTER TABLE portfolio_symbols OWNER TO dev;

--
-- Name: portfolio_symbols_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE portfolio_symbols_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE portfolio_symbols_id_seq OWNER TO dev;

--
-- Name: portfolio_symbols_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE portfolio_symbols_id_seq OWNED BY portfolio_symbols.id;


--
-- Name: portfolios; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE portfolios (
    id integer NOT NULL,
    name character varying NOT NULL,
    owner_id integer,
    description character varying NOT NULL
);


ALTER TABLE portfolios OWNER TO dev;

--
-- Name: portfolios_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE portfolios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE portfolios_id_seq OWNER TO dev;

--
-- Name: portfolios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE portfolios_id_seq OWNED BY portfolios.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE posts (
    id integer NOT NULL,
    title character varying NOT NULL,
    description character varying NOT NULL,
    author_id integer
);


ALTER TABLE posts OWNER TO dev;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE posts_id_seq OWNER TO dev;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE posts_id_seq OWNED BY posts.id;


--
-- Name: symbols; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE symbols (
    id integer NOT NULL,
    symbol character varying NOT NULL,
    name character varying NOT NULL,
    sector character varying NOT NULL,
    industry character varying NOT NULL,
    address character varying NOT NULL,
    date_added timestamp without time zone,
    cik integer NOT NULL
);


ALTER TABLE symbols OWNER TO dev;

--
-- Name: symbols_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE symbols_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE symbols_id_seq OWNER TO dev;

--
-- Name: symbols_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE symbols_id_seq OWNED BY symbols.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL
);


ALTER TABLE users OWNER TO dev;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO dev;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY portfolio_symbols ALTER COLUMN id SET DEFAULT nextval('portfolio_symbols_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY portfolios ALTER COLUMN id SET DEFAULT nextval('portfolios_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY posts ALTER COLUMN id SET DEFAULT nextval('posts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY symbols ALTER COLUMN id SET DEFAULT nextval('symbols_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY alembic_version (version_num) FROM stdin;
2c8d62004c2d
\.


--
-- Data for Name: portfolio_symbols; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY portfolio_symbols (id, portfolio_id, symbol_id, price, date, number) FROM stdin;
3	1	1	12.3000000000000007	2016-12-31 12:34:10.062608	2
7	1	3	123.299999999999997	2017-01-01 15:58:53.925574	23
19	1	5	123	2017-01-01 16:35:51.831614	213
22	1	6	324	2017-01-30 00:00:00	23
\.


--
-- Name: portfolio_symbols_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('portfolio_symbols_id_seq', 22, true);


--
-- Data for Name: portfolios; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY portfolios (id, name, owner_id, description) FROM stdin;
1	new	1	new portfolio
2	another one	1	yet another portfolio
3	portfolio3	1	portfolio3
4	portfolio4	1	portfolio4
5	portfolio5	1	portfolio5
6	portfolio6	1	portfolio6
\.


--
-- Name: portfolios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('portfolios_id_seq', 6, true);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY posts (id, title, description, author_id) FROM stdin;
\.


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('posts_id_seq', 1, false);


--
-- Data for Name: symbols; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY symbols (id, symbol, name, sector, industry, address, date_added, cik) FROM stdin;
1	MMM	3M Company	Industrials	Industrial Conglomerates	St. Paul, Minnesota	\N	66740
2	ABT	Abbott Laboratories	Health Care	Health Care Equipment	North Chicago, Illinois	1964-03-31 00:00:00	1800
3	ABBV	AbbVie	Health Care	Pharmaceuticals	North Chicago, Illinois	2012-12-31 00:00:00	1551152
4	ACN	Accenture plc	Information Technology	IT Consulting & Other Services	Dublin, Ireland	2011-07-06 00:00:00	1467373
5	ATVI	Activision Blizzard	Information Technology	Home Entertainment Software	Santa Monica, California	2015-08-31 00:00:00	718877
6	AYI	Acuity Brands Inc	Industrials	Electrical Components & Equipment	Atlanta, Georgia	2016-05-03 00:00:00	1144215
7	ADBE	Adobe Systems Inc	Information Technology	Application Software	San Jose, California	1997-05-05 00:00:00	796343
8	AAP	Advance Auto Parts	Consumer Discretionary	Automotive Retail	Roanoke, Virginia	2015-07-09 00:00:00	1158449
9	AES	AES Corp	Utilities	Independent Power Producers & Energy Traders	Arlington, Virginia	\N	874761
10	AET	Aetna Inc	Health Care	Managed Health Care	Hartford, Connecticut	1976-06-30 00:00:00	1122304
11	AMG	Affiliated Managers Group Inc	Financials	Asset Management & Custody Banks	Beverly, Massachusetts	2014-07-01 00:00:00	1004434
12	AFL	AFLAC Inc	Financials	Life & Health Insurance	Columbus, Georgia	\N	4977
13	A	Agilent Technologies Inc	Health Care	Health Care Equipment	Santa Clara, California	\N	1090872
14	APD	Air Products & Chemicals Inc	Materials	Industrial Gases	Allentown, Pennsylvania	1985-04-30 00:00:00	2969
15	AKAM	Akamai Technologies Inc	Information Technology	Internet Software & Services	Cambridge, Massachusetts	2007-07-12 00:00:00	1086222
16	ALK	Alaska Air Group Inc	Industrials	Airlines	Seattle, Washington	2016-05-13 00:00:00	766421
17	ALB	Albemarle Corp	Materials	Specialty Chemicals	Baton Rouge, Louisiana	2016-07-01 00:00:00	915913
18	AGN	Allergan, Plc	Health Care	Pharmaceuticals	Dublin, Ireland	\N	884629
19	LNT	Alliant Energy Corp	Utilities	Electric Utilities	Madison, Wisconsin	2016-07-01 00:00:00	352541
20	ALXN	Alexion Pharmaceuticals	Health Care	Biotechnology	Cheshire, Connecticut	2012-05-25 00:00:00	899866
21	ALLE	Allegion	Industrials	Building Products	Dublin, Ireland	2013-12-02 00:00:00	1579241
22	ADS	Alliance Data Systems	Information Technology	Data Processing & Outsourced Services	Plano, Texas	2013-12-23 00:00:00	1101215
23	ALL	Allstate Corp	Financials	Property & Casualty Insurance	Northfield Township, Illinois	\N	899051
24	GOOGL	Alphabet Inc Class A	Information Technology	Internet Software & Services	Mountain View, California	2014-04-03 00:00:00	1652044
25	GOOG	Alphabet Inc Class C	Information Technology	Internet Software & Services	Mountain View, California	\N	1652044
26	MO	Altria Group Inc	Consumer Staples	Tobacco	Richmond, Virginia	\N	764180
27	AMZN	Amazon.com Inc	Consumer Discretionary	Internet & Direct Marketing Retail	Seattle, Washington	2005-11-18 00:00:00	1018724
28	AEE	Ameren Corp	Utilities	MultiUtilities	St. Louis, Missouri	1991-09-19 00:00:00	1002910
29	AAL	American Airlines Group	Industrials	Airlines	Fort Worth, Texas	2015-03-23 00:00:00	6201
30	AEP	American Electric Power	Utilities	Electric Utilities	Columbus, Ohio	\N	4904
31	AXP	American Express Co	Financials	Consumer Finance	New York, New York	1976-06-30 00:00:00	4962
32	AIG	American International Group, Inc.	Financials	Property & Casualty Insurance	New York, New York	1980-03-31 00:00:00	5272
33	AMT	American Tower Corp A	Real Estate	Specialized REITs	Boston, Massachusetts	2007-11-19 00:00:00	1053507
34	AWK	American Water Works Company Inc	Utilities	Water Utilities	Voorhees, New Jersey	2016-03-04 00:00:00	1410636
35	AMP	Ameriprise Financial	Financials	Asset Management & Custody Banks	Minneapolis, Minnesota	\N	820027
36	ABC	AmerisourceBergen Corp	Health Care	Health Care Distributors	Chesterbrook, Pennsylvania	\N	1140859
37	AME	AMETEK Inc	Industrials	Electrical Components & Equipment	Berwyn, Pennsylvania	2013-09-23 00:00:00	1037868
38	AMGN	Amgen Inc	Health Care	Biotechnology	Thousand Oaks, California	1992-01-02 00:00:00	318154
39	APH	Amphenol Corp	Industrials	Electrical Components & Equipment	Wallingford, Connecticut	2008-09-30 00:00:00	820313
40	APC	Anadarko Petroleum Corp	Energy	Oil & Gas Exploration & Production	The Woodlands, Texas	\N	773910
41	ADI	Analog Devices, Inc.	Information Technology	Semiconductors	Norwood, Massachusetts	\N	6281
42	ANTM	Anthem Inc.	Health Care	Managed Health Care	Indianapolis, Indiana	\N	1156039
43	AON	Aon plc	Financials	Insurance Brokers	London, United Kingdom	\N	315293
44	APA	Apache Corporation	Energy	Oil & Gas Exploration & Production	Houston, Texas	\N	6769
45	AIV	Apartment Investment & Mgmt	Real Estate	REITs	Denver, Colorado	\N	922864
46	AAPL	Apple Inc.	Information Technology	Computer Hardware	Cupertino, California	1982-11-30 00:00:00	320193
47	AMAT	Applied Materials Inc	Information Technology	Semiconductor Equipment	Santa Clara, California	\N	6951
48	ADM	Archer-Daniels-Midland Co	Consumer Staples	Agricultural Products	Decatur, Illinois	1981-07-29 00:00:00	7084
49	ARNC	Arconic Inc	Industrials	Aerospace & Defense	New York, New York	1964-03-31 00:00:00	4281
50	AJG	Arthur J. Gallagher & Co.	Financials	Insurance Brokers	Itasca, Illinois	2016-05-31 00:00:00	354190
51	AIZ	Assurant Inc	Financials	Multi-line Insurance	New York, New York	2007-04-10 00:00:00	1267238
52	T	AT&T Inc	Telecommunications Services	Integrated Telecommunications Services	Dallas, Texas	1983-11-30 00:00:00	732717
53	ADSK	Autodesk Inc	Information Technology	Application Software	San Rafael, California	1989-12-01 00:00:00	769397
54	ADP	Automatic Data Processing	Information Technology	Internet Software & Services	Roseland, New Jersey	1981-03-31 00:00:00	8670
55	AN	AutoNation Inc	Consumer Discretionary	Specialty Stores	Fort Lauderdale, Florida	\N	350698
56	AZO	AutoZone Inc	Consumer Discretionary	Specialty Stores	Memphis, Tennessee	\N	866787
57	AVB	AvalonBay Communities, Inc.	Real Estate	Residential REITs	Arlington, Virginia[3]	2007-01-10 00:00:00	915912
58	AVY	Avery Dennison Corp	Materials	Paper Packaging	Glendale, California	1987-12-31 00:00:00	8818
59	BHI	Baker Hughes Inc	Energy	Oil & Gas Equipment & Services	Houston, Texas	\N	808362
60	BLL	Ball Corp	Materials	Metal & Glass Containers	Broomfield, Colorado	1984-10-31 00:00:00	9389
61	BAC	Bank of America Corp	Financials	Banks	Charlotte, North Carolina	1976-06-30 00:00:00	70858
62	BK	The Bank of New York Mellon Corp.	Financials	Banks	New York, New York	\N	1390777
63	BCR	Bard (C.R.) Inc.	Health Care	Health Care Equipment	Murray Hill, New Jersey	1975-06-30 00:00:00	9892
64	BAX	Baxter International Inc.	Health Care	Health Care Equipment	Deerfield, Illinois	1972-09-30 00:00:00	10456
65	BBT	BB&T Corporation	Financials	Banks	Winston-Salem, North Carolina	\N	92230
66	BDX	Becton Dickinson	Health Care	Health Care Equipment	Franklin Lakes, New Jersey	1972-09-30 00:00:00	10795
67	BBBY	Bed Bath & Beyond	Consumer Discretionary	Specialty Stores	Union, New Jersey	\N	886158
68	BRK-B	Berkshire Hathaway	Financials	Multi-Sector Holdings	Omaha, Nebraska	2010-02-16 00:00:00	1067983
69	BBY	Best Buy Co. Inc.	Consumer Discretionary	Computer & Electronics Retail	Richfield, Minnesota	\N	764478
70	BIIB	BIOGEN IDEC Inc.	Health Care	Biotechnology	Weston, Massachusetts	\N	875045
71	BLK	BlackRock	Financials	Asset Management & Custody Banks	New York, New York	2011-04-04 00:00:00	1364742
72	HRB	Block H&R	Financials	Consumer Finance	Kansas City, Missouri	1986-11-30 00:00:00	12659
73	BA	Boeing Company	Industrials	Aerospace & Defense	Chicago, Illinois	\N	12927
74	BWA	BorgWarner	Consumer Discretionary	Auto Parts & Equipment	Auburn Hills, Michigan	2011-12-19 00:00:00	908255
75	BXP	Boston Properties	Real Estate	REITs	Boston, Massachusetts	\N	1037540
76	BSX	Boston Scientific	Health Care	Health Care Equipment	Marlborough, Massachusetts[4]	\N	885725
77	BMY	Bristol-Myers Squibb	Health Care	Health Care Distributors	New York, New York	\N	14272
78	AVGO	Broadcom	Information Technology	Semiconductors	San Jose, California	2014-05-08 00:00:00	1441634
79	BF-B	Brown-Forman Corporation	Consumer Staples	Distillers & Vintners	Louisville, Kentucky	1982-10-31 00:00:00	14693
80	CHRW	C. H. Robinson Worldwide	Industrials	Air Freight & Logistics	Eden Prairie, Minnesota	\N	1043277
81	CA	CA, Inc.	Information Technology	Systems Software	Islandia, New York	1987-07-31 00:00:00	356028
82	COG	Cabot Oil & Gas	Energy	Oil & Gas Exploration & Production	Houston, Texas	2008-06-23 00:00:00	858470
83	CPB	Campbell Soup	Consumer Staples	Packaged Foods & Meats	Camden, New Jersey	\N	16732
84	COF	Capital One Financial	Financials	Consumer Finance	Tysons Corner, Virginia	\N	927628
85	CAH	Cardinal Health Inc.	Health Care	Health Care Distributors	Dublin, Ohio	\N	721371
86	HSIC	Henry Schein	Health Care	Health Care Distributors	Melville, New York	2015-03-17 00:00:00	1000228
87	KMX	Carmax Inc	Consumer Discretionary	Specialty Stores	Richmond, Virginia	2010-06-28 00:00:00	1170010
88	CCL	Carnival Corp.	Consumer Discretionary	Hotels, Resorts & Cruise Lines	Miami, Florida	\N	815097
89	CAT	Caterpillar Inc.	Industrials	Construction & Farm Machinery & Heavy Trucks	Peoria, Illinois	\N	18230
90	CBG	CBRE Group	Real Estate	Real Estate Services	Los Angeles, California	\N	1138118
91	CBS	CBS Corp.	Consumer Discretionary	Broadcasting & Cable TV	New York, New York	1994-09-01 00:00:00	813828
92	CELG	Celgene Corp.	Health Care	Biotechnology	Summit, New Jersey	\N	816284
93	CNC	Centene Corporation	Health Care	Managed Health Care	St Louis, Missouri	2016-03-30 00:00:00	1071739
94	CNP	CenterPoint Energy	Utilities	MultiUtilities	Houston, Texas	1985-07-31 00:00:00	1130310
95	CTL	CenturyLink Inc	Telecommunications Services	Integrated Telecommunications Services	Monroe, Louisiana	\N	18926
96	CERN	Cerner	Health Care	Health Care Distributors	North Kansas City, Missouri	2010-04-30 00:00:00	804753
97	CF	CF Industries Holdings Inc	Materials	Fertilizers & Agricultural Chemicals	Deerfield, Illinois	2008-08-27 00:00:00	1324404
98	SCHW	Charles Schwab Corporation	Financials	Investment Banking & Brokerage	San Francisco, California	\N	316709
99	CHTR	Charter Communications	Consumer Discretionary	Cable & Satellite	Stamford, Connecticut	2016-09-08 00:00:00	1091667
100	CHK	Chesapeake Energy	Energy	Integrated Oil & Gas	Oklahoma City, Oklahoma	\N	895126
101	CVX	Chevron Corp.	Energy	Integrated Oil & Gas	San Ramon, California	\N	93410
102	CMG	Chipotle Mexican Grill	Consumer Discretionary	Restaurants	Denver, Colorado	2011-04-28 00:00:00	1058090
103	CB	Chubb Limited	Financials	Property & Casualty Insurance	Zurich, Switzerland	2010-07-15 00:00:00	896159
104	CHD	Church & Dwight	Consumer Staples	Household Products	Ewing, New Jersey	2015-12-29 00:00:00	313927
105	CI	CIGNA Corp.	Health Care	Managed Health Care	Philadelphia, Pennsylvania	1976-06-30 00:00:00	701221
106	XEC	Cimarex Energy	Energy	Oil & Gas Exploration & Production	Denver, Colorado	2014-06-21 00:00:00	1168054
107	CINF	Cincinnati Financial	Financials	Property & Casualty Insurance	Fairfield, Ohio	\N	20286
108	CTAS	Cintas Corporation	Industrials	Diversified Support Services	Mason, Ohio	\N	723254
109	CSCO	Cisco Systems	Information Technology	Networking Equipment	San Jose, California	1993-12-01 00:00:00	858877
110	C	Citigroup Inc.	Financials	Banks	New York, New York	1988-05-31 00:00:00	831001
111	CFG	Citizens Financial Group	Financials	Banks	Providence, Rhode Island	2016-01-29 00:00:00	759944
112	CTXS	Citrix Systems	Information Technology	Internet Software & Services	Fort Lauderdale, Florida	\N	877890
113	CLX	The Clorox Company	Consumer Staples	Household Products	Oakland, California	1969-03-31 00:00:00	21076
114	CME	CME Group Inc.	Financials	Financial Exchanges & Data	Chicago, Illinois	\N	1156375
115	CMS	CMS Energy	Utilities	MultiUtilities	Jackson, Michigan	\N	811156
116	COH	Coach Inc.	Consumer Discretionary	Apparel, Accessories & Luxury Goods	New York, New York	\N	1116132
117	KO	Coca Cola Company	Consumer Staples	Soft Drinks	Atlanta, Georgia	\N	21344
118	CTSH	Cognizant Technology Solutions	Information Technology	IT Consulting & Other Services	Teaneck, New Jersey	\N	1058290
119	CL	Colgate-Palmolive	Consumer Staples	Household Products	New York, New York	\N	21665
120	CMCSA	Comcast A Corp	Consumer Discretionary	Cable & Satellite	Philadelphia, Pennsylvania	2015-09-18 00:00:00	1166691
121	CMA	Comerica Inc.	Financials	Regional Banks	Dallas, Texas	\N	28412
122	CAG	ConAgra Foods Inc.	Consumer Staples	Packaged Foods & Meats	Omaha, Nebraska	1983-08-31 00:00:00	23217
123	CXO	Concho Resources	Energy	Oil & Gas Exploration & Production	Midland, Texas	2016-02-22 00:00:00	1358071
124	COP	ConocoPhillips	Energy	Oil & Gas Exploration & Production	Houston, Texas	\N	1163165
125	ED	Consolidated Edison	Utilities	Electric Utilities	New York, New York	\N	1047862
126	STZ	Constellation Brands	Consumer Staples	Distillers & Vintners	Victor, New York	\N	16918
127	GLW	Corning Inc.	Industrials	Construction & Engineering	Corning, New York	\N	24741
128	COST	Costco Co.	Consumer Staples	Hypermarkets & Super Centers	Issaquah, Washington	1993-10-01 00:00:00	909832
129	COTY	Coty, Inc	Consumer Staples	Personal Products	New York, NY	2016-10-03 00:00:00	1024305
130	CCI	Crown Castle International Corp.	Real Estate	REITs	Houston, Texas	2012-03-14 00:00:00	1051470
131	CSRA	CSRA Inc.	Information Technology	IT Consulting & Other Services	Falls Church, Virginia	2015-12-01 00:00:00	1646383
132	CSX	CSX Corp.	Industrials	Railroads	Jacksonville, Florida	1967-09-30 00:00:00	277948
133	CMI	Cummins Inc.	Industrials	Industrial Machinery	Columbus, Indiana	1965-03-31 00:00:00	26172
134	CVS	CVS Health	Consumer Staples	Drug Retail	Woonsocket, Rhode Island	\N	64803
135	DHI	D. R. Horton	Consumer Discretionary	Homebuilding	Fort Worth, Texas	\N	882184
136	DHR	Danaher Corp.	Industrials	Industrial Machinery	Washington, D.C.	\N	313616
137	DRI	Darden Restaurants	Consumer Discretionary	Restaurants	Orlando, Florida	\N	940944
138	DVA	DaVita Inc.	Health Care	Health Care Facilities	Denver, Colorado	2008-07-31 00:00:00	927066
139	DE	Deere & Co.	Industrials	Construction & Farm Machinery & Heavy Trucks	Moline, Illinois	\N	315189
140	DLPH	Delphi Automotive	Consumer Discretionary	Auto Parts & Equipment	Gillingham, Kent, United Kingdom	2012-12-24 00:00:00	1521332
141	DAL	Delta Air Lines	Industrials	Airlines	Atlanta, Georgia	2013-09-11 00:00:00	27904
142	XRAY	Dentsply Sirona	Health Care	Health Care Supplies	York, Pennsylvania	2008-11-14 00:00:00	818479
143	DVN	Devon Energy Corp.	Energy	Oil & Gas Exploration & Production	Oklahoma City, Oklahoma	\N	1090012
144	DLR	Digital Realty Trust	Real Estate	Specialized REITs	San Francisco, California	2016-05-18 00:00:00	1297996
145	DFS	Discover Financial Services	Financials	Consumer Finance	Riverwoods, Illinois	2007-07-02 00:00:00	1393612
146	DISCA	Discovery Communications-A	Consumer Discretionary	Cable & Satellite	Silver Spring, Maryland	2010-03-01 00:00:00	1437107
147	DISCK	Discovery Communications-C	Consumer Discretionary	Cable & Satellite	Silver Spring, Maryland	2014-08-07 00:00:00	1437107
148	DG	Dollar General	Consumer Discretionary	General Merchandise Stores	Goodlettsville, Tennessee	2012-12-03 00:00:00	29534
149	DLTR	Dollar Tree	Consumer Discretionary	General Merchandise Stores	Chesapeake, Virginia	2011-12-19 00:00:00	935703
150	D	Dominion Resources	Utilities	Electric Utilities	Richmond, Virginia	\N	715957
151	DOV	Dover Corp.	Industrials	Industrial Machinery	Downers Grove, Illinois	1985-10-31 00:00:00	29905
152	DOW	Dow Chemical	Materials	Diversified Chemicals	Midland, Michigan	\N	29915
153	DPS	Dr Pepper Snapple Group	Consumer Staples	Soft Drinks	Plano, Texas	2008-10-07 00:00:00	1418135
154	DTE	DTE Energy Co.	Utilities	MultiUtilities	Detroit, Michigan	\N	936340
155	DD	Du Pont (E.I.)	Materials	Diversified Chemicals	Wilmington, Delaware	\N	30554
156	DUK	Duke Energy	Utilities	Electric Utilities	Charlotte, North Carolina	1976-06-30 00:00:00	1326160
157	DNB	Dun & Bradstreet	Industrials	Data Processing Services	Short Hills, New Jersey	2008-12-02 00:00:00	1115222
158	ETFC	E*Trade	Financials	Investment Banking & Brokerage	New York, New York	2004-03-31 00:00:00	1015780
159	EMN	Eastman Chemical	Materials	Diversified Chemicals	Kingsport, Tennessee	1994-01-01 00:00:00	915389
160	ETN	Eaton Corporation	Industrials	Industrial Conglomerates	Dublin, Ireland	\N	1551182
161	EBAY	eBay Inc.	Information Technology	Internet Software & Services	San Jose, California	\N	1065088
162	ECL	Ecolab Inc.	Materials	Specialty Chemicals	St. Paul, Minnesota	1989-01-31 00:00:00	31462
163	EIX	Edison Int'l	Utilities	Electric Utilities	Rosemead, California	\N	827052
164	EW	Edwards Lifesciences	Health Care	Health Care Equipment	Irvine, California	2011-04-01 00:00:00	1099800
165	EA	Electronic Arts	Information Technology	Home Entertainment Software	Redwood City, California	\N	712515
166	EMR	Emerson Electric Company	Industrials	Industrial Conglomerates	Ferguson, Missouri	1965-03-31 00:00:00	32604
167	ENDP	Endo International	Health Care	Pharmaceuticals	Dublin, Ireland	2015-01-27 00:00:00	1100962
168	ETR	Entergy Corp.	Utilities	Electric Utilities	New Orleans, Louisiana	\N	65984
169	EVHC	Envision Healthcare Corp	Health Care	Health Care Services	Nashville, Tennessee	2016-12-02 00:00:00	895930
170	EOG	EOG Resources	Energy	Oil & Gas Exploration & Production	Houston, Texas	\N	821189
171	EQT	EQT Corporation	Energy	Oil & Gas Exploration & Production	Pittsburgh, Pennsylvania	2008-12-19 00:00:00	33213
172	EFX	Equifax Inc.	Financials	Diversified Financial Services	Atlanta, Georgia	\N	33185
173	EQIX	Equinix	Real Estate	REITs	Redwood City, California	2015-03-20 00:00:00	1101239
174	EQR	Equity Residential	Real Estate	REITs	Chicago, Illinois	\N	906107
175	ESS	Essex Property Trust, Inc.	Real Estate	Residential REITs	Palo Alto, California	2014-04-02 00:00:00	920522
176	EL	Estee Lauder Cos.	Consumer Staples	Personal Products	New York, New York	\N	1001250
177	ES	Eversource Energy	Utilities	MultiUtilities	Springfield, Massachusetts	\N	72741
178	EXC	Exelon Corp.	Utilities	MultiUtilities	Chicago, Illinois	\N	1109357
179	EXPE	Expedia Inc.	Consumer Discretionary	Internet & Direct Marketing Retail	Bellevue, Washington	2007-10-02 00:00:00	1324424
180	EXPD	Expeditors Int'l	Industrials	Air Freight & Logistics	Seattle, Washington	2007-10-10 00:00:00	746515
181	ESRX	Express Scripts	Health Care	Health Care Distributors	Cool Valley, Missouri	2003-09-25 00:00:00	1532063
182	EXR	Extra Space Storage	Real Estate	Specialized REITs	Salt Lake City, UT	2016-01-19 00:00:00	1289490
183	XOM	Exxon Mobil Corp.	Energy	Integrated Oil & Gas	Irving, Texas	\N	34088
184	FFIV	F5 Networks	Information Technology	Networking Equipment	Seattle, Washington	2010-12-20 00:00:00	1048695
185	FB	Facebook	Information Technology	Internet Software & Services	Menlo Park, California	2013-12-23 00:00:00	1326801
186	FAST	Fastenal Co	Industrials	Building Products	Winona, Minnesota	2009-09-15 00:00:00	815556
187	FRT	Federal Realty Investment Trust	Real Estate	Retail REITs	Rockville, Maryland	2016-02-01 00:00:00	34903
188	FDX	FedEx Corporation	Industrials	Air Freight & Logistics	Memphis, Tennessee	1980-12-31 00:00:00	1048911
189	FIS	Fidelity National Information Services	Information Technology	Internet Software & Services	Jacksonville, Florida	\N	1136893
190	FITB	Fifth Third Bancorp	Financials	Banks	Cincinnati, Ohio	\N	35527
191	FSLR	First Solar Inc	Information Technology	Semiconductors	Tempe, Arizona	2009-10-16 00:00:00	1274494
192	FE	FirstEnergy Corp	Utilities	Electric Utilities	Akron, Ohio	\N	1031296
193	FISV	Fiserv Inc	Information Technology	Internet Software & Services	Brookfield, Wisconsin	\N	798354
194	FLIR	FLIR Systems	Industrials	Aerospace & Defense	Wilsonville, Oregon	2009-01-02 00:00:00	354908
195	FLS	Flowserve Corporation	Industrials	Industrial Machinery	Irving, Texas	2008-10-02 00:00:00	30625
196	FLR	Fluor Corp.	Industrials	Diversified Commercial Services	Irving, Texas	1980-03-31 00:00:00	1124198
197	FMC	FMC Corporation	Materials	Diversified Chemicals	Philadelphia, Pennsylvania	2009-08-19 00:00:00	37785
198	FTI	FMC Technologies Inc.	Energy	Oil & Gas Equipment & Services	Houston, Texas	2009-06-05 00:00:00	1135152
199	FL	Foot Locker Inc	Consumer Discretionary	Apparel Retail	New York, New York	2016-04-04 00:00:00	850209
200	F	Ford Motor	Consumer Discretionary	Automobile Manufacturers	Dearborn, Michigan	\N	37996
201	FTV	Fortive Corp	Industrials	Industrial Machinery	Everett, Washington	2016-07-01 00:00:00	1659166
202	FBHS	Fortune Brands Home & Security	Industrials	Building Products	Deerfield, Illinois	2016-06-22 00:00:00	1519751
203	BEN	Franklin Resources	Financials	Asset Management & Custody Banks	San Mateo, California	\N	38777
204	FCX	Freeport-McMoran Cp & Gld	Materials	Copper	Phoenix, Arizona	\N	831259
205	FTR	Frontier Communications	Telecommunications Services	Integrated Telecommunications Services	Stamford, Connecticut	\N	20520
206	GPS	Gap (The)	Consumer Discretionary	Apparel Retail	San Francisco, California	1986-08-31 00:00:00	39911
207	GRMN	Garmin Ltd.	Consumer Discretionary	Consumer Electronics	Schaffhausen, Switzerland	2012-12-12 00:00:00	1121788
208	GD	General Dynamics	Industrials	Aerospace & Defense	Falls Church, Virginia	\N	40533
209	GE	General Electric	Industrials	Industrial Conglomerates	Fairfield, Connecticut	\N	40545
210	GGP	General Growth Properties Inc.	Real Estate	REITs	Chicago, Illinois	2013-12-10 00:00:00	895648
211	GIS	General Mills	Consumer Staples	Packaged Foods & Meats	Golden Valley, Minnesota	1969-03-31 00:00:00	40704
212	GM	General Motors	Consumer Discretionary	Automobile Manufacturers	Detroit, Michigan	2013-06-06 00:00:00	1467858
213	GPC	Genuine Parts	Consumer Discretionary	Specialty Stores	Atlanta, Georgia	1973-12-31 00:00:00	40987
214	GILD	Gilead Sciences	Health Care	Biotechnology	Foster City, California	\N	882095
215	GPN	Global Payments Inc	Information Technology	Data Processing & Outsourced Services	Atlanta, Georgia	2016-04-25 00:00:00	1123360
216	GS	Goldman Sachs Group	Financials	Investment Banking & Brokerage	New York, New York	\N	886982
217	GT	Goodyear Tire & Rubber	Consumer Discretionary	Tires & Rubber	Akron, Ohio	\N	42582
218	GWW	Grainger (W.W.) Inc.	Industrials	Industrial Materials	Lake Forest, Illinois	1981-06-30 00:00:00	277135
219	HAL	Halliburton Co.	Energy	Oil & Gas Equipment & Services	Houston, Texas	\N	45012
220	HBI	Hanesbrands Inc	Consumer Discretionary	Apparel, Accessories & Luxury Goods	Winston-Salem, North Carolina	2015-03-20 00:00:00	1359841
221	HOG	Harley-Davidson	Consumer Discretionary	Motorcycle Manufacturers	Milwaukee, Wisconsin	\N	793952
222	HAR	Harman Int'l Industries	Consumer Discretionary	Consumer Electronics	Stamford, Connecticut	\N	800459
223	HRS	Harris Corporation	Information Technology	Telecommunications Equipment	Melbourne, Florida	2008-09-22 00:00:00	202058
224	HIG	Hartford Financial Svc.Gp.	Financials	Property & Casualty Insurance	Hartford, Connecticut	\N	874766
225	HAS	Hasbro Inc.	Consumer Discretionary	Leisure Products	Pawtucket, Rhode Island	1984-09-30 00:00:00	46080
226	HCA	HCA Holdings	Health Care	Health Care Facilities	Nashville, Tennessee	2015-01-27 00:00:00	860730
227	HCP	HCP Inc.	Real Estate	REITs	Long Beach, California	2008-03-31 00:00:00	765880
228	HP	Helmerich & Payne	Energy	Oil & Gas Drilling	Tulsa, Oklahoma[5]	\N	46765
229	HES	Hess Corporation	Energy	Integrated Oil & Gas	New York, New York	1984-05-31 00:00:00	4447
230	HPE	Hewlett Packard Enterprise	Information Technology	Technology Hardware, Storage & Peripherals	Palo Alto, California	2015-11-02 00:00:00	1645590
231	HOLX	Hologic	Health Care	Health Care Equipment	Marlborough, Massachusetts	2016-03-30 00:00:00	859737
232	HD	Home Depot	Consumer Discretionary	Home Improvement Retail	Atlanta, Georgia	1988-03-31 00:00:00	354950
233	HON	Honeywell Int'l Inc.	Industrials	Industrial Conglomerates	Morristown, New Jersey	1964-03-31 00:00:00	773840
234	HRL	Hormel Foods Corp.	Consumer Staples	Packaged Foods & Meats	Austin, Minnesota	2009-03-04 00:00:00	48465
235	HST	Host Hotels & Resorts	Real Estate	REITs	Bethesda, Maryland	2007-03-20 00:00:00	1070750
236	HPQ	HP Inc.	Information Technology	Computer Hardware	Palo Alto, California	1974-12-31 00:00:00	47217
237	HUM	Humana Inc.	Health Care	Managed Health Care	Louisville, Kentucky	\N	49071
238	HBAN	Huntington Bancshares	Financials	Banks	Columbus, Ohio	\N	49196
239	ITW	Illinois Tool Works	Industrials	Industrial Machinery	Glenview, Illinois	1986-02-28 00:00:00	49826
240	ILMN	Illumina Inc	Health Care	Life Sciences Tools & Services	San Diego, California	2015-11-19 00:00:00	1110803
241	IR	Ingersoll-Rand PLC	Industrials	Industrial Conglomerates	Dublin, Ireland	2010-11-17 00:00:00	1466258
242	INTC	Intel Corp.	Information Technology	Semiconductors	Santa Clara, California	1976-12-31 00:00:00	50863
243	ICE	Intercontinental Exchange	Financials	Diversified Financial Services	Atlanta, Georgia	2007-09-26 00:00:00	1571949
244	IBM	International Business Machines	Information Technology	IT Consulting & Other Services	Armonk, New York	\N	51143
245	IP	International Paper	Materials	Paper Packaging	Memphis, Tennessee	\N	51434
246	IPG	Interpublic Group	Consumer Discretionary	Advertising	New York, New York	1992-10-01 00:00:00	51644
247	IFF	Intl Flavors & Fragrances	Materials	Specialty Chemicals	New York, New York	1976-03-31 00:00:00	51253
248	INTU	Intuit Inc.	Information Technology	Internet Software & Services	Mountain View, California	2000-12-05 00:00:00	896878
249	ISRG	Intuitive Surgical Inc.	Health Care	Health Care Equipment	Sunnyvale, California	2008-06-02 00:00:00	1035267
250	IVZ	Invesco Ltd.	Financials	Asset Management & Custody Banks	Atlanta, Georgia	2008-08-21 00:00:00	914208
251	IRM	Iron Mountain Incorporated	Real Estate	REITs	Boston, Massachusetts	2009-01-06 00:00:00	1020569
252	JEC	Jacobs Engineering Group	Industrials	Industrial Conglomerates	Pasadena, California	2007-10-26 00:00:00	52988
253	JBHT	J. B. Hunt Transport Services	Industrials	Trucking	Lowell, Arkansas	2015-07-01 00:00:00	728535
254	SJM	JM Smucker	Consumer Staples	Packaged Foods & Meats	Orrville, Ohio	2008-11-06 00:00:00	91419
255	JNJ	Johnson & Johnson	Health Care	Health Care Equipment	New Brunswick, New Jersey	1973-06-30 00:00:00	200406
256	JCI	Johnson Controls International	Industrials	Building Products	Cork, Ireland	2010-08-27 00:00:00	833444
257	JPM	JPMorgan Chase & Co.	Financials	Banks	New York, New York	1975-06-30 00:00:00	19617
258	JNPR	Juniper Networks	Information Technology	Networking Equipment	Sunnyvale, California	\N	1043604
259	KSU	Kansas City Southern	Industrials	Railroads	Kansas City, Missouri	2013-05-24 00:00:00	54480
260	K	Kellogg Co.	Consumer Staples	Packaged Foods & Meats	Battle Creek, Michigan	\N	55067
261	KEY	KeyCorp	Financials	Banks	Cleveland, Ohio	1994-03-01 00:00:00	91576
262	KMB	Kimberly-Clark	Consumer Staples	Household Products	Irving, Texas	\N	55785
263	KIM	Kimco Realty	Real Estate	REITs	New Hyde Park, New York	\N	879101
264	KMI	Kinder Morgan	Energy	Oil & Gas Refining & Marketing & Transportation	Houston, Texas	2012-05-25 00:00:00	1506307
265	KLAC	KLA-Tencor Corp.	Information Technology	Semiconductor Equipment	Milpitas, California	\N	319201
266	KSS	Kohl's Corp.	Consumer Discretionary	General Merchandise Stores	Menomonee Falls, Wisconsin	\N	885639
267	KHC	Kraft Heinz Co	Consumer Staples	Packaged Foods & Meats	Pittsburgh, Pennsylvania	2015-07-06 00:00:00	1545158
268	KR	Kroger Co.	Consumer Staples	Food Retail	Cincinnati, Ohio	\N	56873
269	LB	L Brands Inc.	Consumer Discretionary	Apparel Retail	Columbus, Ohio	1983-09-30 00:00:00	701985
270	LLL	L-3 Communications Holdings	Industrials	Industrial Conglomerates	New York, New York	\N	1056239
271	LH	Laboratory Corp. of America Holding	Health Care	Health Care Facilities	Burlington, North Carolina	\N	920148
272	LRCX	Lam Research	Information Technology	Semiconductor Equipment	Fremont, California	2012-06-29 00:00:00	707549
273	LEG	Leggett & Platt	Industrials	Industrial Conglomerates	Carthage, Missouri	\N	58492
274	LEN	Lennar Corp.	Consumer Discretionary	Homebuilding	Miami, Florida	\N	920760
275	LVLT	Level 3 Communications	Telecommunications Services	Alternative Carriers	Broomfield, Colorado	2014-11-05 00:00:00	794323
276	LUK	Leucadia National Corp.	Financials	Multi-Sector Holdings	New York, New York	2007-08-27 00:00:00	96223
277	LLY	Lilly (Eli) & Co.	Health Care	Pharmaceuticals	Indianapolis, Indiana	1970-12-31 00:00:00	59478
278	LNC	Lincoln National	Financials	Multi-line Insurance	Radnor, Pennsylvania	1976-06-30 00:00:00	59558
279	LLTC	Linear Technology Corp.	Information Technology	Semiconductors	Milpitas, California	\N	791907
280	LKQ	LKQ Corporation	Consumer Discretionary	Distributors	Chicago, Illinois	2016-05-23 00:00:00	1065696
281	LMT	Lockheed Martin Corp.	Industrials	Aerospace & Defense	Bethesda, Maryland	1984-07-31 00:00:00	936468
282	L	Loews Corp.	Financials	Multi-Sector Holdings	New York, New York	\N	60086
283	LOW	Lowe's Cos.	Consumer Discretionary	Home Improvement Retail	Mooresville, North Carolina	1984-02-29 00:00:00	60667
284	LYB	LyondellBasell	Materials	Diversified Chemicals	Rotterdam, Netherlands	2012-09-05 00:00:00	1489393
285	MAA	Mid-America Apartments	Real Estate	Residential REITs	Memphis, Tennessee	2016-12-01 00:00:00	912595
286	MTB	M&T Bank Corp.	Financials	Banks	Buffalo, New York	\N	36270
287	MAC	Macerich	Real Estate	Retail REITs	Santa Monica, California	2013-05-09 00:00:00	912242
288	M	Macy's Inc.	Consumer Discretionary	Department Stores	Cincinnati, Ohio	\N	794367
289	MNK	Mallinckrodt Plc	Health Care	Pharmaceuticals	Dublin, Ireland	2014-08-19 00:00:00	1567892
290	MRO	Marathon Oil Corp.	Energy	Oil & Gas Exploration & Production	Houston, Texas	1991-05-01 00:00:00	101778
291	MPC	Marathon Petroleum	Energy	Oil & Gas Refining & Marketing & Transportation	Findlay, Ohio	2011-07-01 00:00:00	1510295
292	MAR	Marriott Int'l.	Consumer Discretionary	Hotels, Resorts & Cruise Lines	Bethesda, Maryland	\N	1048286
293	MMC	Marsh & McLennan	Financials	Insurance Brokers	New York, New York	1987-08-31 00:00:00	62709
294	MLM	Martin Marietta Materials	Materials	Construction Materials	Raleigh, North Carolina	2014-07-02 00:00:00	916076
295	MAS	Masco Corp.	Industrials	Building Products	Taylor, Michigan	1981-06-30 00:00:00	62996
296	MA	Mastercard Inc.	Information Technology	Internet Software & Services	Harrison, New York	2008-07-18 00:00:00	1141391
297	MAT	Mattel Inc.	Consumer Discretionary	Leisure Products	El Segundo, California	1982-03-31 00:00:00	63276
298	MKC	McCormick & Co.	Consumer Staples	Packaged Foods & Meats	Sparks, Maryland	\N	63754
299	MCD	McDonald's Corp.	Consumer Discretionary	Restaurants	Oak Brook, Illinois	1970-06-30 00:00:00	63908
300	MCK	McKesson Corp.	Health Care	Health Care Distributors	San Francisco, California	\N	927653
301	MJN	Mead Johnson	Consumer Staples	Packaged Foods & Meats	Glenview, Illinois	2009-12-21 00:00:00	1452575
302	MDT	Medtronic plc	Health Care	Health Care Equipment	Dublin, Ireland	1986-10-31 00:00:00	64670
303	MRK	Merck & Co.	Health Care	Pharmaceuticals	Whitehouse Station, New Jersey	\N	310158
304	MET	MetLife Inc.	Financials	Life & Health Insurance	New York, New York	\N	1099219
305	MTD	Mettler Toledo	Health Care	Life Sciences Tools & Services	Columbus, Ohio	2016-09-06 00:00:00	1037646
306	KORS.N	Michael Kors Holdings	Consumer Discretionary	Apparel, Accessories & Luxury Goods	New York, New York	2013-11-13 00:00:00	1530721
307	MCHP	Microchip Technology	Information Technology	Semiconductors	Chandler, Arizona	2007-09-07 00:00:00	827054
308	MU	Micron Technology	Information Technology	Semiconductors	Boise, Idaho	1994-09-27 00:00:00	723125
309	MSFT	Microsoft Corp.	Information Technology	Systems Software	Redmond, Washington	1994-06-01 00:00:00	789019
310	MHK	Mohawk Industries	Consumer Discretionary	Home Furnishings	Amsterdam, New York	2013-12-23 00:00:00	851968
311	TAP	Molson Coors Brewing Company	Consumer Staples	Brewers	Denver, Colorado	1976-06-30 00:00:00	24545
312	MDLZ	Mondelez International	Consumer Staples	Packaged Foods & Meats	Northfield, Illinois	2012-10-02 00:00:00	1103982
313	MON	Monsanto Co.	Materials	Fertilizers & Agricultural Chemicals	Creve Coeur, Missouri	2002-08-07 00:00:00	1110783
314	MNST	Monster Beverage	Consumer Staples	Soft Drinks	Corona, California	2012-06-28 00:00:00	865752
315	MCO	Moody's Corp	Financials	Diversified Financial Services	New York, New York	\N	1059556
316	MS	Morgan Stanley	Financials	Investment Banking & Brokerage	New York, New York	\N	895421
317	MOS	The Mosaic Company	Materials	Fertilizers & Agricultural Chemicals	Plymouth, Minnesota	2011-09-26 00:00:00	1285785
318	MSI	Motorola Solutions Inc.	Information Technology	Telecommunications Equipment	Schaumburg, Illinois	\N	68505
319	MUR	Murphy Oil	Energy	Integrated Oil & Gas	El Dorado, Arkansas	\N	717423
320	MYL	Mylan N.V.	Health Care	Pharmaceuticals	Amsterdam, Netherlands	\N	69499
321	NDAQ	NASDAQ OMX Group	Financials	Diversified Financial Services	New York, New York	2008-10-22 00:00:00	1120193
322	NOV	National Oilwell Varco Inc.	Energy	Oil & Gas Equipment & Services	Houston, Texas	\N	1021860
323	NAVI	Navient	Financials	Consumer Finance	Newark, Delaware	2014-05-01 00:00:00	1593538
324	NTAP	NetApp	Information Technology	Internet Software & Services	Sunnyvale, California	\N	1002047
325	NFLX	Netflix Inc.	Information Technology	Internet Software & Services	Los Gatos, California	2010-12-20 00:00:00	1065280
326	NWL	Newell Brands	Consumer Discretionary	Housewares & Specialties	Sandy Springs, Georgia	1989-04-30 00:00:00	814453
327	NFX	Newfield Exploration Co	Energy	Oil & Gas Exploration & Production	Houston, Texas	2010-12-20 00:00:00	912750
328	NEM	Newmont Mining Corp. (Hldg. Co.)	Materials	Gold	Denver, Colorado	1969-06-30 00:00:00	1164727
329	NWSA	News Corp. Class A	Consumer Discretionary	Publishing	New York, New York	2013-08-01 00:00:00	1564708
330	NWS	News Corp. Class B	Consumer Discretionary	Publishing	New York, New York	2015-09-18 00:00:00	1564708
331	NEE	NextEra Energy	Utilities	MultiUtilities	Juno Beach, Florida	1976-06-30 00:00:00	753308
332	NLSN	Nielsen Holdings	Industrials	Research & Consulting Services	New York, New York	2013-07-09 00:00:00	1492633
333	NKE	Nike	Consumer Discretionary	Apparel, Accessories & Luxury Goods	Washington County, Oregon	1988-11-30 00:00:00	320187
334	NI	NiSource Inc.	Utilities	MultiUtilities	Merrillville, Indiana	\N	1111711
335	NBL	Noble Energy Inc	Energy	Oil & Gas Exploration & Production	Houston, Texas	2007-10-08 00:00:00	72207
336	JWN	Nordstrom	Consumer Discretionary	Department Stores	Seattle, Washington	1986-08-31 00:00:00	72333
337	NSC	Norfolk Southern Corp.	Industrials	Railroads	Norfolk, Virginia	\N	702165
338	NTRS	Northern Trust Corp.	Financials	Asset Management & Custody Banks	Chicago, Illinois	\N	73124
339	NOC	Northrop Grumman Corp.	Industrials	Aerospace & Defense	West Falls Church, Virginia	1985-06-30 00:00:00	1133421
340	NRG	NRG Energy	Utilities	Independent Power Producers & Energy Traders	Princeton, New Jersey	2010-01-29 00:00:00	1013871
341	NUE	Nucor Corp.	Materials	Steel	Charlotte, North Carolina	1985-04-30 00:00:00	73309
342	NVDA	Nvidia Corporation	Information Technology	Semiconductors	Santa Clara, California	\N	1045810
343	ORLY	O'Reilly Automotive	Consumer Discretionary	Specialty Stores	Springfield, Missouri	2009-03-27 00:00:00	898173
344	OXY	Occidental Petroleum	Energy	Oil & Gas Exploration & Production	Los Angeles, California	1982-12-31 00:00:00	797468
345	OMC	Omnicom Group	Consumer Discretionary	Advertising	New York, New York	\N	29989
346	OKE	ONEOK	Energy	Oil & Gas Exploration & Production	Tulsa, Oklahoma	2010-03-15 00:00:00	1039684
347	ORCL	Oracle Corp.	Information Technology	Application Software	Redwood Shores, California	1989-08-31 00:00:00	1341439
348	PCAR	PACCAR Inc.	Industrials	Construction & Farm Machinery & Heavy Trucks	Bellevue, Washington	1980-12-31 00:00:00	75362
349	PH	Parker-Hannifin	Industrials	Industrial Conglomerates	Cleveland, Ohio	1985-11-30 00:00:00	76334
350	PDCO	Patterson Companies	Health Care	Health Care Supplies	St. Paul, Minnesota	\N	891024
351	PAYX	Paychex Inc.	Information Technology	Internet Software & Services	Penfield, New York	\N	723531
352	PYPL	PayPal	Information Technology	Data Processing & Outsourced Services	San Jose, California	2015-07-20 00:00:00	1633917
353	PNR	Pentair Ltd.	Industrials	Industrial Conglomerates	Worsley, UK	2012-10-01 00:00:00	77360
354	PBCT	People's United Financial	Financials	Thrifts & Mortgage Finance	Bridgeport, Connecticut	2008-11-13 00:00:00	1378946
355	PEP	PepsiCo Inc.	Consumer Staples	Soft Drinks	Purchase, New York	\N	77476
356	PKI	PerkinElmer	Health Care	Health Care Equipment	Waltham, Massachusetts	1985-05-31 00:00:00	31791
357	PRGO	Perrigo	Health Care	Pharmaceuticals	Dublin, Ireland	2011-12-19 00:00:00	1585364
358	PFE	Pfizer Inc.	Health Care	Pharmaceuticals	New York, New York	\N	78003
359	PCG	PG&E Corp.	Utilities	MultiUtilities	San Francisco, California	\N	1004980
360	PM	Philip Morris International	Consumer Staples	Tobacco	New York, New York	2008-03-31 00:00:00	1413329
361	PSX	Phillips 66	Energy	Oil & Gas Refining & Marketing & Transportation	Houston, Texas	2012-05-01 00:00:00	1534701
362	PNW	Pinnacle West Capital	Utilities	MultiUtilities	Phoenix, Arizona	\N	764622
363	PXD	Pioneer Natural Resources	Energy	Oil & Gas Exploration & Production	Irving, Texas	2008-09-24 00:00:00	1038357
364	PBI	Pitney-Bowes	Industrials	Technology, Hardware, Software and Supplies	Stamford, Connecticut	\N	78814
365	PNC	PNC Financial Services	Financials	Banks	Pittsburgh, Pennsylvania	1988-04-30 00:00:00	713676
366	RL	Polo Ralph Lauren Corp.	Consumer Discretionary	Apparel, Accessories & Luxury Goods	New York, New York	2007-02-02 00:00:00	1037038
367	PPG	PPG Industries	Materials	Diversified Chemicals	Pittsburgh, Pennsylvania	\N	79879
368	PPL	PPL Corp.	Utilities	Electric Utilities	Allentown, Pennsylvania	\N	922224
369	PX	Praxair Inc.	Materials	Industrial Gases	Danbury, Connecticut	1992-07-01 00:00:00	884905
370	PCLN	Priceline.com Inc	Consumer Discretionary	Internet & Direct Marketing Retail	Norwalk, Connecticut	2009-11-06 00:00:00	1075531
371	PFG	Principal Financial Group	Financials	Diversified Financial Services	Des Moines, Iowa	\N	1126328
372	PG	Procter & Gamble	Consumer Staples	Personal Products	Cincinnati, Ohio	\N	80424
373	PGR	Progressive Corp.	Financials	Property & Casualty Insurance	Mayfield Village, Ohio	\N	80661
374	PLD	Prologis	Real Estate	REITs	San Francisco, California	\N	1045609
375	PRU	Prudential Financial	Financials	Diversified Financial Services	Newark, New Jersey	\N	1137774
376	PEG	Public Serv. Enterprise Inc.	Utilities	Electric Utilities	Newark, New Jersey	\N	788784
377	PSA	Public Storage	Real Estate	REITs	Glendale, California	\N	1393311
378	PHM	Pulte Homes Inc.	Consumer Discretionary	Homebuilding	Atlanta, Georgia	1984-04-30 00:00:00	822416
379	PVH	PVH Corp.	Consumer Discretionary	Apparel, Accessories & Luxury Goods	New York, New York	2013-02-15 00:00:00	78239
380	QRVO	Qorvo	Information Technology	Semiconductors	Greensboro, North Carolina	2015-06-11 00:00:00	1604778
381	PWR	Quanta Services Inc.	Industrials	Industrial Conglomerates	Houston, Texas	2009-07-01 00:00:00	1050915
382	QCOM	QUALCOMM Inc.	Information Technology	Semiconductors	San Diego, California	\N	804328
383	DGX	Quest Diagnostics	Health Care	Health Care Facilities	Madison, New Jersey	\N	1022079
384	RRC	Range Resources Corp.	Energy	Oil & Gas Exploration & Production	Fort Worth, Texas	2007-12-21 00:00:00	315852
385	RTN	Raytheon Co.	Industrials	Aerospace & Defense	Waltham, Massachusetts	\N	1047122
386	O	Realty Income Corporation	Real Estate	REITs	San Diego, California	2015-04-07 00:00:00	726728
387	RHT	Red Hat Inc.	Information Technology	Systems Software	Raleigh, North Carolina	2009-07-27 00:00:00	1087423
388	REGN	Regeneron	Health Care	Biotechnology	Tarrytown, New York	2013-05-01 00:00:00	872589
389	RF	Regions Financial Corp.	Financials	Diversified Financial Services	Birmingham, Alabama	\N	1281761
390	RSG	Republic Services Inc	Industrials	Industrial Conglomerates	Phoenix, Arizona	2008-12-05 00:00:00	1060391
391	RAI	Reynolds American Inc.	Consumer Staples	Tobacco	Winston-Salem, North Carolina	\N	1275283
392	RHI	Robert Half International	Industrials	Human Resource & Employment Services	Menlo Park, California	\N	315213
393	ROK	Rockwell Automation Inc.	Industrials	Industrial Conglomerates	Milwaukee, Wisconsin	\N	1024478
394	COL	Rockwell Collins	Industrials	Industrial Conglomerates	Cedar Rapids, Iowa	\N	1137411
395	ROP	Roper Industries	Industrials	Industrial Conglomerates	Sarasota, Florida	2009-12-23 00:00:00	882835
396	ROST	Ross Stores	Consumer Discretionary	Apparel Retail	Pleasanton, California	2009-12-21 00:00:00	745732
397	RCL	Royal Caribbean Cruises Ltd	Consumer Discretionary	Hotels, Resorts & Cruise Lines	Miami, Florida	2014-12-05 00:00:00	884887
398	R	Ryder System	Industrials	Industrial Conglomerates	Miami, Florida	1982-12-31 00:00:00	85961
399	CRM	Salesforce.com	Information Technology	Internet Software & Services	San Francisco, California	2008-09-15 00:00:00	1108524
400	SCG	SCANA Corp	Utilities	MultiUtilities	Cayce, South Carolina	2009-01-02 00:00:00	754737
401	SLB	Schlumberger Ltd.	Energy	Oil & Gas Equipment & Services	Curaçao, Kingdom of the Netherlands	1965-03-31 00:00:00	87347
402	SNI	Scripps Networks Interactive Inc.	Consumer Discretionary	Broadcasting & Cable TV	Cincinnati, Ohio	2008-07-01 00:00:00	1430602
403	STX	Seagate Technology	Information Technology	Computer Storage & Peripherals	Dublin, Ireland	2012-07-02 00:00:00	1137789
404	SEE	Sealed Air	Materials	Paper Packaging	Elmwood Park, New Jersey	\N	1012100
405	SRE	Sempra Energy	Utilities	MultiUtilities	San Diego, California	\N	1032208
406	SHW	Sherwin-Williams	Materials	Specialty Chemicals	Cleveland, Ohio	1964-06-30 00:00:00	89800
407	SIG	Signet Jewelers	Consumer Discretionary	Specialty Stores	Hamilton, Bermuda	2015-07-29 00:00:00	832988
408	SPG	Simon Property Group Inc	Real Estate	REITs	Indianapolis, Indiana	\N	1063761
409	SWKS	Skyworks Solutions	Information Technology	Semiconductors	Woburn, Massachusetts	2015-03-12 00:00:00	4127
410	SLG	SL Green Realty	Real Estate	Office REITs	New York, New York	2015-03-20 00:00:00	1040971
411	SNA	Snap-On Inc.	Consumer Discretionary	Household Appliances	Kenosha, Wisconsin	1982-09-30 00:00:00	91440
412	SO	Southern Co.	Utilities	Electric Utilities	Atlanta, Georgia	\N	92122
413	LUV	Southwest Airlines	Industrials	Airlines	Dallas, Texas	1994-07-01 00:00:00	92380
414	SWN	Southwestern Energy	Energy	Oil & Gas Exploration & Production	Houston, Texas[6]	2008-06-06 00:00:00	7332
415	SE	Spectra Energy Corp.	Energy	Oil & Gas Refining & Marketing & Transportation	Houston, Texas	\N	1373835
416	SPGI	S&P Global, Inc.	Financials	Diversified Financial Services	New York, New York	\N	64040
417	STJ	St Jude Medical	Health Care	Health Care Equipment	Little Canada, Minnesota	1989-11-30 00:00:00	203077
418	SWK	Stanley Black & Decker	Consumer Discretionary	Household Appliances	New Britain, Connecticut	1982-09-30 00:00:00	93556
419	SPLS	Staples Inc.	Consumer Discretionary	Specialty Stores	Framingham, Massachusetts	\N	791519
420	SBUX	Starbucks Corp.	Consumer Discretionary	Restaurants	Seattle, Washington	\N	829224
421	STT	State Street Corp.	Financials	Diversified Financial Services	Boston, Massachusetts	\N	93751
422	SRCL	Stericycle Inc	Industrials	Industrial Conglomerates	Lake Forest, Illinois	2008-11-19 00:00:00	861878
423	SYK	Stryker Corp.	Health Care	Health Care Equipment	Kalamazoo, Michigan	\N	310764
424	STI	SunTrust Banks	Financials	Banks	Atlanta, Georgia	1988-05-31 00:00:00	750556
425	SYMC	Symantec Corp.	Information Technology	Application Software	Mountain View, California	2003-03-25 00:00:00	849399
426	SYF	Synchrony Financial	Financials	Consumer Finance	Stamford, Connecticut	2015-11-18 00:00:00	1601712
427	SYY	Sysco Corp.	Consumer Staples	Food Distributors	Houston, Texas	1986-12-31 00:00:00	96021
428	TROW	T. Rowe Price Group	Financials	Diversified Financial Services	Baltimore, Maryland	\N	1113169
429	TGT	Target Corp.	Consumer Discretionary	General Merchandise Stores	Minneapolis, Minnesota	1976-12-31 00:00:00	27419
430	TEL	TE Connectivity Ltd.	Information Technology	Electronic Equipment & Instruments	Schaffhausen, Switzerland	2011-10-17 00:00:00	1385157
431	TGNA	Tegna, Inc.	Consumer Discretionary	Publishing	McLean, Virginia	1975-12-31 00:00:00	39899
432	TDC	Teradata Corp.	Information Technology	Application Software	Miamisburg, Ohio	2007-10-01 00:00:00	816761
433	TSO	Tesoro Petroleum Co.	Energy	Oil & Gas Refining & Marketing & Transportation	San Antonio, Texas	2007-09-27 00:00:00	50104
434	TXN	Texas Instruments	Information Technology	Semiconductors	Dallas, Texas	\N	97476
435	TXT	Textron Inc.	Industrials	Industrial Conglomerates	Providence, Rhode Island	1978-12-31 00:00:00	217346
436	COO	The Cooper Companies	Health Care	Health Care Supplies	Pleasanton, California	2016-09-23 00:00:00	711404
437	HSY	The Hershey Company	Consumer Staples	Packaged Foods & Meats	Hershey, Pennsylvania	\N	47111
438	TRV	The Travelers Companies Inc.	Financials	Property & Casualty Insurance	New York, New York	\N	86312
439	TMO	Thermo Fisher Scientific	Health Care	Health Care Equipment	Waltham, Massachusetts	\N	97745
440	TIF	Tiffany & Co.	Consumer Discretionary	Apparel, Accessories & Luxury Goods	New York, New York	\N	98246
441	TWX	Time Warner Inc.	Consumer Discretionary	Broadcasting & Cable TV	New York, New York	\N	1105705
442	TJX	TJX Companies Inc.	Consumer Discretionary	Apparel Retail	Framingham, Massachusetts	1985-09-30 00:00:00	109198
443	TMK	Torchmark Corp.	Financials	Life & Health Insurance	McKinney, Texas	1989-04-30 00:00:00	320335
444	TSS	Total System Services	Information Technology	Internet Software & Services	Columbus, Georgia	2008-01-02 00:00:00	721683
445	TSCO	Tractor Supply Company	Consumer Discretionary	Specialty Retail	Brentwood, Tennessee	2014-01-24 00:00:00	916365
446	TDG	TransDigm Group	Industrials	Aerospace & Defense	Cleveland, Ohio	2016-06-03 00:00:00	1260221
447	RIG	Transocean	Energy	Oil & Gas Drilling	Vernier, Switzerland	2013-10-29 00:00:00	1451505
448	TRIP	TripAdvisor	Consumer Discretionary	Internet & Direct Marketing Retail	Newton, Massachusetts	2011-12-21 00:00:00	1526520
449	FOXA	Twenty-First Century Fox Class A	Consumer Discretionary	Publishing	New York, New York	2013-07-01 00:00:00	1308161
450	FOX	Twenty-First Century Fox Class B	Consumer Discretionary	Publishing	New York, New York	2015-09-18 00:00:00	1308161
451	TSN	Tyson Foods	Consumer Staples	Packaged Foods & Meats	Springdale, Arkansas	\N	100493
452	UDR	UDR Inc	Real Estate	Residential REITs	Highlands Ranch, Colorado	2016-03-07 00:00:00	74208
453	ULTA	Ulta Salon Cosmetics & Fragrance Inc	Consumer Discretionary	Specialty Stores	Bolingbrook, Illinois	2016-04-18 00:00:00	1403568
454	USB	U.S. Bancorp	Financials	Banks	Minneapolis, Minnesota	\N	36104
455	UA	Under Armour	Consumer Discretionary	Apparel, Accessories & Luxury Goods	Baltimore, Maryland	2014-05-01 00:00:00	1336917
456	UAA	Under Armour	Consumer Discretionary	Apparel, Accessories & Luxury Goods	Baltimore, Maryland	2016-03-25 00:00:00	1336917
457	UNP	Union Pacific	Industrials	Railroads	Omaha, Nebraska	\N	100885
458	UAL	United Continental Holdings	Industrials	Airlines	Chicago, Illinois	2015-09-03 00:00:00	100517
459	UNH	United Health Group Inc.	Health Care	Managed Health Care	Minnetonka, Minnesota	1994-07-01 00:00:00	731766
460	UPS	United Parcel Service	Industrials	Air Freight & Logistics	Atlanta, Georgia	\N	1090727
461	URI	United Rentals, Inc.	Industrials	Trading Companies & Distributors	Stamford, Connecticut	2014-09-20 00:00:00	1067701
462	UTX	United Technologies	Industrials	Industrial Conglomerates	Hartford, Connecticut	\N	101829
463	UHS	Universal Health Services, Inc.	Health Care	Health Care Facilities	King of Prussia, Pennsylvania	2014-09-20 00:00:00	352915
464	UNM	Unum Group	Financials	Diversified Financial Services	Chattanooga, Tennessee	1994-03-01 00:00:00	5513
465	URBN	Urban Outfitters	Consumer Discretionary	Apparel Retail	Philadelphia, Pennsylvania	2010-02-08 00:00:00	912615
466	VFC	V.F. Corp.	Consumer Discretionary	Apparel, Accessories & Luxury Goods	Greensboro, North Carolina	1979-06-30 00:00:00	103379
467	VLO	Valero Energy	Energy	Oil & Gas Refining & Marketing & Transportation	San Antonio, Texas	\N	1035002
468	VAR	Varian Medical Systems	Health Care	Health Care Equipment	Palo Alto, California	2007-02-12 00:00:00	203527
469	VTR	Ventas Inc	Real Estate	REITs	Chicago, Illinois	2009-03-04 00:00:00	740260
470	VRSN	Verisign Inc.	Information Technology	Internet Software & Services	Dulles, Virginia	\N	1014473
471	VRSK	Verisk Analytics	Industrials	Research & Consulting Services	Jersey City, New Jersey	2015-10-08 00:00:00	1442145
472	VZ	Verizon Communications	Telecommunications Services	Integrated Telecommunications Services	New York, New York	1983-11-30 00:00:00	732712
473	VRTX	Vertex Pharmaceuticals Inc	Health Care	Biotechnology	Cambridge, Massachusetts	2013-09-23 00:00:00	875320
474	VIAB	Viacom Inc.	Consumer Discretionary	Broadcasting & Cable TV	New York, New York	\N	1339947
475	V	Visa Inc.	Information Technology	Internet Software & Services	San Francisco, California	2009-12-21 00:00:00	1403161
476	VNO	Vornado Realty Trust	Real Estate	REITs	New York, New York	\N	899689
477	VMC	Vulcan Materials	Materials	Construction Materials	Birmingham, Alabama	\N	1396009
478	WMT	Wal-Mart Stores	Consumer Staples	Hypermarkets & Super Centers	Bentonville, Arkansas	1982-08-31 00:00:00	104169
479	WBA	Walgreens Boots Alliance	Consumer Staples	Drug Retail	Deerfield, Illinois	1979-12-31 00:00:00	1618921
480	DIS	The Walt Disney Company	Consumer Discretionary	Broadcasting & Cable TV	Burbank, California	1976-06-30 00:00:00	1001039
481	WM	Waste Management Inc.	Industrials	Environmental Services	Houston, Texas	\N	823768
482	WAT	Waters Corporation	Health Care	Health Care Distributors	Milford, Massachusetts	\N	1000697
483	WEC	Wec Energy Group Inc	Utilities	Electric Utilities	Milwaukee, Wisconsin	2008-10-31 00:00:00	783325
484	WFC	Wells Fargo	Financials	Banks	San Francisco, California	1976-06-30 00:00:00	72971
485	HCN	Welltower Inc.	Real Estate	REITs	Toledo, Ohio	2009-01-30 00:00:00	766704
486	WDC	Western Digital	Information Technology	Computer Storage & Peripherals	Irvine, California	2009-07-01 00:00:00	106040
487	WU	Western Union Co	Information Technology	Internet Software & Services	Englewood, Colorado	\N	1365135
488	WRK	WestRock Company	Materials	Paper Packaging	Richmond, Virginia	\N	1636023
489	WY	Weyerhaeuser Corp.	Real Estate	REITs	Federal Way, Washington	\N	106535
490	WHR	Whirlpool Corp.	Consumer Discretionary	Household Appliances	Benton Harbor, Michigan	\N	106640
491	WFM	Whole Foods Market	Consumer Staples	Food Retail	Austin, Texas	\N	865436
492	WMB	Williams Cos.	Energy	Oil & Gas Exploration & Production	Tulsa, Oklahoma	1975-03-31 00:00:00	107263
493	WLTW	Willis Towers Watson	Financials	Insurance Brokers	London, United Kingdom	2016-01-05 00:00:00	1140536
494	WYN	Wyndham Worldwide	Consumer Discretionary	Hotels, Resorts & Cruise Lines	Parsippany, New Jersey	\N	1361658
495	WYNN	Wynn Resorts Ltd	Consumer Discretionary	Casinos & Gaming	Las Vegas, Nevada	2008-11-14 00:00:00	1174922
496	XEL	Xcel Energy Inc	Utilities	MultiUtilities	Minneapolis, Minnesota	\N	72903
497	XRX	Xerox Corp.	Information Technology	IT Consulting & Other Services	Norwalk, Connecticut	\N	108772
498	XLNX	Xilinx Inc	Information Technology	Semiconductors	San Jose, California	\N	743988
499	XL	XL Capital	Financials	Property & Casualty Insurance	Hamilton, Bermuda	\N	875159
500	XYL	Xylem Inc.	Industrials	Industrial Conglomerates	White Plains, New York	2011-11-01 00:00:00	1524472
501	YHOO	Yahoo Inc.	Information Technology	Internet Software & Services	Sunnyvale, California	\N	1011006
502	YUM	Yum! Brands Inc	Consumer Discretionary	Restaurants	Louisville, Kentucky	1997-10-06 00:00:00	1041061
503	ZBH	Zimmer Biomet Holdings	Health Care	Health Care Equipment	Warsaw, Indiana	\N	1136869
504	ZION	Zions Bancorp	Financials	Regional Banks	Salt Lake City, Utah	\N	109380
505	ZTS	Zoetis	Health Care	Pharmaceuticals	Florham Park, New Jersey	2013-06-21 00:00:00	1555280
\.


--
-- Name: symbols_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('symbols_id_seq', 505, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY users (id, name, email, password) FROM stdin;
1	admin	ad@min.com	$2b$12$UAyYD8C6y8NMvTtVxy6IP.usPRiwtNV1VUdlEpdWg3SVh6WoSi/sK
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Name: portfolio_symbols_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY portfolio_symbols
    ADD CONSTRAINT portfolio_symbols_pkey PRIMARY KEY (id);


--
-- Name: portfolios_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY portfolios
    ADD CONSTRAINT portfolios_pkey PRIMARY KEY (id);


--
-- Name: posts_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: symbols_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY symbols
    ADD CONSTRAINT symbols_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: portfolio_symbols_portfolio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY portfolio_symbols
    ADD CONSTRAINT portfolio_symbols_portfolio_id_fkey FOREIGN KEY (portfolio_id) REFERENCES portfolios(id);


--
-- Name: portfolio_symbols_symbol_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY portfolio_symbols
    ADD CONSTRAINT portfolio_symbols_symbol_id_fkey FOREIGN KEY (symbol_id) REFERENCES symbols(id);


--
-- Name: portfolios_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY portfolios
    ADD CONSTRAINT portfolios_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES users(id);


--
-- Name: posts_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_author_id_fkey FOREIGN KEY (author_id) REFERENCES users(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

