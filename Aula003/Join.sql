## Retorna os dados que são comuns entre ambas as tabelas
-- 600 row(s) returned
SELECT c.cidade, p.pais
FROM cidade c, pais p
WHERE c.pais_id = p.pais_id;

SELECT c.cidade, p.pais
FROM cidade c
JOIN pais p 
ON c.pais_id = p.pais_id;

## Retorno de dados de duas taelas não relacionadas
-- 5462 row(s) returned
SELECT *
FROM ator a, filme f, filme_ator fa
WHERE a.ator_id = fa.ator_id
AND fa.filme_id = f.filme_id;