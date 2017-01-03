"""Default view."""
########################
#        imports       #
########################
from project.models import Symbol  # pragma: no cover
from flask import render_template, Blueprint, jsonify, \
    url_for  # pragma: no cover
from flask_login import login_required  # pragma: no cover
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
    # SITE_ROOT = os.path.realpath(os.path.dirname(__file__))
    # json_url = os.path.join(SITE_ROOT,
    #                         'static/datasets/news_quotes',
    #                         symbol, '.json')
    # data = json.load(open(json_url))
    # return render_template('show.html', data=data)
    # return jsonify(symb=[d.serialize for d in data])
    # return "<a href=%s>file</a>" % url_for('static', filename='datasets/news_quotes/A.json')
    return render_template('show.html', symbol=symbol)
