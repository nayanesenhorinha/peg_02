CREATE TABLE IF NOT EXISTS log_estudante_status (
    id SERIAL PRIMARY KEY,
    estudante_id INT NOT NULL,
    status_anterior SMALLINT NOT NULL,
    status_novo SMALLINT NOT NULL,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (estudante_id) REFERENCES Estudantes(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE OR REPLACE FUNCTION public.estudante_status_trigger_function()
    RETURNS TRIGGER
    LANGUAGE plpgsql
AS $BODY$
BEGIN
    IF OLD.status <> NEW.status THEN
        INSERT INTO log_estudante_status (estudante_id, status_anterior, status_novo, data_atualizacao)
        VALUES (OLD.id, OLD.status, NEW.status, NOW());
    END IF;
    RETURN NEW; -- Retorna NEW para permitir a modificação dos dados na tabela de Estudantes
END;
$BODY$;

-- Associação do gatilho à tabela
CREATE TRIGGER estudante_status_trigger
AFTER UPDATE ON Estudantes
FOR EACH ROW
EXECUTE FUNCTION estudante_status_trigger_function();

-- Desativação e reativação do gatilho
ALTER TABLE Estudantes
DISABLE TRIGGER estudante_status_trigger;

ALTER TABLE Estudantes
ENABLE TRIGGER estudante_status_trigger;
