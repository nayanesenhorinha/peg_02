CREATE OR REPLACE PROCEDURE adicionar_estudante(
    nome VARCHAR(100),
    sobrenome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20),
    data_nasc DATE,
    genero VARCHAR(10),
    rua VARCHAR(100),
    cep VARCHAR(20),
    cidade VARCHAR(100),
    bairro VARCHAR(100),
    pais VARCHAR(100),
	numero_matricula INT
)
LANGUAGE plpgsql
AS $$
DECLARE 
    endereco_id INT;
    pessoa_id INT;
BEGIN
    -- Adicionar endereço
    INSERT INTO Endereco (rua, cep, cidade, bairro, pais)
    VALUES (rua, cep, cidade, bairro, pais)
    RETURNING id INTO endereco_id;

    -- Adicionar pessoa
    INSERT INTO Pessoa (Endereco_id, nome, sobrenome, email, telefone, data_nasc, genero)
    VALUES (endereco_id, nome, sobrenome, email, telefone, data_nasc, genero)
    RETURNING id INTO pessoa_id;

    -- Adicionar estudante
    INSERT INTO Estudantes (Pessoa_id, data_matricula, status,numero_matricula)
    VALUES (pessoa_id, CURRENT_DATE, 1,numero_matricula); -- 1 para status ativo
END;
$$;

-- CALL adicionar_estudante('João', 'Silva', 'joao@example.com', '123456789', '2000-01-01', 'Masculino', 'Rua A', '12345-678', 'Cidade', 'Bairro', 'País', 1234);
