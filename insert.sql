-- Inserir dados na tabela Curso
INSERT INTO escola.Curso (NomeCurso, Descricao, Duracao)
VALUES 
    ('Curso de Matemática', 'Curso introdutório de matemática', 6),
    ('Curso de Inglês', 'Curso básico de inglês', 4);

-- Inserir dados na tabela Turma
INSERT INTO escola.Turma (CodigoTurma, Turno, Polo, DataInicio, DataTermino, ID_Curso)
VALUES
    ('MAT-01', 'Manhã', 'Polo A', '2024-06-01', '2024-12-01', 1),
    ('ING-01', 'Tarde', 'Polo B', '2024-07-01', '2024-10-01', 2);

-- Inserir dados na tabela Módulo
INSERT INTO escola.Modulo (Nome, Descricao, Horas, ID_Facilitador, ID_Curso)
VALUES
    ('Matemática Básica', 'Módulo introdutório de matemática', 20, 1, 1),
    ('Álgebra Linear', 'Módulo sobre álgebra linear', 30, 1, 1),
    ('Geometria', 'Módulo de geometria básica', 25, 1, 1),
    ('Inglês para Iniciantes', 'Módulo introdutório de inglês', 15, 2, 2),
    ('Gramática', 'Módulo sobre gramática inglesa', 20, 2, 2),
    ('Conversação', 'Módulo para prática de conversação em inglês', 25, 2, 2);
