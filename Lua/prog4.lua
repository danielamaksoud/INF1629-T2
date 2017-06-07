-- =/=/=/=/=/=/=/=/=/=/=/=/=/=/=/
-- I N F I N I T E   M I R R O R
-- =/=/=/=/=/=/=/=/=/=/=/=/=/=/=/

-- Conta tamanho de mapas em Lua (http://stackoverflow.com/questions/9613322/lua-table-getn-returns-0)
function table.map_length(t)
    local c = 0
    for k,v in pairs(t) do
         c = c+1
    end
    return c
end

-- Tratamos um erro de uso do programa
if #arg < 1 then
    print ("Uso: lua " .. arg[0] .. " <arquivo-de-teste>")
    return
end

-- Função recursiva para contar palavras que não são stopwords
function count(word_list, stopwords, wordfreqs)
  	if #word_list == 0 then
    	return
  	else
    	word = word_list[1]
    	if not stopwords[word] then
      		if not wordfreqs[word] then
      			wordfreqs[word] = 1	
      		else
        		wordfreqs[word] = wordfreqs[word] + 1
      		end
 		end
 		table.remove(word_list,1)
      	count(word_list, stopwords, wordfreqs)	   
    end
end

-- Imprime o resultado
-- revisão (Roxana)
-- a função wf_print devería tambem ser recursiva, segundo o estilo
-- faltou o limite para printar só os 25 termos mais frequentes
function wf_print(wordfreq)
	if table.map_length(wordfreq) == 0 then
		return
	else
		for c, v in pairs(wordfreq) do
  			print(c .. "  -  " .. v)
		end
	end
end

-----
-- COLETA STOPWORDS DO ARQUIVO DE STOPWORDS
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

-- revisão (Roxana) a filtragem de carateres alfanumericos não é feito para este estilo no livro
-- os estilo pipeline e kick-forward sim realizam essa filtragem 
-- "Takes a string and returns a copy with all nonalphanumeric chars replaced by white space" (página 42)
-- essa filtragem é feita para o texto a ser processado, no caso o 'pride-and-prejudice.txt'
-- nas linhas 71-73 a filtragem esta sendo feito para a texto de stopwords
for word in stop_words_text:gmatch"%w+" do
  stop_words[word] = true
end


-----
-- COLETA PALAVRAS DO ARQUIVO DE TESTE
------

-- Abrimos o arquivo test.txt para leitura
local test_file = io.open(arg[1], "r")
local test_text = test_file:read"*all":lower() -- Variavel para armazenar o texto

-- Fechamos o arquivo test.txt
test_file:close()

test_text = test_text:gsub(","," ")




-- Criamos a tabela  words com todas as palavras que não são stop_words do test_text.
local words = {}

for word in test_text:gmatch"%w+" do
	table.insert(words,word)
end


-- Criamos uma tabela vazia word_freqs para contar as frequencias das palavras que não são stopwords
local word_freqs = {}  

count(words, stop_words, word_freqs)
wf_print(word_freqs)





