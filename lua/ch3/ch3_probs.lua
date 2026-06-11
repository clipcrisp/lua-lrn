function Ex1_1()
    print([[

Valid: 
    .0e12, 0xFFFFFFFF, 0xA, 0x12
Invalid:
    FFFF, 0xABFG, 0x
]])
end

function Ex1_2()
end

function Ex1_3()
end

function Ex1_4()
end

function Ex1_5()
end

function Ex1_6()
end

function Ex1_7()
end

-- Boilerplate for all exercises in one file. Some of the questions may not
-- have solves but I'll probably print my thinking.
-- Had to put this after since I believe there's not a way to declare functions
-- before their definition.
if arg[1] == nil then
    print("Please enter a exercise from the squence below to run the solve.")
    print("Exercises: 1.1, 1.2, ... 1.8")
    os.exit(1)
elseif arg[1] == "1.1" then
    Ex1_1()
elseif arg[1] == "1.2" then
    Ex1_2()
elseif arg[1] == "1.3" then
    Ex1_3()
elseif arg[1] == "1.4" then
    Ex1_4()
elseif arg[1] == "1.5" then
    Ex1_5()
elseif arg[1] == "1.6" then
    Ex1_6()
elseif arg[1] == "1.7" then
    Ex1_7()
else
    print("Please enter a exercise from the squence below to run the solve.")
    print("Exercises: 1.1, 1.2, ... 1.8")
    os.exit(1)
end
