# Write a Python program for Water Jug Problems.
def water_jug(capacity_x, capacity_y, target):
    visited = set()
    queue = [(0,0)]
    
    while queue:
        x, y = queue.pop(0)
        if (x, y) in visited:
            continue
        print(x, y)
        visited.add((x,y))
        
        if x == target or y == target:
            return True
        
        # Possible moves
        queue.append((capacity_x, y))         # fill X
        queue.append((x, capacity_y))         # fill Y
        queue.append((0, y))                  # empty X
        queue.append((x, 0))                  # empty Y
        # pour X → Y
        pour = min(x, capacity_y - y)
        queue.append((x - pour, y + pour))
        # pour Y → X
        pour = min(y, capacity_x - x)
        queue.append((x + pour, y - pour))
    return False

print("Solution exists:", water_jug(4, 3, 2))