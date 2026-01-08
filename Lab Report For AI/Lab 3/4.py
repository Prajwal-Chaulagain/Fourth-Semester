# Write a Python program for A Search*.
import heapq

def a_star(graph, start, goal, heuristic):
    pq = [(0 + heuristic[start], 0, [start])]
    visited = set()

    while pq:
        (f, g, path) = heapq.heappop(pq)
        node = path[-1]

        if node == goal:
            return path, g

        if node not in visited:
            for neighbor, step_cost in graph.get(node, []):
                new_g = g + step_cost
                new_path = path + [neighbor]
                heapq.heappush(pq, (new_g + heuristic[neighbor], new_g, new_path))
            visited.add(node)

# Graph with costs
graph = {
    'A': [('B',1), ('C',4)],
    'B': [('D',2), ('E',5)],
    'C': [('F',3)],
    'D': [],
    'E': [('F',1)],
    'F': []
}

heuristic = {'A':7,'B':6,'C':2,'D':12,'E':2,'F':0}

print("A* Path:", a_star(graph, 'A', 'F', heuristic))