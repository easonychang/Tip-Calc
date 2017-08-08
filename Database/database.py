import sqlite3
import csv


connection = sqlite3.connect('salestaxrate.db')
cur = connection.cursor()

def create_table():
    cur.execute("CREATE TABLE IF NOT EXISTS sales_taxrate (id INTEGER PRIMARY KEY AUTOINCREMENT, state TEXT, zipcode INTEGER, taxrate REAL, reg_name TEXT, reg_code TEXT)")

#insert data into the table
def data_insertion():
    #reading in the file
    with open('tax_rate.csv') as csvfile:
        csvfile.readline()
        readCSV = csv.reader(csvfile, delimiter=',')
        for row in readCSV:
            state = row[0]
            zipcode = row[1]
            taxrate = row [2]
            reg_name = row [3]
            reg_code = row[4]
            
            #Inserting each data entry into the database
            cur.execute("INSERT INTO sales_taxrate (state, zipcode, taxrate, reg_name, reg_code) VALUES (?, ?, ?, ?, ?)", (state, zipcode, taxrate, reg_name, reg_code))

    connection.commit()
    cur.close()
    connection.close()


#create_table()
#data_insertion()
