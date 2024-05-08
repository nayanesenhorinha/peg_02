CREATE TABLE IF NOT EXISTS escola.Estudantes (
    ID_Estudante SERIAL PRIMARY KEY,
    NomeCompleto VARCHAR(100),
    DataNascimento DATE,
    Genero CHAR('F','M','X'),
    Email VARCHAR(100),
    Telefone INT,
    ID_Curso INT,
    ID_Turma INT,
    Ativo BOOLEAN,
    ID_Endereco INT
);

CREATE TABLE IF NOT EXISTS escola.Endereco (
    ID_Endereco SERIAL PRIMARY KEY,
    Rua VARCHAR(100),
    Numero INT,
    Bairro VARCHAR(50),
    Cidade VARCHAR(50),
    Estado VARCHAR(2),
    Logradouro VARCHAR(100),
    Complemento VARCHAR(100)
);

CREATE TABLE escola.Modulo (
    ID_Modulo SERIAL PRIMARY KEY,
    Nome VARCHAR(100),
    Descricao TEXT,
    Horas INT,
    ID_Facilitador INT,
    ID_Curso INT
);

CREATE TABLE escola.Curso (
    ID_Curso SERIAL PRIMARY KEY,
    NomeCurso VARCHAR(100),
    Descricao TEXT,
    Duracao INT
);

CREATE TABLE escola.Turma (
    ID_Turma SERIAL PRIMARY KEY,
    CodigoTurma VARCHAR(50),
    Turno VARCHAR(20),
    Polo VARCHAR(100),
    DataInicio DATE,
    DataTermino DATE,
    ID_Curso INT
);

CREATE TABLE escola.Facilitador (
    ID_Facilitador SERIAL PRIMARY KEY,
    NomeCompleto VARCHAR(100),
    Especializacao VARCHAR(100),
    Email VARCHAR(100),
    Telefone INT,
    DataContratacao DATE,
    Ativo BOOLEAN,
    ID_Endereco INT
);
