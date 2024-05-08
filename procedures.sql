-- Procedure para cadastrar alunos
CREATE OR REPLACE PROCEDURE escola.cadastrar_aluno(
    _NomeCompleto VARCHAR(100),
    _DataNascimento DATE,
    _Genero VARCHAR(10),
    _Email VARCHAR(100),
    _Telefone INT,
    _idCurso INT,
    _idTurma INT,
    _Ativo BOOLEAN,
    _Rua VARCHAR(100),
    _Numero INT,
    _Bairro VARCHAR(50),
    _Cidade VARCHAR(50),
    _Estado VARCHAR(2),
    _Logradouro VARCHAR(100),
    _Complemento VARCHAR(100)
)
AS $$
DECLARE
    endereco_id INT;
BEGIN
    INSERT INTO escola.Endereco (Rua, Numero, Bairro, Cidade, Estado, Logradouro, Complemento)
    VALUES (_Rua, _Numero, _Bairro, _Cidade, _Estado, _Logradouro, _Complemento)
    RETURNING ID_Endereco INTO endereco_id;

    INSERT INTO escola.Estudantes (NomeCompleto, DataNascimento, Genero, Email, Telefone, ID_Curso, ID_Turma, Ativo, ID_Endereco)
    VALUES (_NomeCompleto, _DataNascimento, _Genero, _Email, _Telefone, _idCurso, _idTurma, _Ativo, endereco_id);
END;
$$ LANGUAGE plpgsql;

-- Procedure para cadastrar facilitadores
CREATE OR REPLACE PROCEDURE escola.cadastrar_facilitador(
    _NomeCompleto VARCHAR(100),
    _Especializacao VARCHAR(100),
    _Email VARCHAR(100),
    _Telefone INT,
    _DataContratacao DATE,
    _Ativo BOOLEAN,
    _Rua VARCHAR(100),
    _Numero INT,
    _Bairro VARCHAR(50),
    _Cidade VARCHAR(50),
    _Estado VARCHAR(2),
    _Logradouro VARCHAR(100),
    _Complemento VARCHAR(100)
)
AS $$
DECLARE
    endereco_id INT;
BEGIN
    INSERT INTO escola.Endereco (Rua, Numero, Bairro, Cidade, Estado, Logradouro, Complemento)
    VALUES (_Rua, _Numero, _Bairro, _Cidade, _Estado, _Logradouro, _Complemento)
    RETURNING ID_Endereco INTO endereco_id
    
    INSERT INTO escola.Facilitador (NomeCompleto, Especializacao, Email, Telefone, DataContratacao, Ativo, ID_Endereco)
    VALUES (_NomeCompleto, _Especializacao, _Email, _Telefone, _DataContratacao, _Ativo, endereco_id);
END;
$$ LANGUAGE plpgsql;
