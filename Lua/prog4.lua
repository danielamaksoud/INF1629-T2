-- =/=/=/=/=/=/=/=/=/=/
-- I N F I N I T E   M I R R O R
-- =/=/=/=/=/=/=/=/=/=/


-- Tratamos um erro de uso do programa
if #arg < 1 then
    print ("Uso: lua " .. arg[0] .. " <arquivo-de-teste>")
    return
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

for word in stop_words_text:gmatch"%w+" do
  stop_words[word] = true
end

print("Stopwords:")
for c, v in pairs(stop_words) do
  print(c .. "  -  " .. tostring(v))
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

print("TestText:")
print(test_text)

-----


-- Criamos uma tabela vazia chamada text_words
local word_freqs = {}  