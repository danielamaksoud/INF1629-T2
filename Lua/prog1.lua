local stop_words_file = io.open("../stop_words.txt", "r")
local stop_words_text = stop_words_file:read("*all")
stop_words_file:close()

local stop_words = {}

for word in stop_words_text:gmatch"%w+" do
  stop_words[word] = true
end

local test_file = io.open(arg[1], "r")
local test_text = test_file:read("*all"):lower()
test_file:close()

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

local mt = {}

count1 = 1

for c, v in pairs(word_freqs) do
        mt[count1] = {}
        mt[count1][1] = c
        mt[count1][2] = v
        count1 = count1 + 1
end

for count2 = 1, #mt do
    for count1 = 1, #mt-1 do
        if mt[count1][2] < mt[count1+1][2] then
            aux1 = mt[count1][1]
            aux2 = mt[count1][2]
            mt[count1][1] = mt[count1+1][1]
            mt[count1][2] = mt[count1+1][2]
            mt[count1+1][1] = aux1
            mt[count1+1][2] = aux2
        end
    end
end

if (#mt > 25) then 
    for count1 = 1, 25 do
            print(mt[count1][1].." - "..mt[count1][2])
    end
    else
        for count1 = 1, #mt do
            print(mt[count1][1].." - "..mt[count1][2])
        end
end
