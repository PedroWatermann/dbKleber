## 1- Lista de todos os filmes
SELECT * 
FROM filmes;

## 2- Lista do titulo de todos os filmes
SELECT titulo
FROM filme;

## 3- Lista de filmes com duração menor do que 60 minutos
SELECT * 
FROM filme f
WHERE f.duracao_do_filme < 60;

## 4- Lista dos clientes inativos
SELECT *
FROM cliente c
WHERE c.ativo = 0;

## 5- Lista dos clientes ativos e respectivos endereços
SELECT c.primeiro_nome, e.*
FROM cliente c
INNER JOIN endereco e
ON c.endereco_id = e.endereco_id
WHERE c.ativo = 1;

## 6- Lista dos nomes dos clientes residentes no Brasil.
SELECT c.primeiro_nome, e.*, ci.cidade, p.pais
FROM cliente c
INNER JOIN endereco e
ON e.endereco_id = c.endereco_id
INNER JOIN cidade ci
ON ci.cidade_id = e.cidade_id
INNER JOIN pais p
ON ci.pais_id = p.pais_id
WHERE p.pais LIKE 'Bra_il';

## 7- Relação de filmes e atores que atuaram no mesmo
SELECT concat(a.primeiro_nome, ' ', a.ultimo_nome) 'Nome', f.titulo 'Nome do filme'
FROM filme f
JOIN filme_ator fa
ON f.filme_id = fa.filme_id
JOIN ator a
ON a.ator_id = fa.ator_id;

## 8- Relação de filmes e atores que atuaram no mesmo filme ordenada por filme
SELECT concat(a.primeiro_nome, ' ', a.ultimo_nome) 'Nome', f.titulo 'Nome do filme'
FROM filme f
INNER JOIN filme_ator fa
ON f.filme_id = fa.filme_id
INNER JOIN ator a
ON a.ator_id = fa.ator_id
ORDER BY f.titulo;

## 9- Relação de filmes e atores que atuaram no mesmo ordenada por ator
SELECT concat(a.primeiro_nome, ' ', a.ultimo_nome) 'Nome', f.titulo 'Nome do filme'
FROM filme f
JOIN filme_ator fa
ON f.filme_id = fa.filme_id
JOIN ator a
ON a.ator_id = fa.ator_id
ORDER BY concat(a.primeiro_nome, ' ' ,a.ultimo_nome);

## 10- Relação de filmes com participação de um ator específico.
SELECT concat(a.primeiro_nome, ' ', a.ultimo_nome) 'Nome', f.titulo 'Nome do filme'
FROM filme f
JOIN filme_ator fa
ON f.filme_id = fa.filme_id
JOIN ator a
ON a.ator_id = fa.ator_id
WHERE concat(a.primeiro_nome, ' ' ,a.ultimo_nome) LIKE 'ada%';

## 11- Quantidade total de filmes
SELECT count(f.filme_id) 'Quantidade de filmes'
FROM filme f;

## 12- Duração média dos filmes
SELECT avg(f.duracao_do_filme) 'Duração do filme (min)'
FROM filme f;
SELECT round(avg(f.duracao_do_filme), 0) 'Duração do filme (min)'
FROM filme f;

## 13- Lista de filmes por categoria.


## 14- Quantidade de filmes por categoria.

## 15- Duração média dos filmes por categoria

## 16- Quantidade de filmes por categoria das categorias com menos de 57 filmes (uso de having)

## 17- Duração média dos filmes por categoria das categorias com menos de 57 filmes (uso do having)

## 18- Quantidade de filmes alugados por cliente

## 19- Quantidade de filmes alugados por cliente em ordem decrescente de quantidade de filmes alugados