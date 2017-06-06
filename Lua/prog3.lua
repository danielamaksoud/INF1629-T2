-- =/=/=/=/=/=/=/=/=/=/=/=/
-- K I C K  F O R W A R D
-- =/=/=/=/=/=/=/=/=/=/=/=/

--[[
    Nome da funcao: read_file
    Descricao: Le o arquivo fornecido na linha de comando, passa o texto do mesmo e a funcao sort para a funcao remove_stop_words_add_frequencies.
]]

read_file = function (path_to_file, func)
    local test_file = io.open(path_to_file, "r")
    local test_text = test_file:read("*all"):lower()
    test_file:close()
    
    func(test_text, sort)
end

--[[
    Nome da funcao: remove_stop_words_add_frequencies
    Descricao: Le o arquivo stop_words.txt, identifica se o indice word de stop_words e palavra de parada, armazena as palavras que nao sao de parada e suas frequencias em word_freqs e passa as frequencias e a funcao print_text para a funcao sort.
]]

remove_stop_words_add_frequencies = function (test_text, func)
    local stop_words_file = io.open("../stop_words.txt", "r")
    local stop_words_text = stop_words_file:read("*all")
    stop_words_file:close()

    local stop_words = {}

    for word in stop_words_text:gmatch"%w+" do
      stop_words[word] = true
    end

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
    
    func(word_freqs, print_text)
end

--[[
    Nome da funcao: sort
    Descricao: Coloca os dados (key e value) de word_freqs em um array multidimensional chamado mt, ordena mt e passa mt para print_text.
]]
-- revisão (Roxana): algo tem de errado na ordenação (vejam a imagem)
sort = function (word_freqs, func)
    local mt = {}

    count1 = 1

    for c, v in pairs(word_freqs) do
            mt[count1] = {}
            mt[count1][1] = c
            mt[count1][2] = v
            count1 = count1 + 1
    end

    for count2 = 1, #mt do
        for count1 = 1, #mt-1 do
            if (mt[count1][2] < mt[count1+1][2]) then
                aux1 = mt[count1][1]
                aux2 = mt[count1][2]
                mt[count1][1] = mt[count1+1][1]
                mt[count1][2] = mt[count1+1][2]
                mt[count1+1][1] = aux1
                mt[count1+1][2] = aux2
            end
        end
    end
    
    func(mt)
end

--[[
    Nome da funcao: print_text
    Descricao: Exibe os dados de mt na tela.
]]

print_text = function (mt)
    if (#mt > 25) then 
        for count1 = 1, 25 do
                print(mt[count1][1].." - "..mt[count1][2])
        end
        else
            for count1 = 1, #mt do
                print(mt[count1][1].." - "..mt[count1][2])
            end
    end

end

--[[
    Nome da Funcao: Principal
    Descricao: Le arquivo da linha de comando e chama as outras funcoes do programa.
]]

read_file(arg[1], remove_stop_words_add_frequencies)
