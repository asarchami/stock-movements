"""Base App."""
########################
#        imports       #
########################
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
from flask_login import LoginManager
import os

########################
#        config        #
########################
app = Flask(__name__)
bcrypt = Bcrypt(app)
login_manager = LoginManager()
login_manager.init_app(app)
app.config.from_object(os.environ["APP_SETTINGS"])
db = SQLAlchemy(app)

from project.users.views import users_blueprint
from project.home.views import home_blueprint
from project.blog.views import blog_blueprint
from project.portfolios.views import portfolios_blueprint
from project.symbols.views import symbols_blueprint

# register our blueprints
app.register_blueprint(users_blueprint)
app.register_blueprint(home_blueprint)
app.register_blueprint(blog_blueprint)
app.register_blueprint(portfolios_blueprint)
app.register_blueprint(symbols_blueprint)

from models import User

login_manager.login_view = "users.login"


@login_manager.user_loader
def load_user(user_id):
    """Load user."""
    return User.query.filter(User.id == int(user_id)).first()
