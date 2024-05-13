CREATE OR REPLACE PROCEDURE editar_estudante(
    IN id_estudante INT,
    IN novo_nome VARCHAR(100),
    IN novo_sobrenome VARCHAR(100),
    IN novo_email VARCHAR(100),
    IN novo_telefone VARCHAR(20),
    IN nova_data_nasc DATE,
    IN novo_genero VARCHAR(10),
    IN nova_rua VARCHAR(100),
    IN novo_cep VARCHAR(20),
    IN nova_cidade VARCHAR(100),
    IN novo_bairro VARCHAR(100),
    IN novo_pais VARCHAR(100),
	in novo_status INT
)
LANGUAGE plpgsql
AS $$
DECLARE 
    novo_endereco_id INT;
BEGIN

    -- Obter o ID do endereço do estudante
    SELECT Endereco_id INTO novo_endereco_id
    FROM Pessoa
    WHERE id = id_estudante;

    -- Atualizar informações de endereço
    UPDATE Endereco
    SET rua = nova_rua,
        cep = novo_cep,
        cidade = nova_cidade,
        bairro = novo_bairro,
        pais = novo_pais
    WHERE id = novo_endereco_id;

    -- Atualizar informações da pessoa
    UPDATE Pessoa
    SET nome = novo_nome,
        sobrenome = novo_sobrenome,
        email = novo_email,
        telefone = novo_telefone,
        data_nasc = nova_data_nasc,
        genero = novo_genero
    WHERE id = id_estudante;
	
	UPDATE Estudantes
	SET status = novo_status
	WHERE id = id_estudante;
END;
$$;

-- CALL editar_estudante(31, 'Novo Nome', 'Novo Sobrenome', 'novoemail@example.com', '987654321', '1999-12-31', 'Feminino', 'Nova Rua', '98765-432', 'Nova Cidade', 'Novo Bairro', 'Novo País',0);
