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

-- Criamos uma tabela vazia chamada stop_words
local stop_words = {}

-- Separamos as palavras de parada do arquivo stop_words.txt e as salvamos na tabela stop_words
while true do
        line = stop_words_file.read(stop_words_file)
    
        if not line then 
            break 
        end
    
        for word in string.gmatch(line, "%a+") do
            stop_words[#stop_words+1] = word
        end
end

-- Fechamos o arquivo stop_words.txt
stop_words_file:close()

-- Abrimos o arquivo test.txt para leitura
local test_file = io.open(arg[1], "r")