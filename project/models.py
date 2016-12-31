"""models."""
from sqlalchemy import ForeignKey  # pragma: no cover
from sqlalchemy.orm import relationship  # pragma: no cover
from project import db  # pragma: no cover
from project import bcrypt  # pragma: no cover


class BlogPost(db.Model):
    """Blog data."""

    __tablename__ = "posts"

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String, nullable=False)
    description = db.Column(db.String, nullable=False)
    author_id = db.Column(db.Integer, ForeignKey('users.id'))

    def __init__(self, title, description, author_id):
        """Blog constructor."""
        self.title = title
        self.description = description
        self.author_id = author_id

    def __repr__(self):
        """Blog representation."""
        return '<title: {}>'.format(self.title)


class User(db.Model):
    """Create user."""

    __tablename__ = "users"

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=False)
    email = db.Column(db.String, nullable=False)
    password = db.Column(db.String, nullable=False)
    posts = relationship("BlogPost", backref="author")
    # favorite_color = db.Column(db.String)

    def is_authenticated(self):
        """is_authenticated."""
        return True

    def is_active(self):
        """is_active."""
        return True

    def is_anonymous(self):
        """is_anonymous."""
        return False

    def get_id(self):
        """get_id."""
        return unicode(self.id)

    def __init__(self, name, email, password):
        """User model."""
        self.name, self.email = name, email
        self.password = bcrypt.generate_password_hash(password)

    def __repr__(self):
        """User representation."""
        return '<name: {}>'.format(self.name)


class Portfolio(db.Model):
    """Portfolio model."""

    __tablename__ = "portfolios"

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=False)
    description = db.Column(db.String, nullable=False)
    owner_id = db.Column(db.Integer, ForeignKey('users.id'))

    def __init__(self, name, description, owner_id):
        """Portfolio constructor."""
        self.name = name
        self.description = description
        self.owner_id = owner_id

    def __repr__(self):
        """Portfolio representation."""
        return '<name: {}>'.format(self.name)
