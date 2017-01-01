"""empty message

Revision ID: 7b365699f553
Revises: c950f3606629
Create Date: 2017-01-01 12:19:51.757118

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '7b365699f553'
down_revision = 'c950f3606629'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('portfolio_symbols', sa.Column('number', sa.Integer(), nullable=True))
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('portfolio_symbols', 'number')
    # ### end Alembic commands ###