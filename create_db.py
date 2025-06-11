import sqlite3
import sys
sys.stdout.reconfigure(encoding='utf-8')


conn = sqlite3.connect("data.db")
cur = conn.cursor()

# Drop tables if they exist
cur.execute("DROP TABLE IF EXISTS Foods;")
cur.execute("DROP TABLE IF EXISTS Restaurants;")

# Create tables
cur.execute("""
CREATE TABLE Foods (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT NOT NULL
);
""")

cur.execute("""
CREATE TABLE Restaurants (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT NOT NULL,
    food_id INTEGER,
    price INTEGER,
    FOREIGN KEY(food_id) REFERENCES Foods(id)
);
""")

# Insert sample foods
foods = [
    ('Vada Pav', 'Mumbai'),
    ('Misal Pav', 'Mumbai'),
    ('Biryani', 'Hyderabad'),
    ('Dosa', 'Bangalore'),
    ('Fish Curry', 'Kolkata'),
    ('Momo', 'Guwahati'),
    ('Litti Chokha', 'Patna'),
    ('Kachori', 'Jaipur'),
]
cur.executemany("INSERT INTO Foods (name, city) VALUES (?, ?);", foods)

# Insert sample restaurants
restaurants = [
    ('Shiv Vada Center', 'Mumbai', 1, 30),
    ('Mamledar Misal', 'Mumbai', 2, 50),
    ('Paradise', 'Hyderabad', 3, 200),
    ('Dosa Plaza', 'Bangalore', 4, 100),
    ('Fish Bhawan', 'Kolkata', 5, 180),
    ('Momo Hut', 'Guwahati', 6, 60),
    ('Patna Junction Dhaba', 'Patna', 7, 40),
    ('Jaipur Kachori Wale', 'Jaipur', 8, 35),
]
cur.executemany("INSERT INTO Restaurants (name, city, food_id, price) VALUES (?, ?, ?, ?);", restaurants)

conn.commit()
conn.close()
print("✅ Database created successfully as data.db")
