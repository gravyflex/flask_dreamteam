# app/home/__init__.py

from flask import Blueprint

home = Blueprint('home', __name__, static_folder='static', static_url_path='/static')

from . import views
