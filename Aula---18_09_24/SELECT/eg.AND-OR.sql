SELECT filme_id, titulo, descricao, ano_de_lancamento, duracao_da_locacao
FROM filme 
WHERE ano_de_lancamento = 2006 AND duracao_da_locacao = 6;
## Retornou 5 colunas e 998 registros

SELECT filme_id, titulo, descricao, ano_de_lancamento, duracao_da_locacao
FROM filme 
WHERE ano_de_lancamento > 2006;
## Retornou 5 colunas e nenhum registro

SELECT filme_id, titulo, descricao, ano_de_lancamento, duracao_da_locacao
FROM filme 
WHERE ano_de_lancamento = 2006 OR duracao_da_locacao = 6;
## Retornou 5 colunas e 1000 registros