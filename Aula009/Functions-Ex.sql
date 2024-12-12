CREATE TABLE notas (
	aluno VARCHAR( 10 ),
    nota1 INT,
    nota2 INT,
    nota3 INT,
    nota4 INT
);

INSERT INTO notas
VALUES  ( 'Maria', 10, 9, 10, 10 ),
		( 'Pedro', 5, 2, 3, 4 );
        
########################################################################################
        
DELIMITER //
## No parâmetro eu devo passar a coluna da tabela e o tipo
CREATE FUNCTION media ( nome VARCHAR(10) )
RETURNS FLOAT
##Diz que a função não altera os dados, apenas os retorna
DETERMINISTIC 
BEGIN
	DECLARE n1, n2, n3, n4 INT;
    DECLARE med FLOAT;
		SELECT nota1, nota2, nota3, nota4
		INTO n1, n2, n3, n4
		FROM notas
		WHERE aluno = nome;
    SET med = ( n1 + n2 + n3 + n4 ) / 4;
    RETURN med;
END
//
DELIMITER ;

########################################################################################

SELECT media ( 'Maria' );
SELECT media ( 'Pedro' );