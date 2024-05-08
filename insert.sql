INSERT INTO escola.endereco(rua, numero, bairro, cidade, estado, cep) VALUES 
('Rua A',12,'Goiaba','Rio de Janeiro','RJ','25636400'),
('Rua B',17,'Limoeiro','Rio de Janeiro','RJ','25636583'),
('Rua C',23,'Carmelia','Rio de Janeiro','RJ','25636253');

INSERT INTO escola.Curso(NomeCurso, Descricao, Duracao) VALUES
('Matemática','Curso básico de matemática',10),
('Portugues','Curso básico de postuguês',20),
('Filosofia','Curso básico de filosofia',8);

INSERT INTO escola.Pessoa(NomeCompleto, DataNascimento, Genero, Email, Telefone, ID_Endereco) VALUES
('Maria Antônia','12-05-2002','F','maria@antonia.com',2196352-8432,1),
('João Victor','10-04-1995','M','joao@victor.com',2192685-1234,2),
('Paulo Henrique','22-12-2000','M','paulo@victor.com',2192375-7415,3);

INSERT INTO escola.Estudante(NumeroMatricula, DataMatricula, ID_Pessoa) VALUES 
(123,'07-05-2024',1),
(456,'06-05-2024',2),
(789,'05-05-2024',3);
