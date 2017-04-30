-- =/=/=/=/=/=/=/=/=/=/
-- M O N O L I T H
-- =/=/=/=/=/=/=/=/=/=/

-- Tratamos um erro de uso do programa
if #arg < 1 then
    print ("Uso: lua " .. arg[0] .. " <arquivo-de-teste>")
    return
end

-----
-- TRATA ARQUIVO DE STOPWORDS
------

-- Abrimos o arquivo stop_words.txt para leitura
local stop_words_file = io.open("../stop_words.txt", "r")
local stop_words_text = stop_words_file:read"*all" -- Variavel para armazenar o texto

-- Fechamos o arquivo stop_words.txt
stop_words_file:close()

-- Criamos uma tabela vazia chamada stop_words
local stop_words = {}

-- Separamos as palavras de parada do arquivo stop_words.txt e as salvamos na tabela stop_words
stop_words_text = stop_words_text:gsub(",", " ")

for word in stop_words_text:gmatch"%w+" do
  stop_words[word] = true
end


-----
-- TRATA ARQUIVO DE TESTE E FREQUENCIA
------

-- Abrimos o arquivo test.txt para leitura
local test_file = io.open(arg[1], "r")
local test_text = test_file:read"*all" -- Variavel para armazenar o texto

-- Fechamos o arquivo stop_words.txt
test_file:close()

-- Criamos uma tabela vazia chamada text_words
local word_freqs = {}  

test_text = test_text:gsub(","," ")

for word in test_text:gmatch"%w+" do
	if stop_words[word] then
		print(word .. " is Stop Word")
	else
		print(word .. " is not Stop Word")
	end
end

for word in test_text:gmatch"%w+" do
    if not stop_words[word] then	
  	    if not word_freqs[word] then	
  	        word_freqs[word] = 0
        end 
    end 
end 


for c, v in pairs(word_freqs) do
  print(c, v)
end



