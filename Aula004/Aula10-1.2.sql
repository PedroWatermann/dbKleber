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
SELECT CONCAT(a.primeiro_nome, ' ', a.ultimo_nome) 'Nome', f.titulo 'Nome do filme'
FROM filme f
JOIN filme_ator fa
ON f.filme_id = fa.filme_id
JOIN ator a
ON a.ator_id = fa.ator_id;

## 8- Relação de filmes e atores que atuaram no mesmo filme ordenada por filme
SELECT CONCAT(a.primeiro_nome, ' ', a.ultimo_nome) 'Nome', f.titulo 'Nome do filme'
FROM filme f
INNER JOIN filme_ator fa
ON f.filme_id = fa.filme_id
INNER JOIN ator a
ON a.ator_id = fa.ator_id
ORDER BY f.titulo;

## 9- Relação de filmes e atores que atuaram no mesmo ordenada por ator
SELECT CONCAT(a.primeiro_nome, ' ', a.ultimo_nome) 'Nome', f.titulo 'Nome do filme'
FROM filme f
JOIN filme_ator fa
ON f.filme_id = fa.filme_id
JOIN ator a
ON a.ator_id = fa.ator_id
ORDER BY CONCAT(a.primeiro_nome, ' ' ,a.ultimo_nome);

## 10- Relação de filmes com participação de um ator específico.
SELECT concat(a.primeiro_nome, ' ', a.ultimo_nome) 'Nome', f.titulo 'Nome do filme'
FROM filme f
JOIN filme_ator fa
ON f.filme_id = fa.filme_id
JOIN ator a
ON a.ator_id = fa.ator_id
WHERE CONCAT(a.primeiro_nome, ' ' ,a.ultimo_nome) LIKE 'ada%';

## 11- Quantidade total de filmes
SELECT COUNT(f.filme_id) 'Quantidade de filmes'
FROM filme f;

## 12- Duração média dos filmes
SELECT AVG(f.duracao_do_filme) 'Duração do filme (min)'
FROM filme f;
SELECT ROUND(AVG(f.duracao_do_filme), 0) 'Duração do filme (min)'
FROM filme f;

## 13- Lista de filmes por categoria.
SELECT f.titulo 'Nome do filme', c.nome 'Categoria'
FROM filme f
JOIN filme_categoria fc
ON f.filme_id = fc.filme_id
JOIN categoria c
ON c.categoria_id = fc.categoria_id
ORDER BY c.nome;

## 14- Quantidade de filmes por categoria.
SELECT c.nome 'Categoria', COUNT(f.filme_id) 'Quantidade'
FROM filme f
JOIN filme_categoria fc
ON f.filme_id = fc.filme_id
JOIN categoria c
ON c.categoria_id = fc.categoria_id
GROUP BY c.nome;

## 15- Duração média dos filmes por categoria
SELECT c.nome 'Categoria', ROUND(AVG(f.duracao_do_filme)) 'Duração (min)'
FROM filme f
JOIN filme_categoria fc
ON f.filme_id = fc.filme_id
JOIN categoria c
ON c.categoria_id = fc.categoria_id
GROUP BY c.nome;

## 16- Quantidade de filmes por categoria das categorias com menos de 57 filmes (uso de having)
SELECT c.nome 'Categoria', COUNT(f.filme_id) 'Quantidade'
FROM filme f
JOIN filme_categoria fc
ON f.filme_id = fc.filme_id
JOIN categoria c
ON c.categoria_id = fc.categoria_id
GROUP BY c.nome
HAVING Quantidade < 57;

## 17- Duração média dos filmes por categoria das categorias com menos de 57 filmes (uso do having)
SELECT c.nome 'Categoria', ROUND(AVG(f.duracao_do_filme)) 'Duração (min)'
FROM filme f
JOIN filme_categoria fc
ON f.filme_id = fc.filme_id
JOIN categoria c
ON c.categoria_id = fc.categoria_id
GROUP BY c.nome
HAVING COUNT(f.filme_id) < 57;

## 18- Quantidade de filmes alugados por cliente
SELECT CONCAT(c.primeiro_nome, ' ', c.ultimo_nome) 'Cliente', COUNT(f.filme_id) 'Quantidade'
FROM cliente c
INNER JOIN aluguel a
ON c.cliente_id = a.cliente_id
INNER JOIN inventario i
ON a.inventario_id = i.inventario_id
INNER JOIN filme f
ON f.filme_id = i.filme_id
GROUP BY Cliente;

## 19- Quantidade de filmes alugados por cliente em ordem decrescente de quantidade de filmes alugados
SELECT CONCAT(c.primeiro_nome, ' ', c.ultimo_nome) 'Cliente', COUNT(f.filme_id) 'Quantidade'
FROM cliente c
INNER JOIN aluguel a
ON c.cliente_id = a.cliente_id
INNER JOIN inventario i
ON a.inventario_id = i.inventario_id
INNER JOIN filme f
ON f.filme_id = i.filme_id
GROUP BY Cliente
ORDER BY Quantidade DESC;