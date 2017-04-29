-- =/=/=/=/=/=/=/=/=/=/
-- M O N O L I T H
-- =/=/=/=/=/=/=/=/=/=/

-- Tratamos um erro de uso do programa
if #arg < 1 then
    print ("Uso: lua " .. arg[0] .. " <arquivo-de-teste>")
    return
end

-- Abrimos o arquivo stop_words.txt para leitura
local stop_words_file = io.open("../stop_words.txt", "r")

-- Criamos uma tabela vazia chamada word_freqs
local word_freqs = []