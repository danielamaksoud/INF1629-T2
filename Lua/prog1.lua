-- =/=/=/=/=/=/=/=/=/=/
-- C O D E  G O L F
-- =/=/=/=/=/=/=/=/=/=/

-- Tratamos um erro de uso do programa
if #arg < 1 then
    print ("Uso: lua " .. arg[0] .. " <arquivo-de-teste>")
    return
end

-- Abrimos o arquivo stop_words.txt para leitura
local stop_words_file = io.open("../Documentos/stop_words.txt", "r")

-- Criamos uma lista vazia chamada stop_words
local stop_words = {}

-- Separamos as palavras de parada do arquivo stop_words.txt e as salvamos na lista stop_words
while true do
        line = stop_words_file.read(stop_words_file)
    
        if not line then 
            break 
        end
    
        for word in string.gmatch(line, "%a+") do
            stop_words[#stop_words+1] = word
        end
end

-- Imprimimos as palavras de parada da lista stop_words na tela
print ("-----------------------------\nPalavras de Parada\n-----------------------------")
for i = 1, #stop_words do
      print (i, stop_words[i])
end

-- Fechamos o arquivo stop_words.txt
stop_words_file:close()

-- Abrimos o arquivo test.txt para leitura
local test_file = io.open(arg[1], "r")

-- Criamos uma lista vazia chamada words
local words = {}

-- Separamos as palavras do arquivo test.txt e as salvamos em letras minúsculas na lista words
while true do
        line = test_file.read(test_file)
    
        if not line then 
            break 
        end
    
        for word in string.gmatch(line, "%a+") do
            words[#words+1] = string.lower(word)
        end
end

-- Imprimimos as palavras de parada da lista stop_words na tela
print ("-----------------------------\nPalavras de Teste\n-----------------------------")
for i = 1, #words do
      print (i, words[i])
end

-- Fechamos o arquivo test.txt
test_file:close()



