"""Forms for portfolios."""
from flask_wtf import FlaskForm
from wtforms import SelectField, DateTimeField, DecimalField, \
    IntegerField, TextField
from wtforms.validators import DataRequired, Optional, Length
from project.models import Symbol
from project import db


class PortfolioSymbolForm(FlaskForm):
    """Form for creating portfolio of symbols."""

    symbol = SelectField('Symbol',
                         choices=db.session.query(Symbol.id,
                                                  Symbol.symbol).all())
    price = DecimalField('Price', validators=[DataRequired()])
    date = DateTimeField('Purchase Date', format='%m/%d/%Y',
                         validators=(Optional(),))
    number = IntegerField('Number', validators=[DataRequired()])


class PortfolioForm(FlaskForm):
    """Portfolio form."""

    name = TextField('Name', validators=[DataRequired()])
    description = TextField('Description',
                            validators=[DataRequired(),
                                        Length(min=6, max=140)])
