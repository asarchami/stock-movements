"""Forms for home."""
from flask_wtf import FlaskForm
from wtforms import TextField
from wtforms.validators import DataRequired, Length


class MessageForm(FlaskForm):
    """Login Form."""

    title = TextField('Title', validators=[DataRequired()])
    description = TextField('Description',
                            validators=[DataRequired(),
                                        Length(min=6, max=140)])
