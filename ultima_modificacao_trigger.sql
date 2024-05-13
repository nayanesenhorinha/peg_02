ALTER TABLE Estudantes
ADD COLUMN ultima_modificacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

CREATE OR REPLACE FUNCTION atualiza_ultima_modificacao()
RETURNS TRIGGER AS $$
BEGIN
    NEW.ultima_modificacao = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER aluno_ultima_mod_trigger
BEFORE UPDATE ON Estudantes
FOR EACH ROW
EXECUTE FUNCTION atualiza_ultima_modificacao();
