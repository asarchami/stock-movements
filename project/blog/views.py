"""Default view."""
########################
#        imports       #
########################
from project import db  # pragma: no cover
from project.models import BlogPost  # pragma: no cover
from forms import MessageForm  # pragma: no cover
from flask import render_template, Blueprint, flash, url_for, \
    redirect, request  # pragma: no cover
from flask_login import login_required, current_user  # pragma: no cover

##########################
#         config         #
##########################

blog_blueprint = Blueprint(
    'blog', __name__,
    template_folder='templates'
)

########################
#        routes        #
########################
# use decorators to link the function to a url


@blog_blueprint.route('/blogs', methods=['GET', 'POST'])
@login_required
def blogs():
    """Blog List."""
    error = None
    form = MessageForm(request.form)
    if form.validate_on_submit():
        new_message = BlogPost(
            form.title.data,
            form.description.data,
            current_user.id
        )
        db.session.add(new_message)
        db.session.commit()
        flash('New entry was successfully posted. Thanks.')
        return redirect(url_for('blog.blogs'))
    else:
        posts = db.session.query(BlogPost).all()
        return render_template(
            'blogs.html', posts=posts, form=form, error=error
        )
