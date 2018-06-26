DROP TABLE tb_motorista;
CREATE TABLE tb_motorista (
    id_motorista BIGINT NOT NULL PRIMARY KEY
                 GENERATED ALWAYS AS IDENTITY
                 (START WITH 1, INCREMENT BY 1),
    nm_motorista VARCHAR(30) NOT NULL,
    nr_cpf VARCHAR(20) NOT NULL,
    id_status VARCHAR(4) NOT NULL,
    tp_sexo VARCHAR(10) NOT NULL,
    mdl_carro VARCHAR(30) NOT NULL,
    email_motorista VARCHAR(100) NOT NULL,
);

DROP TABLE tb_passageiro;
CREATE TABLE tb_passageiro (
    id_passageiro BIGINT NOT NULL PRIMARY KEY
                 GENERATED ALWAYS AS IDENTITY
                 (START WITH 1, INCREMENT BY 1),
    nm_passageiro VARCHAR(30) NOT NULL,
    nr_cpf VARCHAR(20) NOT NULL,
    tp_sexo VARCHAR(10) NOT NULL,
    email_passageiro VARCHAR(100) NOT NULL,
);

DROP TABLE tb_corrida;
CREATE TABLE tb_corrida (
    id_corrida BIGINT NOT NULL PRIMARY KEY
                 GENERATED ALWAYS AS IDENTITY
                 (START WITH 1, INCREMENT BY 1),
    qtd_km DOUBLE PRECISION NOT NULL,
    vl_corrida DOUBLE PRECISION NOT NULL,
    tb_mot BIGINT NOT NULL,
    tb_pass BIGINT NOT NULL,
    CONSTRAINT FK_ID_MOTORISTA FOREIGN KEY (tb_mot)
    REFERENCES tb_motorista(id_motorista),
    CONSTRAINT FK_ID_PASSAGEIRO FOREIGN KEY (tb_pass)
    REFERENCES tb_passageiro(id_passageiro)
);

DROP TABLE users;
CREATE TABLE users (
    id BIGINT NOT NULL PRIMARY KEY
       GENERATED ALWAYS AS IDENTITY
       (START WITH 1, INCREMENT BY 1)
    , role VARCHAR(200) NOT NULL
    , name VARCHAR(200) NOT NULL
    , login VARCHAR(200) NOT NULL
    , passwordHash BIGINT NOT NULL
);

INSERT INTO users VALUES
(default, 'ADMIN', 'Administrador', 'admin', 1509442);