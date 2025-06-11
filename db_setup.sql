DROP TABLE IF EXISTS Foods;
DROP TABLE IF EXISTS Restaurants;

CREATE TABLE Foods (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT NOT NULL
);

CREATE TABLE Restaurants (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT NOT NULL,-- db_setup.sql
DROP TABLE IF EXISTS Cities;
DROP TABLE IF EXISTS Foods;
DROP TABLE IF EXISTS Restaurants;

CREATE TABLE Cities (
    name TEXT PRIMARY KEY
);

CREATE TABLE Foods (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    city TEXT NOT NULL,
    FOREIGN KEY(city) REFERENCES Cities(name)
);

CREATE TABLE Restaurants (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    city TEXT NOT NULL,
    food_id INTEGER NOT NULL,
    price INTEGER NOT NULL,
    FOREIGN KEY(city) REFERENCES Cities(name),
    FOREIGN KEY(food_id) REFERENCES Foods(id)
);

-- Insert Cities
INSERT INTO Cities (name) VALUES ('Delhi');
INSERT INTO Cities (name) VALUES ('Mumbai');
INSERT INTO Cities (name) VALUES ('Hyderabad');
INSERT INTO Cities (name) VALUES ('Chennai');
INSERT INTO Cities (name) VALUES ('Ahmedabad');

-- Insert Foods
INSERT INTO Foods (name, city) VALUES ('Chole Bhature', 'Delhi');
INSERT INTO Foods (name, city) VALUES ('Rajma Chawal', 'Delhi');
INSERT INTO Foods (name, city) VALUES ('Paratha', 'Delhi');
INSERT INTO Foods (name, city) VALUES ('Gol Gappe', 'Delhi');
INSERT INTO Foods (name, city) VALUES ('Butter Chicken', 'Delhi');

INSERT INTO Foods (name, city) VALUES ('Vada Pav', 'Mumbai');
INSERT INTO Foods (name, city) VALUES ('Pav Bhaji', 'Mumbai');
INSERT INTO Foods (name, city) VALUES ('Bombay Sandwich', 'Mumbai');
INSERT INTO Foods (name, city) VALUES ('Misal Pav', 'Mumbai');
INSERT INTO Foods (name, city) VALUES ('Bhel Puri', 'Mumbai');

INSERT INTO Foods (name, city) VALUES ('Hyderabadi Biryani', 'Hyderabad');
INSERT INTO Foods (name, city) VALUES ('Double Ka Meetha', 'Hyderabad');
INSERT INTO Foods (name, city) VALUES ('Mirchi Ka Salan', 'Hyderabad');
INSERT INTO Foods (name, city) VALUES ('Haleem', 'Hyderabad');
INSERT INTO Foods (name, city) VALUES ('Qubani Ka Meetha', 'Hyderabad');

INSERT INTO Foods (name, city) VALUES ('Dosa', 'Chennai');
INSERT INTO Foods (name, city) VALUES ('Idli', 'Chennai');
INSERT INTO Foods (name, city) VALUES ('Vada', 'Chennai');
INSERT INTO Foods (name, city) VALUES ('Pongal', 'Chennai');
INSERT INTO Foods (name, city) VALUES ('Uttapam', 'Chennai');

INSERT INTO Foods (name, city) VALUES ('Dhokla', 'Ahmedabad');
INSERT INTO Foods (name, city) VALUES ('Khandvi', 'Ahmedabad');
INSERT INTO Foods (name, city) VALUES ('Undhiyu', 'Ahmedabad');
INSERT INTO Foods (name, city) VALUES ('Fafda', 'Ahmedabad');
INSERT INTO Foods (name, city) VALUES ('Sev Tameta', 'Ahmedabad');

-- Insert Restaurants
INSERT INTO Restaurants (name, city, food_id, price) VALUES ('Sitaram Di Hatti', 'Delhi', 1, 120);
INSERT INTO Restaurants (name, city, food_id, price) VALUES ('Punjabi Rasoi', 'Delhi', 5, 250);
INSERT INTO Restaurants (name, city, food_id, price) VALUES ('Rajma Corner', 'Delhi', 2, 100);
INSERT INTO Restaurants (name, city, food_id, price) VALUES ('Hot Paratha', 'Delhi', 3, 80);
INSERT INTO Restaurants (name, city, food_id, price) VALUES ('Street Golgappa', 'Delhi', 4, 50);

INSERT INTO Restaurants (name, city, food_id, price) VALUES ('Ashok Vada Pav', 'Mumbai', 6, 30);
INSERT INTO Restaurants (name, city, food_id, price) VALUES ('Shiv Sagar', 'Mumbai', 7, 120);
INSERT INTO Restaurants (name, city, food_id, price) VALUES ('Sandwich Point', 'Mumbai', 8, 90);
INSERT INTO Restaurants (name, city, food_id, price) VALUES ('Misal Magic', 'Mumbai', 9, 70);
INSERT INTO Restaurants (name, city, food_id, price) VALUES ('Bhel House', 'Mumbai', 10, 60);

INSERT INTO Restaurants (name, city, food_id, price) VALUES ('Paradise', 'Hyderabad', 11, 300);
INSERT INTO Restaurants (name, city, food_id, price) VALUES ('Meetha Mahal', 'Hyderabad', 12, 150);
INSERT INTO Restaurants (name, city, food_id, price) VALUES ('Spicy Spot', 'Hyderabad', 13, 200);
INSERT INTO Restaurants (name, city, food_id, price) VALUES ('Haleem Hub', 'Hyderabad', 14, 180);
INSERT INTO Restaurants (name, city, food_id, price) VALUES ('Qubani Palace', 'Hyderabad', 15, 160);

INSERT INTO Restaurants (name, city, food_id, price) VALUES ('Murugan Idli', 'Chennai', 17, 60);
INSERT INTO Restaurants (name, city, food_id, price) VALUES ('Dosa Corner', 'Chennai', 16, 70);
INSERT INTO Restaurants (name, city, food_id, price) VALUES ('Pongal Point', 'Chennai', 19, 80);
INSERT INTO Restaurants (name, city, food_id, price) VALUES ('Uttapam Vibes', 'Chennai', 20, 75);
INSERT INTO Restaurants (name, city, food_id, price) VALUES ('Vada Villa', 'Chennai', 18, 50);

INSERT INTO Restaurants (name, city, food_id, price) VALUES ('Dhokla Delight', 'Ahmedabad', 21, 55);
INSERT INTO Restaurants (name, city, food_id, price) VALUES ('Khandvi King', 'Ahmedabad', 22, 60);
INSERT INTO Restaurants (name, city, food_id, price) VALUES ('Undhiyu Treat', 'Ahmedabad', 23, 90);
INSERT INTO Restaurants (name, city, food_id, price) VALUES ('Fafda Feast', 'Ahmedabad', 24, 45);
INSERT INTO Restaurants (name, city, food_id, price) VALUES ('Sev Spot', 'Ahmedabad', 25, 50);

    food_id INTEGER,
    price INTEGER,
    FOREIGN KEY(food_id) REFERENCES Foods(id)
);

-- Sample Foods
INSERT INTO Foods (name, city) VALUES
('Vada Pav', 'Mumbai'),
('Misal Pav', 'Mumbai'),
('Biryani', 'Hyderabad'),
('Dosa', 'Bangalore'),
('Fish Curry', 'Kolkata'),
('Momo', 'Guwahati'),
('Litti Chokha', 'Patna'),
('Kachori', 'Jaipur');

-- Sample Restaurants
INSERT INTO Restaurants (name, city, food_id, price) VALUES
('Shiv Vada Center', 'Mumbai', 1, 30),
('Mamledar Misal', 'Mumbai', 2, 50),
('Paradise', 'Hyderabad', 3, 200),
('Dosa Plaza', 'Bangalore', 4, 100),
('Fish Bhawan', 'Kolkata', 5, 180),
('Momo Hut', 'Guwahati', 6, 60),
('Patna Junction Dhaba', 'Patna', 7, 40),
('Jaipur Kachori Wale', 'Jaipur', 8, 35);
