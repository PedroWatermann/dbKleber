## 01) Listar todas as categorias que iniciam com a letra 'A'
SELECT * 
FROM categoria
WHERE nome LIKE 'A%';
-- 2 row(s) returned

## 02) Listar todas as categorias que terminam com a letra 's'
SELECT * 
FROM categoria
WHERE nome LIKE '%s';
-- 3 row(s) returned

## 03) Listar todas as categorias que iniciam com 'A' e terminam com 'n'
SELECT * 
FROM categoria
WHERE nome LIKE 'A%n';
-- 2 row(s) returned

## 04) Listar o nome de todas as cidades que possuem a string 'mar' em seu nome, não importa a posicao
SELECT cidade
FROM cidade
WHERE cidade LIKE '%mar%';
-- 5 row(s) returned

## 05) Listar todos os atores cujo primeiro nome inicie com 'E' e o último nome inicie com 'M'
SELECT *
FROM ator
WHERE primeiro_nome LIKE 'E%'
AND ultimo_nome LIKE 'M%';
-- 2 row(s) returned

## 06) listar todos os atores que possuem 'Ed' iniciando o primeiro nome, ordene pelo ultimo nome
SELECT * 
FROM ator
WHERE primeiro_nome LIKE 'Ed%'
ORDER BY ultimo_nome ASC;
-- 3 row(s) returned

## 07) Listar todos os atores que possuem 'Jen' iniciando o primeiro nome ou 'Pres' iniciando o ultimo nome, ordene pelo primeiro nome
SELECT * 
FROM ator
WHERE primeiro_nome LIKE 'Jen%'
OR ultimo_nome LIKE 'Pres%'
ORDER BY primeiro_nome ASC;
-- 2 row(s) returned