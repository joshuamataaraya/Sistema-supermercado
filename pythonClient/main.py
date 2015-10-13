#!/usr/bin/env python
# -*- coding: utf-8 -*-

from flask import (Flask, render_template, request,
                    flash, redirect, url_for)
from flask_login import (LoginManager, login_user,
                        logout_user, login_required, current_user)
from flask import Response
from user import User
from sql import SQLConnection
from db import *
import base64

app = Flask(__name__)
app.secret_key = 'A0Zr98j/3nan --~XHH!jmN]LWX/,?RT'
errorMsj="An unexpected Error ocurred, please try again!"
#login manager
loginManager = LoginManager()

@app.route("/", methods=['GET', 'POST'])
@login_required
def index():

    sqlCon = SQLConnection(current_user.userType, current_user.userid)
    con = sqlCon.connect()

    cursor = con.cursor(as_dict=True)
    cursor.callproc('sp_consultarProductos')

    DBproducts = []

    for product in cursor:
        product['Foto'] = base64.b64encode(product['Foto'])
        DBproducts.append(product)

    #if request.method == 'POST':
    #    alias = request.values.get(idProduct)

    #    return url_for('modifyProduct')

    return render_template('index.html', products=DBproducts)

@app.route("/login", methods=['GET', 'POST'])
def login():
    #if someone tried to login
    if request.method == 'POST':
        alias = request.form['alias'].encode("UTF-8")
        password = request.form['password'].encode("UTF-8")

        user = User(alias, 'admin', password)

        if checkLogin(alias, password):    #if valid user
            login_user(user) #login the user
            #show login msg
            flash('You are now logged in!')
            return redirect(request.args.get('next') or url_for('index'))
        else:
            flash("Wrong Login!")

    return render_template('login.html')

@app.route("/logout")
@login_required
def logout():
    logout_user()
    return redirect(url_for('login'))

@app.route("/modifyProduct", methods=['GET', 'POST'])
@login_required
def modifyProduct():

    agents = dbGetParticipants(current_user.userType,current_user.userid,
    2)

    if request.method == 'POST':
        alias = request.form['participantSelect']
        name = request.form['FirstName']
        lastName = request.form['participantLastName']
        email=request.form['participantEmail']
        address=request.form['participantAddress']

        telCel=request.form['telCel']
        telWork=request.form['telWork']
        telHome=request.form['telHome']
        telOther=request.form['telOther']
        phones=[telCel,telWork,telHome,telOther]

        try:
            dbModifyParticipant(current_user.userType,current_user.userid, alias, name, lastName,email,address)

            dbAddPhones(current_user.userType,current_user.userid,alias,phones)
        except Exception as e:
            print e
            flash(errorMsj)

    return render_template('modifyProduct.html', productToEdit=product)


#@app.route('/product/<int:product_id>.jpg')
#def product(product_id):
#     jpeg_byte_string = get_photo(current_user.userType,product_id)
#     return current_app.response_class(jpeg_byte_string,mimetype=mimetype,direct_passthrough=False)

@app.route("/img/<bkey>")
def img(bkey):
    blob_info = get_photo(current_user.userType,bkey)
    response = make_response(blob_info.open().read())
    response.headers['Content-Type'] = blob_info.content_type
    return response

#Listing stuff
@app.route("/showListings")
@login_required
def showListings():
    return render_template('showListings.html')

#get user's id
@loginManager.user_loader
def load_user(userid):
    return User(userid, 'admin')

@loginManager.unauthorized_handler
def unauthorized():
    flash("You are not logged in!")
    # do stuff
    return redirect(url_for('login'))

if __name__ == "__main__":
    loginManager.init_app(app)

    app.debug = True    #auto refresh
    app.run()
