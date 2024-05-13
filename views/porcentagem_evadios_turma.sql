CREATE VIEW Porcentagem_Evasao_Por_Turma AS
SELECT
    t.id AS turma_id,
    t.nome_turma,
    COUNT(CASE WHEN e.status = 0 THEN 1 ELSE NULL END) AS estudantes_evasao,
    COUNT(*) AS total_estudantes,
    ROUND((COUNT(CASE WHEN e.status = 0 THEN 1 ELSE NULL END)::NUMERIC / COUNT(*)) * 100, 2) AS percentual_evasao
FROM
    Turmas t
JOIN
    Matricula m ON t.id = m.Turmas_id
JOIN
    Estudantes e ON m.Estudantes_id = e.id
GROUP BY
    t.id, t.nome_turma;

SELECT * FROM Porcentagem_Evasao_Por_Turma;
