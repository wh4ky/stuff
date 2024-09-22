from random import randint

integer = randint(1, 100)

while (True):
    while (True):
        try: guess = int(input("Guess: "))
        except: print("Guess not of type int")
        else: break

    if integer != guess:
        if integer <= guess:
            print("Lower")
            
        elif integer >= guess:
            print("Higher")
        
    else:
        print("Jippie!")
        break
