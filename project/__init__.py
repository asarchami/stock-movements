from flask import Flask
from project.home.views import home_blueprint
import os

app = Flask(__name__)
app.config.from_object(os.environ["APP_SETTINGS"])

# register our blueprints
# app.register_blueprint(users_blueprint)
# app.register_blueprint(blog_blueprint)
app.register_blueprint(home_blueprint)
