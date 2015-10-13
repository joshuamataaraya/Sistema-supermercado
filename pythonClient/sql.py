import pymssql

from user import getPassword

class SQLConnection:

    """Connecto to Microsoft SQL DB """
    def __init__(self, userType=None, userName=None):
        self.server = "localhost"
        self.user = "consulta"
        self.password = "12345678"
        #if userType == "admin":
        #    self.user = userName
        #    self.password = getPassword(userName)
        #elif userType == "Consulta":
        #    self.user = consulta
        #    self.password = 12345678

    def connect(self):
        return  pymssql.connect(self.server,
            self.user,self.password,"Multimedial")

    def close(self, con):
        con.close()
