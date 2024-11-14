## Views criadas a partir de joins ou expressões ##
## não permitem alteração, apenas visualização   ##

SELECT a.ator_id, concat(a.primeiro_nome, ' ', a.ultimo_nome), f.*
FROM ator a
JOIN filme_ator fa 
ON fa.ator_id = a.ator_id
JOIN filme f 
ON fa.filme_id = f.filme_id;

CREATE VIEW filme_ator_view AS
	SELECT a.ator_id, concat(a.primeiro_nome, ' ', a.ultimo_nome), f.*
	FROM ator a
	JOIN filme_ator fa 
	ON fa.ator_id = a.ator_id
	JOIN filme f 
	ON fa.filme_id = f.filme_id;

DROP VIEW filme_ator_view;