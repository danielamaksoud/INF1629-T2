-- =/=/=/=/=/=/=/=/=/=/
-- C O D E  G O L F
-- =/=/=/=/=/=/=/=/=/=/

-- Abrimos o arquivo stop_words.txt para leitura
local stop_words_file = io.open("../Documentos/stop_words.txt", "r")

-- Criamos uma lista vazia 
local stop_words = {}

-- Salvamos as palavras de parada em uma lista vazia
while true do
    for line in stop_words_file:lines() do
      table.insert(stop_words, line:match("([^,])"))
    end
    if line == nil then 
        print ("Deu m*rda") 
        break 
    end
end

-- Imprimimos as palavras de parada na tela
for i = 1, #stop_words do
      print (stop_words[i])
end

-- Fechamos o arquivo stop_words.txt
stop_words_file:close()

