"""Default view."""
########################
#        imports       #
########################
from flask import render_template, Blueprint  # pragma: no cover

##########################
#         config         #
##########################

home_blueprint = Blueprint(
    'home', __name__,
    template_folder='templates'
)

########################
#        routes        #
########################
# use decorators to link the function to a url


@home_blueprint.route('/')
def home():
    """Welcome page."""
    return render_template('index.html')
