"""Forms for home."""
from flask_wtf import FlaskForm
from wtforms import TextField, TextAreaField
from wtforms.validators import DataRequired, Length


class BlogForm(FlaskForm):
    """Login Form."""

    title = TextField('Title', validators=[DataRequired()])
    description = TextAreaField('Description',
                                validators=[DataRequired(),
                                            Length(min=6, max=140)])
