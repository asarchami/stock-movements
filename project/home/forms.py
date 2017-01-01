"""Forms for home."""
from flask_wtf import FlaskForm
from wtforms import TextField, SelectField, DateTimeField, DecimalField, \
    IntegerField
from wtforms.validators import DataRequired, Length, Optional
from project.models import Symbol
from project import db


class MessageForm(FlaskForm):
    """Login Form."""

    title = TextField('Title', validators=[DataRequired()])
    description = TextField('Description',
                            validators=[DataRequired(),
                                        Length(min=6, max=140)])


class PortfolioForm(FlaskForm):
    """Portfolio form."""

    name = TextField('Name', validators=[DataRequired()])
    description = TextField('Description',
                            validators=[DataRequired(),
                                        Length(min=6, max=140)])


class PortfolioSymbolForm(FlaskForm):
    """Form for creating portfolio of symbols."""

    symbol = SelectField('Symbol',
                         choices=db.session.query(Symbol.id,
                                                  Symbol.symbol).all())
    price = DecimalField('Price', validators=[DataRequired()])
    date = DateTimeField('Purchase Date', format='%m/%d/%Y',
                         validators=(Optional(),))
    number = IntegerField('Number', validators=[DataRequired()])
