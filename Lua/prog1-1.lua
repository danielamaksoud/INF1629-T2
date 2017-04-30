-- =/=/=/=/=/=/=/=/=/=/
-- C O D E  G O L F
-- =/=/=/=/=/=/=/=/=/=/

-- Tratamos um erro de uso do programa
if #arg < 1 then
    print ("Uso: lua " .. arg[0] .. " <arquivo-de-teste>")
    return
end

-- Abrimos o arquivo stop_words.txt para leitura
local stop_words_file = io.open("../stop_words.txt", "r")

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
print ("--------------------------------------------\nPalavras de Parada\n--------------------------------------------")
for i = 1, #stop_words do
      print (i," - ", stop_words[i])
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

-- Imprimimos as palavras da lista words na tela
print ("--------------------------------------------\nPalavras de Teste\n--------------------------------------------")
for i = 1, #words, 1 do
      print (i," - ",words[i])
end

-- Fechamos o arquivo test.txt
test_file:close()

-- Criamos uma lista vazia chamada counts
counts = {}

-- Inicializamos um contador de palavras de teste diferentes de palavras de parada
j = 0

-- Comparamos as palavras de teste da lista words com as palavras de parada da lista stop_words e incluímos na lista counts aquelas que fazem parte das palavras de teste, mas não fazem parte das palavras de parada
for i = 1, #words, 1 do
    for k = 1, #stop_words, 1 do
        if words[i] ~= stop_words[k] then
            j = j + 1
        end
    end
    if j == #stop_words then
            counts[#counts+1] = words[i]
    end
    j = 0
end

-- Imprimimos as palavras da lista counts na tela
print ("--------------------------------------------\nPalavras de Teste sem Palavras de Parada\n--------------------------------------------")
for i = 1, #counts, 1 do
      print (i," - ",counts[i])
end

-- Criamos uma matriz
mt = {}

-- Inicializamos um contador do número de ocorrência de palavras repetidas na lista counts
j = 1

-- Inicializamos um contador de palavras removidas da lista counts
c = 0

-- Preenchemos a matriz mt com as palavras da lista counts e seus respectivos números de ocorrência
for i = 1, #counts, 1 do
    for k = i+1, #counts, 1 do
        if counts[i] == counts[k] then
            table.remove(counts, k)
            c = c + 1
            j = j + 1
        end
    end
    mt[#mt+1] = {counts[i], j}
    -- mt[#mt+1] = tostring(j) .. counts[i]
    j = 1
end

-- Imprimimos todas as palavras da lista counts na tela
print ("--------------------------------------------\nPalavras Não Repetidas\n--------------------------------------------")
for i = 1, #counts, 1 do
      print (i, " - ", counts[i])
end

-- Imprimimos as palavras da lista counts e seus respectivos números de ocorrência na tela
print ("--------------------------------------------\nPalavras + Ocorrências\n--------------------------------------------\n")
for y = 1, #mt-c, 1 do
    for x = 1, 2 do
        if x == 1 then
            print("Palavra:", mt[y][x])
        else
            print("Ocorrência(s):", mt[y][x])
        end
    end
    print ("\n-----------------------------\n")
end

-- Ordenamos as palavras da lista coutns em ordem descrescente de número de ocorrência
for y = 1, #mt-c, 1 do
    for k = y+1, #mt-c, 1 do
        if (mt[y][2] < mt[k][2]) then
            aux1 = mt[y][1]
            aux2 = mt[y][2]
            mt[y][1] = mt[k][1]
            mt[y][2] = mt[k][2]
            mt[k][1] = aux1
            mt[k][2] = aux2
        end
    end
end

-- Imprimimos as palavras da lista counts em ordem descrescente de número de ocorrência e seus respectivos números de ocorrência na tela
print ("--------------------------------------------\nPalavras + Ocorrências\n--------------------------------------------\n")
if #mt > 25 then
    for y = 1, 25, 1 do
        for x = 1, 2 do
            if x == 1 then
                print("Palavra:", mt[y][x])
            else
                print("Ocorrência(s):", mt[y][x])
            end
        end
        print ("\n-----------------------------\n")
    end
    
    else
        for y = 1, #mt-c, 1 do
            for x = 1, 2 do
                if x == 1 then
                    print("Palavra:", mt[y][x])
                else
                    print("Ocorrência(s):", mt[y][x])
                end
            end
            print ("\n-----------------------------\n")
        end 
end