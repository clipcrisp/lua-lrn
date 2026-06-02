N = 8    -- board size
IsPlaceOkCount = 0
Permutations = 0

-- check whether position (n,c) is free from attacks
local function isplaceok (a, n, c)
    IsPlaceOkCount = IsPlaceOkCount + 1
    for i = 1, n - 1 do   -- for each queen already placed
        if (a[i] == c) or                -- same column?
            (a[i] - i == c - n) or        -- same diagonal?
            (a[i] + i == c + n) then      -- same diagonal?
            return false            -- place can be attacked
        end
    end
    return true    -- no attacks; place is OK
end

local function bruteisplaceok (a, n, c)
    for i = 1, n - 1 do   -- for each queen already placed
        if (a[i] == c) or                -- same column?
            (a[i] - i == c - n) or        -- same diagonal?
            (a[i] + i == c + n) then      -- same diagonal?
            return false            -- place can be attacked
        end
    end
    return true    -- no attacks; place is OK
end

-- print a board
local function printsolution (a)
    for i = 1, N do      -- for each row
        for j = 1, N do    -- and for each column
            -- write "X" or "-" plus a space
            io.write(a[i] == j and "X" or "-", " ")
        end
        io.write("\n")
    end
    io.write("\n")
end

-- add to board 'a' all queens from 'n' to 'N'
local function addqueen (a, n)
    if n > N then    -- all queens have been placed?
        printsolution(a)
    else  -- try to place n-th queen
        for c = 1, N do
            if isplaceok(a, n, c) then
                a[n] = c    -- place n-th queen at column 'c'
                addqueen(a, n + 1)
            end
        end
    end
end

local function bruteaddqueen (a, n)
    n = n or 1
    if n > N then
        local valid
        for r = 2, N do
            valid = bruteisplaceok(a, r, a[r])
            Permutations = Permutations + 1
            if not valid then break end
        end
        if valid then printsolution(a) end
    else
        for c = 1, N do
            a[n] = c
            bruteaddqueen(a, n + 1)
        end
    end
end

-- run the program
addqueen({}, 1)
bruteaddqueen({}, 1)
print("IsPlaceOK Count: " .. IsPlaceOkCount)
print("Permutations Count: " .. Permutations)
print([[

A few things on this: 1) obv getting all the permutations takes a lot longer and
is a much bigger number, 2) I am definitely too dumb to understand recursive
functions off rip, had a very difficult time figuring out why the original
addqueen(a,n) function wasn't just spitting out one solve and exiting even with
internet help (think I understand it now), 3) ain't no way I would have come
close without looking up this stack overflow post which I mostly just copied:
https://stackoverflow.com/questions/48646608/the-eight-queen-puzzle-in-programming-in-lua-fourth-edition
and xmartin's answer.
]])
