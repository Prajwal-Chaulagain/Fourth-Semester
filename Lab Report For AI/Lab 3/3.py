# Write a Python program for Greedy Best First.
import heapq

def greedy_best_first(graph, start, goal, heuristic):
    pq = [(heuristic[start], [start])]
    visited = set()

    while pq:
        (h, path) = heapq.heappop(pq)
        node = path[-1]

        if node == goal:
            return path

        if node not in visited:
            for neighbor in graph[node]:
                new_path = path + [neighbor]
                heapq.heappush(pq, (heuristic[neighbor], new_path))
            visited.add(node)

graph = {
    'A': ['B','C'],
    'B': ['D','E'],
    'C': ['F'],
    'D': [],
    'E': ['F'],
    'F': []
}

heuristic = {'A':5,'B':3,'C':2,'D':4,'E':1,'F':0}

print("Greedy Path:", greedy_best_first(graph, 'A', 'F', heuristic))