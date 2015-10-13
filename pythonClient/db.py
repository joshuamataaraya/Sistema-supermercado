from sql import SQLConnection
import pymssql
from flask import flash

def dbPlaceBid(userType, itemId, alias, newBid):
    sqlCon = SQLConnection(userType)
    con = sqlCon.connect()
    cursor = con.cursor(as_dict=True)

    cursor.callproc('uspNewBid', (itemId, alias,newBid,))
    checkError(cursor,"Your bid for " + newBid + " was successfull!")
    con.commit()
    sqlCon.close(con)

def checkLogin(user,password):
    return True

def checkError(cursor,MSJ):
    for row in cursor:
        if row['SUCCESS']==0:
            flash(row['ERROR'])
        elif MSJ!="":
            flash(MSJ)

def get_photo(userType,id):
    sqlCon = SQLConnection(userType)
    con = sqlCon.connect()
    cursor = con.cursor(as_dict=True)

    cursor.callproc('sp_getPhoto', (id,))
    for row in cursor:
        byteString = row['Foto']
    sqlCon.close(con)
    return byteString
