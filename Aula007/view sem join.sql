## Quando a view é criada sem join é possível alterar os dados ##

SELECT a.ator_id, a.primeiro_nome, a.ultimo_nome, f.*
FROM ator a, filme_ator fa, filme f
WHERE a.ator_id = fa.ator_id
AND fa.filme_id = f.filme_id;

CREATE OR REPLACE VIEW filme_ator_view AS
	SELECT a.ator_id, a.primeiro_nome, a.ultimo_nome, f.*
	FROM ator a, filme_ator fa, filme f
	WHERE a.ator_id = fa.ator_id
	AND fa.filme_id = f.filme_id;
    
UPDATE filme_ator_view
SET primeiro_nome = 'Peperoni'
WHERE ator_id = 1;