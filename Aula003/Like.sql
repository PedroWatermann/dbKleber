## Retorna apenas os registros onde a cidade seja Maracabo
SELECT cidade
FROM cidade 
WHERE cidade LIKE 'Maracabo';

## Retorna todos os registros onde há ch no meio do primeiro nome, seja qual for o início ou o fim do nome
SELECT primeiro_nome, ultimo_nome
FROM cliente
WHERE primeiro_nome LIKE '%ch%';

## Retorna todos os registros onde o primeiro nome inicia com Mar, seja qual for o resto do nome
SELECT primeiro_nome, ultimo_nome
FROM cliente
WHERE primeiro_nome LIKE 'Mar%';

## Retorna todos os registros onde o último nome termina com th, seja qual for o inicio do nome
SELECT primeiro_nome, ultimo_nome
FROM cliente
WHERE ultimo_nome LIKE '%th';

## Retorna a palavra que preenche o caractere faltante (a palavra deve ter o exato número de caracteres)
SELECT cidade
FROM cidade
WHERE cidade LIKE 'Ad_ni';

## Exemplo com a junção dos dois
SELECT bairro
FROM endereco
WHERE bairro LIKE '_ex%';