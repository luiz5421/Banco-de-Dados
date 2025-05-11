DROP SCHEMA IF EXISTS prjEstoque;

CREATE SCHEMA prjEstoque;

USE prjEstoque;

CREATE TABLE tipo_produto (
    cd_tipo_produto INT PRIMARY KEY,
    nm_tipo_produto VARCHAR(45)
);

CREATE TABLE produto (
    cd_produto INT PRIMARY KEY,
    nm_produto VARCHAR(50),
    ds_produto VARCHAR(80),
    cd_tipo_produto INT,
    FOREIGN KEY (cd_tipo_produto) REFERENCES tipo_produto(cd_tipo_produto)
);

CREATE TABLE estoque (
    cd_estoque INT PRIMARY KEY,
    cd_produto INT,
    qt_produtos INT,
    vl_unitario_produto DECIMAL(9,2),
    FOREIGN KEY (cd_produto) REFERENCES produto(cd_produto)
);