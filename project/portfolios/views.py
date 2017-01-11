"""Default view."""
########################
#        imports       #
########################
from project import db  # pragma: no cover
from project.models import Portfolio, Symbol, \
    PortfolioSymbols  # pragma: no cover
from forms import PortfolioForm, PortfolioSymbolForm  # pragma: no cover
from flask import render_template, Blueprint, flash, url_for, \
    redirect, request  # pragma: no cover
from flask_login import login_required, current_user  # pragma: no cover

##########################
#         config         #
##########################

portfolios_blueprint = Blueprint(
    'portfolios', __name__,
    template_folder='templates'
)

########################
#        routes        #
########################
# use decorators to link the function to a url


@portfolios_blueprint.route('/portfolios')
@login_required
def portfolios():
    """Portfolios."""
    # portfolios = db.session.query(Portfolio).all()
    portfolios = Portfolio.query.filter_by(owner_id=current_user.id)
    return render_template(
        'portfolios.html', portfolios=portfolios
    )


@portfolios_blueprint.route('/portfolios/new', methods=['GET', 'POST'])
@login_required
def new_portfolio():
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
        return redirect(url_for('portfolios.portfolios'))
    else:
        # portfolios = db.session.query(Portfolio).all()
        portfolios = Portfolio.query.filter_by(owner_id=current_user.id)
        return render_template(
            'new_portfolio.html', portfolios=portfolios, form=form, error=error
        )


@portfolios_blueprint.route('/portfolio/<portfolio_id>',
                            methods=['GET', 'POST'])
@login_required
def show_portfolio(portfolio_id):
    """Show portfolio."""
    error = None
    form = PortfolioSymbolForm(request.form)
    print form.errors
    portfolio = Portfolio.query.filter_by(id=portfolio_id).first()
    if form.is_submitted():
        symbol = Symbol.query.filter_by(id=form.symbol.data).first()
        print portfolio.id
        print symbol.id
        ps = PortfolioSymbols(
            form.number.data,
            form.price.data,
            form.date.data,
        )
        ps.symbol = symbol
        db.session.rollback()
        portfolio.portfo_symbols.append(ps)
        print ps.portfolio_id
        print ps.symbol_id
        db.session.add(ps)
        db.session.commit()
        return redirect(url_for('portfolios.show_portfolio',
                                portfolio_id=portfolio.id))
    else:
        return render_template('portfolio.html',
                               portfolio=portfolio, form=form, error=error)
