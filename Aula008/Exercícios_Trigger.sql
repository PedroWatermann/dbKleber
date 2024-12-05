## 1 – Crie uma trigger que ao atualizar a população de uma cidade na tabela city o banco atualize a quantidade de habitantes de um país.
DELIMITER $
CREATE TRIGGER tgr_atualizar_habitantes 
AFTER UPDATE ON city
FOR EACH ROW
BEGIN
	UPDATE country c
    SET c.Population = 
    (
		SELECT SUM( city.Population )
        FROM city
        WHERE city.CountryCode = c.Code
    )
    WHERE c.Code = NEW.CountryCode;
END $

## 2 – Crie uma tabela que armazene a média populacional por continente. Faça uma trigger que atualize a média da população do continente cada vez que a população de um país for alterada.
CREATE TABLE media_populacao_continente
( 
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    continente VARCHAR(50),
    media DOUBLE
);

INSERT INTO media_populacao_continente (continente, media)
SELECT Continent, AVG(Population)
FROM country
GROUP BY Continent;

DELIMITER $
CREATE TRIGGER tgr_atualiza_media_populacao_continente
AFTER UPDATE ON country
FOR EACH ROW
BEGIN
    UPDATE media_populacao_continente
    SET media = 
    (
        SELECT AVG(Population)
        FROM country
        WHERE Continent = NEW.Continent
    )
    WHERE continente = NEW.Continent;
END $

## 3 – Crie uma trigger que seja acionada sempre que um registro da tabela country_language for apagado, esta tabela deve ter a mesma estrutura do original e deve guardar os registros que foram apagados junto da data/hora e o usuário do banco de dados que efetuou a ação.
CREATE TABLE lixeira 
(
	CountryCode CHAR(3) NOT NULL PRIMARY KEY,
    Language CHAR(30) NOT NULL PRIMARY KEY,
    IsOfficial ENUM('T', 'F'),
    Percentage DECIMAL(4, 1),
    dataHora DATETIME,
    usuario VARCAHR(255);
);

DELIMITER $
CREATE TRIGGER tgr_lixeira
BEFORE DELETE ON countrylanguage
FOR EACH ROW
BEGIN
	INSERT INTO lixeira ( CountryCode, Language, IsOfficial, Percentage, dataHora, usuario )
    VALUES ( OLD.CountryCode, OLD.Language, OLD.IsOfficial, OLD.Percentage, USER(), NOW() );
END $

## 4 – Crie uma trigger que ao tentar apagar um país faça uma verificação nas tabelas city e country_language, caso encontre algum registro nessa tabela aborte a deleção informando que não pode ser apagado pois há registros em outra tabela. (Pequise mais sobre SIGNAL no MySQL)


















