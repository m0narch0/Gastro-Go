import sqlite3
import streamlit as st
import folium
from streamlit_folium import folium_static
from graph import graph, dijkstra  # 🔁 Import graph and Dijkstra

# Coordinates for map visualization
coordinates = {
    "Delhi": (28.6139, 77.2090),
    "Mumbai": (19.0760, 72.8777),
    "Hyderabad": (17.3850, 78.4867),
    "Bangalore": (12.9716, 77.5946),
    "Chennai": (13.0827, 80.2707),
    "Kolkata": (22.5726, 88.3639),
    "Jaipur": (26.9124, 75.7873),
    "Ahmedabad": (23.0225, 72.5714),
    "Lucknow": (26.8467, 80.9462),
    "Kanpur": (26.4499, 80.3319),
    "Bhopal": (23.2599, 77.4126),
    "Pune": (18.5204, 73.8567),
    "Coimbatore": (11.0168, 76.9558),
    "Patna": (25.5941, 85.1376),
    "Ranchi": (23.3441, 85.3096),
    "Nagpur": (21.1458, 79.0882),
    "Indore": (22.7196, 75.8577),
    "Visakhapatnam": (17.6868, 83.2185),
    "Thiruvananthapuram": (8.5241, 76.9366),
    "Guwahati": (26.1445, 91.7362)
}

# Map display
def show_map(path):
    m = folium.Map(location=coordinates[path[0]], zoom_start=5)
    for city in path:
        if city in coordinates:
            folium.Marker(coordinates[city], popup=city).add_to(m)
    for i in range(len(path) - 1):
        if path[i] in coordinates and path[i+1] in coordinates:
            folium.PolyLine([coordinates[path[i]], coordinates[path[i+1]]], color="blue").add_to(m)
    folium_static(m)

# Streamlit page setup
st.set_page_config(page_title="India Restaurant Journey Planner", layout="centered")
st.title("India Restaurant Journey Planner")

# Connect to DB
conn = sqlite3.connect("data.db")
cur = conn.cursor()

cities = list(graph.keys())
current_city = st.selectbox("Enter your current city:", cities)
dest_city = st.selectbox("Enter your desired city:", [c for c in cities if c != current_city])

# Load dishes from desired city
if dest_city:
    cur.execute("SELECT id, name FROM Foods WHERE city = ?", (dest_city,))
    dishes = cur.fetchall()
    if dishes:
        dish_names = [dish[1] for dish in dishes]
        selected_dish = st.selectbox("Choose a famous dish:", dish_names)

        # Load restaurants for that dish
        if selected_dish:
            cur.execute("""
                SELECT Restaurants.name, Restaurants.city, Restaurants.price
                FROM Restaurants
                JOIN Foods ON Restaurants.food_id = Foods.id
                WHERE Foods.name = ? AND Foods.city = ?
            """, (selected_dish, dest_city))
            restaurants = cur.fetchall()

            if restaurants:
                restaurant_names = [f"{r[0]} (₹{r[2]})" for r in restaurants]
                selected_rest = st.selectbox("Choose a restaurant:", restaurant_names)

                if selected_rest:
                    selected_city = dest_city
                    path, distance = dijkstra(current_city, selected_city)
                    price = [r[2] for r in restaurants if r[0] in selected_rest][0]

                    st.success(f"""
**City:** {selected_city}  
**Dish:** {selected_dish}  
**Price:** ₹{price}  
**Shortest Path:** {' → '.join(path)}  
**Total Distance:** {distance} km
""")
                    show_map(path)
                else:
                    st.warning("Please select a restaurant.")
            else:
                st.warning("No restaurants found for the selected dish.")
        else:
            st.warning("Please select a dish.")
    else:
        st.warning("No famous dishes found for the selected city.")
