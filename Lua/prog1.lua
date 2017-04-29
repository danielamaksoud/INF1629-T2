-- =/=/=/=/=/=/=/=/=/=/
-- C O D E  G O L F
-- =/=/=/=/=/=/=/=/=/=/

-- Abrimos o arquivo stop_words.txt para leitura
local stop_words_file = io.open("Documentos/stop_words.txt", "r")

-- Salvamos as palavras de parada em uma lista 
if stop_words_file then
    for line in stop_words_file:lines() do
        local stop_words = unpack(line:split(","))
    end
end

-- Fechamos o arquivo stop_words.txt
io.input():close()

