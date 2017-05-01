read_file = function (path_to_file, func)
    local test_file = io.open(path_to_file, "r")
    local test_text = test_file:read("*all"):lower()
    test_file:close()
    
    func(test_text, sort)
end

remove_stop_words_add_frequencies = function (test_text, func)
    local stop_words_file = io.open("../stop_words.txt", "r")
    local stop_words_text = stop_words_file:read("*all")
    stop_words_file:close()

    local stop_words = {}

    for word in stop_words_text:gmatch"%w+" do
      stop_words[word] = true
    end

    local word_freqs = {}  

    for word in test_text:gmatch"%w+" do
        if not stop_words[word] then	
            if not word_freqs[word] then	
                word_freqs[word] = 1
            else
                word_freqs[word] = word_freqs[word] + 1
            end
        end 
    end  
    
    func(word_freqs, print_text)
end

sort = function (word_freqs, func)
    local mt = {}

    i = 1

    for c, v in pairs(word_freqs) do
            mt[i] = {}
            mt[i][1] = c
            mt[i][2] = v
            i = i + 1
    end

    for j = 1, #mt do
        for i = 1, #mt-1 do
            if (mt[i][2] < mt[i+1][2]) then
                aux1 = mt[i][1]
                aux2 = mt[i][2]
                mt[i][1] = mt[i+1][1]
                mt[i][2] = mt[i+1][2]
                mt[i+1][1] = aux1
                mt[i+1][2] = aux2
            end
        end
    end
    
    func(mt)
end

print_text = function (mt)
    if (#mt > 25) then 
        for i = 1, 25 do
                print(mt[i][1].." - "..mt[i][2])
        end
        else
            for i = 1, #mt do
                print(mt[i][1].." - "..mt[i][2])
            end
    end

end

--[[
    The main function
]]

read_file(arg[1], remove_stop_words_add_frequencies)