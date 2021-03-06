from sql import SQLConnection
import pymssql
from flask import flash


def checkLogin(user):
    try:
        sqlCon = SQLConnection(user.userType, user.userid)
        con = sqlCon.connect()
        return True
    except:
        return False

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
