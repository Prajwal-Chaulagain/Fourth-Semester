# Write a python Program for Genetic Algorithm.
import random

# Parameters
TARGET = [1, 1, 0, 1, 1] # Binary numbers of your roll number
POP_SIZE = 6 
MUTATION_RATE = 0.1
GENERATIONS = 20 

# Fitness function: count matching bits
def fitness(chromosome):
    return sum(1 for i in range(len(TARGET)) if chromosome[i] == TARGET[i])

# Initialize population randomly
def init_population():
    return [[random.randint(0, 1) for _ in range(len(TARGET))] for _ in range(POP_SIZE)]

# Selection: choose best parent
def selection(population):
    return max(population, key=fitness)

# Crossover: single-point
def crossover(parent1, parent2):
    point = random.randint(1, len(TARGET)-1)
    child = parent1[:point] + parent2[point:]
    return child

# Mutation: flip bits
def mutate(chromosome):
    for i in range(len(chromosome)):
        if random.random() < MUTATION_RATE:
            chromosome[i] = 1 - chromosome[i]
    return chromosome

# Run GA
population = init_population()
print(population)
for gen in range(GENERATIONS):
    new_population = []
    for _ in range(POP_SIZE):
        parent1 = selection(population)
        parent2 = selection(population)
        child = crossover(parent1, parent2)
        child = mutate(child)
        new_population.append(child)
    population = new_population
    
    best = selection(population)
    print(f"Gen {gen+1}: {best} | Fitness={fitness(best)}")
    if fitness(best) == len(TARGET):
        print("Target found!")
        break