"""empty message

Revision ID: c950f3606629
Revises: 5f2b849e46fc
Create Date: 2016-12-31 12:21:56.236406

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'c950f3606629'
down_revision = '5f2b849e46fc'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('portfolio_symbols',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('portfolio_id', sa.Integer(), nullable=False),
    sa.Column('symbol_id', sa.Integer(), nullable=False),
    sa.Column('price', sa.Float(), nullable=True),
    sa.Column('date', sa.DateTime(), nullable=True),
    sa.ForeignKeyConstraint(['portfolio_id'], ['portfolios.id'], ),
    sa.ForeignKeyConstraint(['symbol_id'], ['symbols.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('portfolio_symbols')
    # ### end Alembic commands ###
