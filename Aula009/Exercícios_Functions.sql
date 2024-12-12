## 1) Criar uma função para calcular o número de filmes por categoria. 
	-- Crie uma função chamada quantidade_filmes_categoria que receba o nome da categoria como parâmetro e retorne o número de filmes dessa categoria.
drop function quantidade_filmes_categoria;
    
DELIMITER //
CREATE FUNCTION quantidade_filmes_categoria ( nome VARCHAR( 25 ) )
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE qtde INT;
		SELECT count(f.filme_id)
        INTO qtde
		FROM filme f
		JOIN filme_categoria fc
		ON f.filme_id = fc.filme_id
		JOIN categoria c
		ON c.categoria_id = fc.categoria_id
		WHERE c.nome = nome
		GROUP BY fc.categoria_id;
	RETURN qtde;
END //
DELIMITER ;

SELECT quantidade_filmes_categoria('Action'); ## Returns 64

## 2) Criar uma função para calcular a duração média de filmes por classificação. 
	-- Crie uma função chamada duracao_media_classificacao que receba a classificação (rating) como parâmetro e retorne a duração média dos filmes dessa classificação.
DELIMITER //
CREATE FUNCTION duracao_media_classificacao ( rating VARCHAR( 5 ) )
RETURNS FLOAT
DETERMINISTIC
BEGIN
	DECLARE duracao_media FLOAT;
		SELECT AVG ( duracao_do_filme ) 
        INTO duracao_media
        FROM filme
        WHERE classificacao = rating;
	RETURN duracao_media;
END //
DELIMITER ;

SELECT duracao_media_classificacao ( 'PG' ); ## Returns 112.005

## 3) Criar uma função para calcular a receita total de um cliente. 
	-- Crie uma função chamada receita_total_cliente que receba o customer_id como parâmetro e retorne a receita total gerada por ele. 
DELIMITER //
CREATE FUNCTION receita_total_cliente ( customer_id INT )
RETURNS FLOAT
DETERMINISTIC
BEGIN
	DECLARE receita FLOAT;
		SELECT SUM(p.valor)
        INTO receita
		FROM pagamento p
		JOIN cliente c
		ON c.cliente_id = p.cliente_id
		WHERE p.cliente_id = customer_id;
	RETURN receita;
END //
DELIMITER ;

SELECT receita_total_cliente ( 1 ); ## Returns 118.68

## 4) Criar uma função para retornar o nome completo de um cliente. 
	-- Crie uma função chamada nome_completo_cliente que receba o customer_id como parâmetro e retorne o nome completo do cliente (primeiro nome + último nome). 
DELIMITER //
CREATE FUNCTION nome_completo_cliente ( customer_id INT )
RETURNS VARCHAR ( 255 )
DETERMINISTIC
BEGIN
	DECLARE nome_completo VARCHAR ( 255 );
		SELECT CONCAT( primeiro_nome, ' ', ultimo_nome )
        INTO nome_completo
		FROM cliente
		WHERE cliente_id = customer_id;
	RETURN nome_completo;
END //
DELIMITER ;

SELECT nome_completo_cliente ( 1 ); ## Returns Mary Smith

## 5) Criar uma função para verificar a disponibilidade de um filme.
	-- Crie uma função chamada filme_disponivel que receba o film_id como parâmetro e retorne 1 se o filme está disponível para aluguel, ou 0 caso contrário.
DELIMITER //
CREATE FUNCTION filme_disponivel ( film_id INT )
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE data_devolucao VARCHAR ( 100 );
    DECLARE disponivel INT;
		SELECT CASE
			WHEN COUNT(a.aluguel_id) = 0 THEN TRUE -- Nenhum aluguel ativo
			ELSE FALSE -- Existem aluguéis em aberto
		END INTO disponivel
		FROM inventario i
		LEFT JOIN aluguel a ON i.inventario_id = a.inventario_id
        AND (a.data_de_devolucao IS NULL) -- Apenas aluguéis não devolvidos
		WHERE i.filme_id = film_id;
	RETURN disponivel;
END //
DELIMITER ;

SELECT filme_disponivel ( 3 ); ## Returns 1