from flask import Flask

import db


app = Flask(__name__)
db.reg_db(app)


@app.route("/")
def hello():
    return "<h1>Hello World</h1>"
