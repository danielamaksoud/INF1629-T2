-- =/=/=/=/=/=/=/=/=/=/
-- C O D E  G O L F
-- =/=/=/=/=/=/=/=/=/=/

-- Abrimos o arquivo stop_words.txt para leitura
local stop_words_file = io.open("../Documentos/stop_words.txt", "r")

-- Criamos uma lista vazia 
local stop_words = {}

while true do
        line = stop_words_file.read(stop_words_file)
    
        if not line then 
            break 
        end
    
        table.insert(stop_words, line:match("([^,])"))
    
        for word in string.gmatch(line, "%a+") do
            stop_words[#stop_words+1] = word
        end
end

-- Imprimimos as palavras de parada na tela
for i = 1, #stop_words do
      print (i, stop_words[i])
end

-- Fechamos o arquivo stop_words.txt
stop_words_file:close()
