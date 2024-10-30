## Exercício 1
CREATE TABLE categoria_filme (
	categoria_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(50)
);

## Exercício 2
CREATE TABLE endereco (
	endereco_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(100),
    cidade VARCHAR(50),
    estado VARCHAR(50),
    cep VARCHAR(10)
);

## Exercício 3
CREATE TABLE pagamento (
	pagamento_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT REFERENCES cliente (cliente_id),
    valor DECIMAL(5, 2),
    data_pagamento DATETIME
);

## Exercício 4
CREATE TABLE funcionario (
	funcionario_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    sobrenome VARCHAR(50),
    email VARCHAR(100)
);

## Exercício 5
CREATE TABLE loja (
	loja_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_loja VARCHAR(50),
    endereco_id INT REFERENCES endereco (endereco_id)
);

## Exercício 6
CREATE TABLE idioma (
	idioma_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_idioma VARCHAR(20)
);

## Exercício 7
CREATE TABLE avaliacao (
	avaliacao_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT REFERENCES cliente (cliente_id),
    filme_id INT REFERENCES filme (filme_id),
    nota INT,
    comentario TEXT,
    FOREIGN KEY
);

## Exercício 8
CREATE TABLE genero (
	genero_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_genero VARCHAR(50)
);

## Exercício 9
CREATE TABLE filme_genero (
	filme_id INT REFERENCES filme (filme_id),
    genero_id INT REFERENCES genero (genero_id)
);

## Exercício 10
CREATE TABLE promocao (
	promocao_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(255),
    data_inicio DATE,
    data_fim DATE,
    desconto DECIMAL(3, 2)
);

## Exercício 11
ALTER TABLE cliente 
ADD COLUMN telefone VARCHAR(15);

## Exercício 12
ALTER TABLE ator ADD nome_completo VARCHAR(150);

UPDATE ator
SET nome_completo = CONCAT(primeiro_nome, ' ', ultimo_nome);


## Exercício 13
ALTER TABLE funcionario
ADD CONSTRAINT UNIQUE (email);

## Exercício 14
ALTER TABLE filme
MODIFY COLUMN descricao TEXT NULL;

## Exercício 15
ALTER TABLE ator
DROP COLUMN data_nascimento;

## Exercício 16
ALTER TABLE funcionario
ADD COLUMN data_cantratacao DATE;

## Exercício 17
ALTER TABLE pagamento
MODIFY COLUMN valor DECIMAL(5, 2);

## Exercício 18
ALTER TABLE funcionario
ADD COLUMN loja_id INT REFERENCES loja (loja_id);

## Exercício 19
ALTER TABLE cliente
CHANGE sobrenome ultimo_nome VARCHAR(45);

## Exercício 20
ALTER TABLE avaliacao
ADD CONSTRAINT CHECK (nota >= 1 AND NOTA <= 5);

## Exercício 21
ALTER TABLE filme
RENAME TO pelicula;

## Exercício 22
ALTER TABLE ator
RENAME TO artista;

## Exercício 23
ALTER TABLE cliente
RENAME TO consumidor;

## Exercício 24
ALTER TABLE aluguel
RENAME TO locacao;

## Exercício 25
ALTER TABLE filme
CHANGE titulo nome_filme VARCHAR(255);

## Exercício 26
ALTER TABLE loja
CHANGE nome nome_loja VARCHAR(100);

## Exercício 27
ALTER TABLE inventario
RENAME TO estoque;

## Exercício 28
ALTER TABLE categoria_filme
CHANGE nome nome_categoria VARCHAR(50);

## Exercício 29
ALTER TABLE pagamento
RENAME TO transacao;

## Exercício 30
ALTER TABLE avaliacao
CHANGE comentario feedback TEXT;

## Exercício 31
DROP TABLE promocao;

## Exercício 32
DROP TABLE filme_genero;

## Exercício 33


## Exercício 34
ALTER TABLE consumidor
DROP COLUMN telefone;

## Exercício 35
SHOW INDEX FROM funcionario;

ALTER TABLE funcionario
DROP INDEX email;

## Exercício 36
SHOW CREATE TABLE funcionario;

ALTER TABLE funcionario
DROP FOREIGN KEY fk_funcionario_loja;

ALTER TABLE funcionario
DROP COLUMN loja_id;

## Exercício 37


## Exercício 38
DROP TABLE categoria_filme;

## Exercício 39
DROP TABLE pagamento;
DROP TABLE transacao;

## Exercício 40
DROP TABLE avaliacao;