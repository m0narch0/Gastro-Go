from collections import defaultdict
import heapq

edges = [
    ("Delhi", "Jaipur", 280), ("Delhi", "Lucknow", 500), ("Delhi", "Kanpur", 480),
    ("Delhi", "Mumbai", 1400), ("Delhi", "Bhopal", 780), ("Delhi", "Kolkata", 1500),
    ("Mumbai", "Pune", 150), ("Mumbai", "Hyderabad", 700), ("Mumbai", "Ahmedabad", 530),
    ("Mumbai", "Bangalore", 980), ("Chennai", "Bangalore", 350), ("Chennai", "Coimbatore", 500),
    ("Chennai", "Hyderabad", 630), ("Kolkata", "Patna", 580), ("Kolkata", "Ranchi", 400),
    ("Hyderabad", "Nagpur", 500), ("Nagpur", "Bhopal", 360), ("Bhopal", "Indore", 190),
    ("Indore", "Ahmedabad", 400), ("Ahmedabad", "Jaipur", 670), ("Lucknow", "Kanpur", 90),
    ("Kanpur", "Patna", 600), ("Patna", "Ranchi", 320), ("Visakhapatnam", "Hyderabad", 620),
    ("Visakhapatnam", "Kolkata", 880), ("Coimbatore", "Thiruvananthapuram", 380),
    ("Guwahati", "Kolkata", 1050), ("Bangalore", "Coimbatore", 360)
]

graph = defaultdict(list)
for u, v, w in edges:
    graph[u].append((v, w))
    graph[v].append((u, w))

def dijkstra(start, end):
    heap = [(0, start, [])]
    visited = set()
    while heap:
        dist, node, path = heapq.heappop(heap)
        if node in visited:
            continue
        path = path + [node]
        if node == end:
            return path, dist
        visited.add(node)
        for neighbor, weight in graph[node]:
            if neighbor not in visited:
                heapq.heappush(heap, (dist + weight, neighbor, path))
    return None, float('inf')
