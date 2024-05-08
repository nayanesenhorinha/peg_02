CREATE TABLE IF NOT EXISTS escola.curso(
	idCurso SERIAL,
	nomeCurso VARCHAR(50),
	descricao TEXT,
	duracao INT
)

CREATE TABLE IF NOT EXISTS escola.turma(
	idTurma SERIAL,
	codigoTurma VARCHAR(25),
	turno VARCHAR(25),
	polo VARCHAR(25),
	dataInicio DATE,
	dataTermino DATE
)

CREATE TABLE IF NOT EXISTS escola.modulo(
	idModulo SERIAL,	
	nomeModulo VARCHAR(50),
	descricao TEXT,
	horas INT,
	idFacilitador INT,
	idCurso INT,
	PRIMARY KEY(idModulo),
	FOREIGN KEY(idFacilitador) REFERENCES escola.facilitador(idFacilitador),
	FOREIGN KEY(idCurso) REFERENCES escola.curso(idCurso)
)

CREATE TABLE IF NOT EXISTS escola.estudantes(
	idEstudante SERIAL,
	nomeCompleto VARCHAR(100),
	dataNascimento DATE,
	genero CHAR('M','F'),
	email VARCHAR(50),
	ativo BOOLEAN,
	idCurso INT,
	idTurma INT,
	idEndereco INT,
	PRIMARY KEY(idEstudante),
	FOREIGN KEY(idCurso) REFERENCES escola.curso(idCurso),
	FOREIGN KEY(idTurma) REFERENCES escola.curso(idTurma),
	FOREIGN KEY(idEndereco) REFERENCES escola.curso(idTurma),
)

