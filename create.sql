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

CREATE TABLE IF NOT EXISTS escola.Curso (
    ID_Curso SERIAL PRIMARY KEY,
    NomeCurso VARCHAR(100),
    Descricao TEXT,
    Duracao INT
);

CREATE TABLE IF NOT EXISTS escola.Estudantes (
    ID_Estudante SERIAL PRIMARY KEY,
    NomeCompleto VARCHAR(100),
    DataNascimento DATE,
    Genero CHAR('F','M','X'),
    Email VARCHAR(100),
    Telefone INT,
    Ativo BOOLEAN,
    ID_Curso INT,
    FOREIGN KEY(ID_Curso) REFERENCES escola.Curso(ID_Curso),
    ID_Turma INT,
    FOREIGN KEY(ID_Turma) REFERENCES escola.Turma(ID_Turma),
    ID_Endereco INT,
    FOREIGN KEY(ID_Endereco) REFERENCES escola.Endereco(ID_Endereco)
);

CREATE TABLE IF NOT EXISTS escola.Modulo (
    ID_Modulo SERIAL PRIMARY KEY,
    Nome VARCHAR(100),
    Descricao TEXT,
    Horas INT,
    ID_Facilitador INT,
    FOREIGN KEY(ID_Facilitador) REFERENCES escola.Facilitador(ID_Facilitador),
    ID_Curso INT,
    FOREIGN KEY(ID_Curso) REFERENCES escola.Turma(ID_Curso)
);

CREATE TABLE IF NOT EXISTS escola.Turma (
    ID_Turma SERIAL PRIMARY KEY,
    CodigoTurma VARCHAR(50),
    Turno VARCHAR(20),
    Polo VARCHAR(100),
    DataInicio DATE,
    DataTermino DATE,
    ID_Curso INT,
    FOREIGN KEY(ID_Curso) REFERENCES escola.Curso(ID_Curso),
);

CREATE TABLE IF NOT EXISTS escola.Facilitador (
    ID_Facilitador SERIAL PRIMARY KEY,
    NomeCompleto VARCHAR(100),
    Especializacao VARCHAR(100),
    Email VARCHAR(100),
    Telefone INT,
    DataContratacao DATE,
    Ativo BOOLEAN,
    ID_Endereco INT,
    FOREIGN KEY(ID_Endereco REFERENCES escola.Endereco(ID_Endereco)
);
