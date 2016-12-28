from flask import Blueprint, render_template, abort
from jinja2 import TemplateNotFound

##########################
#         config         #
##########################

home_blueprint = Blueprint(
    'home', __name__,
    template_folder='templates'
)


@home_blueprint.route('/', methods=['GET', 'POST'])
def home():
    # print "Hello, World!"
    return render_template(
        'index.html')
