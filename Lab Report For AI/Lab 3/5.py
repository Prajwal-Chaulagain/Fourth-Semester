# Write a Python program for MinMax Search (Game Search).
import math

def minmax(depth, node_index, maximizing, values, alpha, beta):
    if depth == 2:  # leaf nodes
        return values[node_index]

    if maximizing:
        best = -math.inf
        for i in range(2):
            val = minmax(depth+1, node_index*2+i, False, values, alpha, beta)
            best = max(best, val)
            alpha = max(alpha, best)
            if beta <= alpha:
                break
        return best
    else:
        best = math.inf
        for i in range(2):
            val = minmax(depth+1, node_index*2+i, True, values, alpha, beta)
            best = min(best, val)
            beta = min(beta, best)
            if beta <= alpha:
                break
        return best

values = [3, 5, 2, 9, 12, 5, 23, 23]
print("MinMax Value:", minmax(0, 0, True, values, -math.inf, math.inf))