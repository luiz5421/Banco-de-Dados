DROP SCHEMA IF EXISTS prjRestaurante;
CREATE SCHEMA prjRestaurante;
USE prjRestaurante;



CREATE TABLE fornecedor
(
  cd_fornecedor INT,
  nm_fornecedor VARCHAR(50),

  CONSTRAINT pk_fornecedor PRIMARY KEY (cd_fornecedor)
);

CREATE TABLE ingrediente
(
  sg_ingrediente VARCHAR(5),
  nm_ingrediente VARCHAR(45),

  CONSTRAINT pk_ingrediente PRIMARY KEY (sg_ingrediente)
);

CREATE TABLE compra
(
  sg_ingrediente VARCHAR(5),
  cd_fornecedor INT,
  cd_nota_fiscal INT,
  dt_compra DATE,
  qt_ingrediente_comprado VARCHAR(20),
  vl_compra DECIMAL(9,2),

  CONSTRAINT pk_compra PRIMARY KEY (sg_ingrediente,cd_fornecedor),
  CONSTRAINT fk_compra_fornecedor FOREIGN KEY (cd_fornecedor) REFERENCES fornecedor (cd_fornecedor),
  CONSTRAINT fk_compra_ingrediente FOREIGN KEY (sg_ingrediente) REFERENCES ingrediente (sg_ingrediente)
);

CREATE TABLE prato
(
  sg_prato VARCHAR(5),
  nm_prato VARCHAR(45),
  vl_unitario DECIMAL(9,2),

  CONSTRAINT pk_prato PRIMARY KEY (sg_prato)
);

CREATE TABLE prato_ingrediente
(
  sg_prato VARCHAR(5),
  sg_ingrediente VARCHAR(5),
  qt_ingrediente VARCHAR(20),

  CONSTRAINT pk_prato_ingrediente PRIMARY KEY (sg_ingrediente,sg_prato),
  CONSTRAINT fk_prato_ingrediente_prato FOREIGN KEY (sg_prato) REFERENCES prato (sg_prato),
  CONSTRAINT fk_prato_ingrediente_ingrediente FOREIGN KEY (sg_ingrediente) REFERENCES ingrediente (sg_ingrediente)
);

CREATE TABLE quantidade
(
  cd_pedido INT,
  sg_prato VARCHAR(5),
  qt_prato INT,

  CONSTRAINT pk_quantidade PRIMARY KEY (cd_pedido,sg_prato),
  CONSTRAINT fk_quantidade_pedido FOREIGN KEY (cd_pedido) REFERENCES pedido (cd_pedido),
  CONSTRAINT fk_quantidade_prato FOREIGN KEY (sg_prato) REFERENCES prato (sg_prato)
);

CREATE TABLE pedido
(
  cd_pedido INT,
  nm_cliente VARCHAR(60),
  nm_endereço VARCHAR(60),
  cd_telefone INT,

  CONSTRAINT pk_pedido PRIMARY KEY (cd_pedido)
);

insert into fornecedor values (1,'Fernando Filho');
insert into fornecedor values (2,'Gustavo Barros');
insert into fornecedor values (3,'Daniel Almeida');

insert into ingrediente values('AR','Arroz');
insert into ingrediente values('FJ','Feijão');
insert into ingrediente values('LC','Leite Condensado');
insert into ingrediente values('AZ','Azeite');

insert into compra values('AR',1,121320,'2021-06-15','5kg','34.50');
insert into compra values('FJ',2,343728,'2021-06-15','6kg','20.50');
insert into compra values('LC',3,298721,'2021-06-16','2kg','25.90');
insert into compra values('AZ',3,092381,'2021-06-17','2kg','75.90');

insert into prato values('ARFJ','Arroz e Feijão','10.90');
insert into prato values('ARDC','Arroz Doce','5.50');
insert into prato values('FJDC','Feijão Doce','7.80');

insert into prato_ingrediente values('ARFJ','AR','100g');
insert into prato_ingrediente values('ARFJ','FJ','100g');
insert into prato_ingrediente values('ARDC','AR','500g');
insert into prato_ingrediente values('ARDC','LC','200g');
insert into prato_ingrediente values('FJDC','FJ','500g');
insert into prato_ingrediente values('FJDC','LC','200g');

insert into pedido values(1,'Daniel Souza','Rua Jurubatuba',997422593);
insert into pedido values(2,'Pamela Almeida','Rua Afonso Pena',998568240);
insert into pedido values(3,'Miguel Silva','Rua Pedro Lessa',994363845);

insert into quantidade values(1,'ARFJ',10);
insert into quantidade values(1,'ARDC',5);

insert into quantidade values(2,'ARFJ',3);
insert into quantidade values(2,'ARDC',2);

insert into quantidade values(3,'ARFJ',2);
insert into quantidade values(3,'ARDC',6);
insert into quantidade values(3,'FJDC',3);

Select p.sg_prato,p.nm_prato,p.vl_unitario,pi.sg_ingrediente,pi.qt_ingrediente  from prato p  join prato_ingrediente pi on (p.sg_prato=pi.sg_prato) 


