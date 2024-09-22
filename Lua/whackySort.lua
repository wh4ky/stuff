--[[ whackySort.lua
    a whacky sorting algo made by Whacky

    --- How it works ---
    1. Duplicate entries are removed and saved in an array.
    2. An array is split into chunks.
    3. Every chunk gets processed by the bubble sort algorithm (on separate threads).
    4. The last items (the biggest) get grabbed from the chunks and sorted with the insertion sort algorithm and put into a seperate final array.
]]

-- functions --

function Dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. Dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
end 

function BubbleSort(list)
    if type(list) == "table" then

        local y = 1

        print("\n--- start of sorting ---\n")

        for i = 1, #list - 1, 1 do
            for j = 1, #list - y, 1 do
                local currnetItem = list[j]
                local nextItem = list[j + 1]

                if currnetItem > nextItem then
                    print(currnetItem, " is greater than ", nextItem)
                    list[j] = nextItem
                    list[j + 1] = currnetItem

                elseif currnetItem < nextItem then
                    print(currnetItem, " is lesser than ", nextItem)

                else
                    print(currnetItem, " is equal to ", nextItem)

                end
            end
            y = y + 1
            print("\n--- end of sorting ", i, " ---\n")
        end

    else
        return
    end
end

function RemoveDuplicates(list)
    print("\n--- start removing duplicates ---\n")

    for i = #list, 1, -1 do
        local currentValue = list[i]

        if not Duplicates[currentValue] then
            Duplicates[currentValue] = 0
            print("new value: ", currentValue)
        else
            Duplicates[currentValue] = Duplicates[currentValue] + 1 
            print("known duplicate found: ", currentValue, " new count is: ", Duplicates[currentValue])
            table.remove(list, i)
        end
    end

    print("\n--- removed duplicates ---\n")
end

function RestoreDuplicates(list)
    print("\n--- restoring duplicates ---\n")

    for i = #list, 1, -1 do
        local currentValue = list[i]

        if Duplicates[currentValue] then
            print("value ", currentValue, " has ", Duplicates[currentValue], " duplicates")
            for _ = 1, Duplicates[currentValue], 1 do
                table.insert(list, i + 1, currentValue)
            end
        end
    end

    print("\n--- restored duplicates ---\n")
end

-- main --

math.randomseed(os.time())

List = {}
Duplicates = {}

for _ = 1, 1000, 1 do
    table.insert(List, math.random(0, 10))
end

local unsortedList = List

BubbleSort(List)

print("unsorted list: ", Dump(unsortedList), "\n\nsorted list: ", Dump(List))

RemoveDuplicates(List)

print("\nsorted list: ", Dump(List), "\n\nduplicates list: ", Dump(Duplicates) )

RestoreDuplicates(List)

print("\nsorted list with restored duplicates: ", Dump(List))
