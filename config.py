# default config
import os


class BaseConfig(object):
    """general configurations"""
    DEBUG = False
    SECRET_KEY = '\xc4\xfb\x94\x84\xe3t\x153\x0eu#\xc0\x02\xfcV\x8b\x90\xc3G\x02\x00\x9e\xf3'
    SQLALCHEMY_TRACK_MODIFICATIONS = True
    SQLALCHEMY_DATABASE_URI = os.environ['DATABASE_URL']
    # print SQLALCHEMY_DATABASE_URI


class TestConfig(BaseConfig):
    """docstring for TestConfig."""
    DEBUG = True
    TESTING = True
    WTF_CSRF_ENABLED = False
    SQLALCHEMY_DATABASE_URI = 'sqlite:///:memory:'


class DevelopmentConfig(BaseConfig):
    """Development configurations"""
    DEBUG = True


class ProductionConfig(BaseConfig):
    """Production configurations"""
    DEBUG = False
