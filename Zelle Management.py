import mysql.connector

def connect_to_database():
    # Establish a connection to the database
    try:
        conn = mysql.connector.connect(
            host="root",
            user="premsai",
            password="lewis@2024",
            database="banking system"
        )
        print("Connected to the database")
        return conn
    except mysql.connector.Error as err:
        print("Error:", err)
        return None

def retrieve_data(conn):
    # Retrieve data from the database
    try:
        cursor = conn.cursor()
        query = "SELECT * FROM your_table LIMIT 10"  # Adjust the query as needed
        cursor.execute(query)
        data = cursor.fetchall()
        print("Data retrieved successfully")
        return data
    except mysql.connector.Error as err:
        print("Error:", err)
        return None

def present_data(data):
    # Present data on the screen
    if data:
        for row in data:
            print(row)

def store_to_file(data):
    # Store data to a text file
    with open("database_report.txt", "w") as file:
        for row in data:
            file.write(str(row) + "\n")
        print("Data stored to database_report.txt")

def main():
    # Connect to the database
    conn = connect_to_database()
    if not conn:
        return
    
    # Retrieve data from the database
    data = retrieve_data(conn)
    if not data:
        conn.close()
        return
    
    # Present data on the screen
    present_data(data)
    
    # Store data to a text file
    store_to_file(data)
    
    # Close the database connection
    conn.close()

if _name_ == "_main_":
    main()