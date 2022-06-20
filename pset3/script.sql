WITH recursive classificação_p
AS ( SELECT codigo, nome, codigo_pai, cast(nome as text) AS hierarquia
FROM classificacao
WHERE codigo_pai is null

UNION ALL

SELECT c.codigo, cla.nome, c.codigo_pai, cast(fn.hierarquia || '-->' || c.nome AS text) AS hierarquia
FROM classificacao_p
INNER JOIN classificacao_p cla on c.codigo_pai = cla.codigo

SELECT hierarquia, codigo_pai
FROM classificacao_p
ORDER BY hierarquia;
