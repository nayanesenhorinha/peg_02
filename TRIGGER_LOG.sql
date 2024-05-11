CREATE TABLE IF NOT EXISTS log_estudante_status (
    id SERIAL PRIMARY KEY,
    estudante_id INT NOT NULL,
    status_anterior SMALLINT NOT NULL,
    status_novo SMALLINT NOT NULL,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (estudante_id) REFERENCES Estudantes(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE OR REPLACE FUNCTION public.estudante_status_trigger_function()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
BEGIN

        INSERT INTO Log_Estudante_Status (estudante_id, status_anterior, status_novo, data_atualizacao)
        VALUES (OLD.id, OLD.status, NEW.status, NOW());

    RETURN NEW; -- Retorna NEW para permitir a modificação dos dados na tabela de Estudantes
END;
$BODY$;

ALTER FUNCTION public.estudante_status_trigger_function()
    OWNER TO postgres;
