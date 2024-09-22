from random import randint

listToSort = []

for i in range(0, 1000):
    listToSort.append(randint(-100, 100))

maxIndex = len(listToSort)

print(f"\nunsorted list: {listToSort}")

print("\n--- start of sorting ---\n")

y = 0

for x in range(1, maxIndex - 1):
    print(y)
    
    for i in range(1, maxIndex - y):
        itemCurr = listToSort[i - 1]
        itemNxt = listToSort[i]
        
        if itemCurr > itemNxt:
            print(f"{itemCurr} is more than {itemNxt}")
            listToSort[i - 1] = itemNxt
            listToSort[i] = itemCurr
            
        elif itemCurr < itemNxt:
            print(f"{itemCurr} is less than {itemNxt}")
        
        else:
            print(f"{itemCurr} is equal to {itemNxt}")

    y += 1
    print(f"\n--- end of sorting {x} ---\n")

print(listToSort)