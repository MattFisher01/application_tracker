import click
from flask import current_app, g
import sqlite3


DATABASE_NAME = 'database.db'


def get_db():
    db = getattr(g, '_database', None)
    if not db:
        db = g._database = sqlite3.connect(DATABASE_NAME)
    return db


def close_connection(exception):
    db = getattr(g, '_database', None)
    if db:
        db.close()


@click.command('init-db')
def init_db():
    db = get_db()
    with current_app.open_resource('schema.sql', mode='r') as f:
        db.cursor().executescript(f.read())
    db.commit()


def reg_db(app):
    app.teardown_appcontext(close_connection)
    app.cli.add_command(init_db)
