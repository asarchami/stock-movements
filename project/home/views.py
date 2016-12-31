"""Default view."""
########################
#        imports       #
########################
from project import db  # pragma: no cover
from project.models import BlogPost, Portfolio, Symbol  # pragma: no cover
from forms import MessageForm, PortfolioForm  # pragma: no cover
from flask import render_template, Blueprint, flash, url_for, \
    redirect, request, jsonify  # pragma: no cover
from flask_login import login_required, current_user  # pragma: no cover

##########################
#         config         #
##########################

home_blueprint = Blueprint(
    'home', __name__,
    template_folder='templates'
)

########################
#        routes        #
########################
# use decorators to link the function to a url


@home_blueprint.route('/', methods=['GET', 'POST'])
@login_required
def home():
    """Home Page."""
    error = None
    form = MessageForm(request.form)
    if form.validate_on_submit():
        new_message = BlogPost(
            form.title.data,
            form.description.data,
            current_user.id
        )
        db.session.add(new_message)
        db.session.commit()
        flash('New entry was successfully posted. Thanks.')
        return redirect(url_for('home.home'))
    else:
        posts = db.session.query(BlogPost).all()
        return render_template(
            'index.html', posts=posts, form=form, error=error
        )


@home_blueprint.route('/welcome')
def welcome():
    """Welcome page."""
    return render_template('welcome.html')


@home_blueprint.route('/portfolios', methods=['GET', 'POST'])
@login_required
def portfolios():
    """Portfolios."""
    error = None
    form = PortfolioForm(request.form)
    if form.validate_on_submit():
        new_portfolio = Portfolio(
            form.name.data,
            form.description.data,
            current_user.id
        )
        db.session.add(new_portfolio)
        db.session.commit()
        flash('New portfolio created')
        return redirect(url_for('home.portfolios'))
    else:
        # portfolios = db.session.query(Portfolio).all()
        portfolios = Portfolio.query.filter_by(owner_id=current_user.id)
        return render_template(
            'portfolios.html', portfolios=portfolios, form=form, error=error
        )


@home_blueprint.route('/portfolios/<int:portfolio_id>',
                      methods=['GET', 'POST'])
@login_required
def show_portfolio(portfolio_id):
    """Show portfolio."""
    error = None
    form = PortfolioForm(request.form)
    if form.validate_on_submit():
        new_portfolio = Portfolio(
            form.name.data,
            form.description.data,
            current_user.id
        )
        db.session.add(new_portfolio)
        db.session.commit()
        flash('New portfolio created')
        return redirect(url_for('home.portfolios'))
    else:
        # portfolios = db.session.query(Portfolio).all()
        portfolios = Portfolio.query.filter_by(owner_id=current_user.id)
        return render_template(
            'portfolios.html', portfolios=portfolios, form=form, error=error
        )


@home_blueprint.route('/symbols')
@login_required
def symbols():
    """Json for symbols."""
    return render_template('symbols.html')


@home_blueprint.route('/symbols_json')
@login_required
def symbols_json():
    """Json for symbols."""
    symbols = Symbol.query.all()
    return jsonify(symbols_list=[symbol.serialize for symbol in symbols])
