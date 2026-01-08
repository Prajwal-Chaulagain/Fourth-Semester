# Write a Python program for N-Queens Problem.
def is_safe(board, row, col, n):
    for i in range(row):
        if board[i] == col or abs(board[i]-col) == abs(i-row):
            return False
    return True

def solve_n_queen(n):
    def backtrack(row, board):
        if row == n:
            solutions.append(board[:])
            return
        for col in range(n):
            if is_safe(board, row, col, n):
                board[row] = col
                backtrack(row+1, board)
    solutions = []
    backtrack(0, [-1]*n)
    return solutions

print("N-Queen Solutions for 4x4:")
for sol in solve_n_queen(4):
    print(sol)