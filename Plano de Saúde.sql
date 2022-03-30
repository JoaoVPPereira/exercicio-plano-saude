CREATE TABLE cliente (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    nome VARCHAR(100) NOT NULL,
    data_nasc DATE,
    email VARCHAR(100),
    CONSTRAINT cliente_pk PRIMARY KEY (id)
)

CREATE TABLE dependente (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    cliente_id INT,
    CONSTRAINT dependente_pk PRIMARY KEY (id),
    CONSTRAINT cliente_fk FOREIGN KEY (cliente_id) references cliente(id)
)

CREATE TABLE produto (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    reg_ans VARCHAR(50) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    valor MONEY,
    CONSTRAINT produto_pk PRIMARY KEY (id)
)

CREATE TABLE contrato (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    cliente_id INT,
    dependente_id INT,
    data_inicio DATE,
    produto_id INT,
    CONSTRAINT contrato_pk PRIMARY KEY (id),
    CONSTRAINT cliente_fk FOREIGN KEY (cliente_id) references cliente(id),
    CONSTRAINT produto_fk FOREIGN KEY (produto_id) references produto(id),
    CONSTRAINT dependente_fk FOREIGN KEY (dependente_id) references dependente(id)
)