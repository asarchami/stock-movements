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


class PortfolioSymbols(db.Model):
    """Portfolio to Symbol Relationship."""

    __tablename__ = 'portfolio_symbols'
    id = db.Column(db.Integer, primary_key=True)
    portfolio_id = db.Column(db.Integer,
                             db.ForeignKey('portfolios.id'),
                             nullable=False)
    symbol_id = db.Column(db.Integer,
                          db.ForeignKey('symbols.id'),
                          nullable=False)
    price = db.Column(db.Float, nullable=False)
    number = db.Column(db.Integer, nullable=False)
    date = db.Column(db.DateTime)
    symbol = relationship('Symbol', backref='portfo_assoc')

    def __init__(self, number, price, date):
        """Portfolio constructor."""
        self.number = number
        self.price = price
        self.date = date
        # self.portfolio_id = portfolio_id
        # self.symbol_id = symbol_id

    def __repr__(self):
        """Portfolio representation."""
        return '<portfolio: {} - symbol: {}>'.format(
            self.portfolio_id, self.symbol_id)


class Portfolio(db.Model):
    """Portfolio model."""

    __tablename__ = "portfolios"

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=False)
    description = db.Column(db.String, nullable=False)
    owner_id = db.Column(db.Integer, ForeignKey('users.id'))
    portfo_symbols = relationship('PortfolioSymbols', backref='portfolio')

    def __init__(self, name, description, owner_id):
        """Portfolio constructor."""
        self.name = name
        self.description = description
        self.owner_id = owner_id

    def __repr__(self):
        """Portfolio representation."""
        return '<name: {}>'.format(self.name)


class Symbol(db.Model):
    """Stock model."""

    __tablename__ = 'symbols'

    id = db.Column(db.Integer, primary_key=True)
    symbol = db.Column(db.String, nullable=False)
    name = db.Column(db.String, nullable=False)
    sector = db.Column(db.String, nullable=False)
    industry = db.Column(db.String, nullable=False)
    address = db.Column(db.String, nullable=False)
    date_added = db.Column(db.DateTime)
    cik = db.Column(db.Integer, nullable=False)

    def __init__(self, symbol, name, sector, industry,
                 address, date_added, cik):
        """Stock constructor."""
        self.symbol = symbol
        self.name = name
        self.sector = sector
        self.industry = industry
        self.address = address
        self.date_added = date_added
        self.cik = cik

    def __repr__(self):
        """Stock representation."""
        return '<name: {}>'.format(self.name)

    @property
    def serialize(self):
        """Return object data in easily serializable format."""
        return {
            'symbol': self.symbol,
            'name': self.name,
            'sector': self.sector,
            'industry': self.industry,
            'address': self.address,
            # 'date_added': self.date_added,
            'cik': self.cik
        }
    # @property
    # def serialize_many2many(self):
    #     """
    #    Return object's relations in easily serializeable format.
    #    NB! Calls many2many's serialize property.
    #    """
    #    return[item.serialize for item in self.many2many]
