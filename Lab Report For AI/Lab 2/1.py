# Write a Python Program for Self Driving Car.
def self_driving_car(traffic_light, obstacle, pedestrian, direction):
    # Rule 1: High priority stop conditions
    if traffic_light == "red":
        return "STOP (Red Light)"
    elif pedestrian == "yes":
        return "STOP (Pedestrian Crossing)"
    elif obstacle == "yes":
        return "STOP (Obstacle Ahead)"
    
    # Rule 2: Yellow light = slow down
    elif traffic_light == "yellow":
        return "SLOW DOWN (Yellow Light)"
    
    # Rule 3: Green light = move according to direction
    elif traffic_light == "green" and pedestrian == "no" and obstacle == "no":
        if direction == "left":
            return "TURN LEFT"
        elif direction == "right":
            return "TURN RIGHT"
        elif direction == "u-turn":
            return "MAKE U-TURN"
        elif direction == "straight":
            return "GO FORWARD"
        else:
            return "WAIT (Unknown Direction)"
    
    # Default case
    else:
        return "WAIT (Uncertain Situation)"

# -------- Test Cases --------
print("Case 1:", self_driving_car("red", "no", "no", "straight"))
print("Case 2:", self_driving_car("green", "no", "no", "left"))
print("Case 3:", self_driving_car("green", "no", "no", "right"))
print("Case 4:", self_driving_car("yellow", "no", "no", "straight"))
print("Case 5:", self_driving_car("green", "yes", "no", "straight"))
print("Case 6:", self_driving_car("green", "no", "yes", "straight"))
print("Case 7:", self_driving_car("green", "no", "no", "u-turn"))