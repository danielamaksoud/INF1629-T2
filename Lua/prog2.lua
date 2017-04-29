-- =/=/=/=/=/=/=/=/=/=/
-- M O N O L I T H
-- =/=/=/=/=/=/=/=/=/=/

-- Tratamos um erro de uso do programa
if #arg < 1 then
    print ("Uso: lua " .. arg[0] .. " <arquivo-de-teste>")
    return
end

-- Criamos uma tabela vazia chamada word_freqs
local word_freqs = {}

-- Abrimos o arquivo stop_words.txt para leitura
local stop_words_file = io.open("../stop_words.txt", "r")
local stop_words_text = stop_words_file:read"*all" -- Variavel para armazenar o texto


-- Criamos uma tabela vazia chamada stop_words
local stop_words = {}

-- Separamos as palavras de parada do arquivo stop_words.txt e as salvamos na tabela stop_words
stop_words = stop_words:gsub(",", " ")

for word in stop_words:gmatch"%w+" do
  table.insert(stop_words, word)
end

-- Fechamos o arquivo stop_words.txt
stop_words_file:close()


print(table.unpack())


-- Abrimos o arquivo test.txt para leitura
local test_file = io.open(arg[1], "r")