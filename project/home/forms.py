from flask_wtf import FlaskForm
from wtforms import TextField, PasswordField
from wtforms.validators import DataRequired, Length, Email, EqualTo


class MessageForm(FlaskForm):
    """Login Form"""
    title = TextField('Title', validators=[DataRequired()])
    description = TextField('Description',
                            validators=[DataRequired(),
                                        Length(min=6, max=140)])
