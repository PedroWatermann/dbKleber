#	#	#	#	#	#	#	#	#	#
# O comando IN retorna com o mesmo  #
# resultado do operador OU			#
#	#	#	#	#	#	#	#	#	#

SELECT titulo, classificacao
FROM filme 
WHERE classificacao = 'P' 
OR classificacao = 'R' 
OR classificacao = 'G';
## Retornou 2 colunas e 373 registros

SELECT titulo, classificacao
FROM filme 
WHERE classificacao 
IN ('P', 'R', 'G');
## Retornou 2 colunas e 373 registros

SELECT titulo, classificacao
FROM filme 
WHERE classificacao 
NOT IN ('P', 'R', 'G');
## Retornou 2 colunas e 627 registros