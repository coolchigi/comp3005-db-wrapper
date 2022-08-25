import sqlite3;

connect = sqlite3.connect('products_database.db')

connect.execute("INSERT INTO products VALUES(35853359, '30 Vinyl', 10, 'Music', 24.99)")
connect.execute("INSERT INTO products VALUES(68227675, 'SOUR', 20, 'Music', 15.13)")

connect.commit()
connect.close()