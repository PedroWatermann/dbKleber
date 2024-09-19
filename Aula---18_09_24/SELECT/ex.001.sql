-- A) Listar todas as cidades do país 6
SELECT cidade 
FROM cidade 
WHERE pais_id = 6;
## Retornou 1 coluna com 13 registros

-- B) Listar todas as cidades do país 1 ou 26
SELECT cidade
FROM cidade
WHERE pais_id IN (1, 26);
## Retornou 1 coluna com 2 registros

-- C) Listar todas as cidades cujo id do país seja maior que 40
SELECT pais_id, cidade 
FROM cidade
WHERE pais_id > 40
ORDER BY pais_id ASC;
## Retornou 1 coluna com 422 registros

-- D) Listar todas as lojas do gerente numero 2
SELECT loja_id
FROM loja
WHERE gerente_id = 2;
## Retornou 1 coluna com 1 registro

-- E) Listar todos os registros da tabela idioma cujo nome seja english
SELECT * 
FROM idioma
WHERE nome = 'English';
## Retornou 3 colunas com 1 registro

-- F) Listar todos os clientes cujo último nome seja bailey ou taylor
SELECT * 
FROM cliente
WHERE ultimo_nome IN ('BAILEY', 'TAYLOR');
## Retornou 9 colunas com 2 registros

-- G) Listar todos os cliente cujo primeiro nome seja veronica
SELECT *
FROM cliente
WHERE primeiro_nome = 'VERONICA';
## Retornou 9 colunas com 1 registro

-- H) Listar todos os clientes que sejam da loja 2
SELECT *
FROM cliente
WHERE loja_id = 2;
## Retornou 9 colunas com 273 registros

-- I) Listar todos os atores que tenham como primeiro nome: jennifer, bette, elvis, scarlett
SELECT primeiro_nome, ultimo_nome
FROM ator
WHERE primeiro_nome 
IN ('JENNIFER', 'BETTE', 'ELVIS', 'SCARLETT');
## Retornou 2 colunas com 5 registros

-- J) Listar todos os atores cujo id seja maior que 180
SELECT primeiro_nome, ultimo_nome
FROM ator
WHERE ator_id > 180;
## Retornou 2 colunas com 20 registros

-- K) Listar todos os alugueis do cliente 269
SELECT * 
FROM aluguel
WHERE cliente_id = 269;
## Retornou 7 colunas com 30 registros

-- L) Listar todos os alugueis do cliente 269 que foi feito pelo funcionário 1
SELECT * 
FROM aluguel
WHERE cliente_id = 269
AND funcionario_id = 1;
## Retornou 7 colunas com 14 registros

-- M) Listar todos os filmes que os atores 33 ou 19 participaram
SELECT DISTINCT filme.titulo
FROM filme_ator
LEFT JOIN filme ON filme_ator.filme_id = filme.filme_id
WHERE ator_id 
IN (19, 33);
## Caso não houvesse o distinct, retornaria um registro a mais (49), pois há um filme onde os dois atores participaram juntos

SELECT f.titulo, a.primeiro_nome, a.ultimo_nome
FROM filme f, ator AS a, filme_ator fa
WHERE a.ator_id = fa.ator_id 
AND f.filme_id = fa.filme_id 
AND a.ator_id IN (19, 33);
## Retornou 1 coluna com 49 registros

-- N) Listar todos os pagamentos maiores que 5 e realizados pelo cliente 12
SELECT * 
FROM pagamento
WHERE valor > 5
AND cliente_id = 12;
## Retornou 7 colunas com 7 registros

-- O) Listar todos os pagamentos que não foram feitos pelo funcionario 1
SELECT * 
FROM pagamento
WHERE funcionario_id <> 1;
## Retornou 7 linhas com 7992 registros