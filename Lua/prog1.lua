-- =/=/=/=/=/=/=/=/=/=/
-- C O D E  G O L F
-- =/=/=/=/=/=/=/=/=/=/

local stop_words_file = io.open("../stop_words.txt", "r")
local stop_words_text = stop_words_file:read"*all"

stop_words_file:close()

local stop_words = {}

for word in stop_words_text:gmatch"%w+" do
  stop_words[word] = true
end

local test_file = io.open(arg[1], "r")
local test_text = test_file:read"*all":lower()

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

for c, v in pairs(word_freqs) do
        table.sort(word_freqs, v)
        print(c .. "  -  " .. v)
end