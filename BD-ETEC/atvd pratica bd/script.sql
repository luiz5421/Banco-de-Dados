DROP SCHEMA IF EXISTS AvaliacaoBD2;
CREATE SCHEMA AvaliacaoBD2;
USE AvaliacaoBD2;

CREATE TABLE vendedor 
(
  cd_vendedor INT,
  nm_vendedor VARCHAR(45),
  vl_salario DECIMAL(9,2),
  pc_comissao INT,
  CONSTRAINT pk_vendedor PRIMARY KEY (cd_vendedor)
);


CREATE TABLE cliente 
(
  cd_cliente INT,
  nm_cliente VARCHAR(45),
  nm_endereco VARCHAR(200),
  nm_cidade VARCHAR(45),
  cd_cep VARCHAR(10),
  sg_estado VARCHAR(2),
  CONSTRAINT pk_cliente PRIMARY KEY (cd_cliente)
);

CREATE TABLE produto 
(
  cd_produto INT,
  ds_produto VARCHAR(200),
  sg_unidade_medida VARCHAR(2),
  vl_unitario DECIMAL(9,2),
  CONSTRAINT pk_produto PRIMARY KEY (cd_produto)
);

CREATE TABLE pedido
(
  cd_pedido INT,
  qt_prazo_entrega INT,
  cd_vendedor INT,
  cd_cliente INT,
  CONSTRAINT pk_pedido PRIMARY KEY (cd_pedido),
  CONSTRAINT fk_pedido_vendedor FOREIGN KEY (cd_vendedor) REFERENCES vendedor (cd_vendedor),
  CONSTRAINT fk_pedido_cliente1 FOREIGN KEY (cd_cliente) REFERENCES cliente (cd_cliente)
);

CREATE TABLE item_pedido 
(
  cd_pedido INT,
  cd_produto INT,
  qt_produto_pedido INT,
  CONSTRAINT pk_item_pedido PRIMARY KEY (cd_pedido, cd_produto),
  CONSTRAINT fk_pedido_produto_pedido1 FOREIGN KEY (cd_pedido) REFERENCES pedido (cd_pedido),
  CONSTRAINT fk_pedido_produto_produto1 FOREIGN KEY (cd_produto) REFERENCES produto (cd_produto)
);

Insert into produto values (1,'Chapa de Aço','kg',2.50);
Insert into produto values (2,'Cimento','kg',4.50);
Insert into produto values (3,'Parafuso 3.0x10.5mm','kg',2.00);
Insert into produto values (4,'Fio plástico','m',0.20);
Insert into produto values (5,'Solvente PRW','L',5.00);

Insert into cliente values (1,'Supermercado Carrefour','Avenida São João Batista 271','São João do Manhuaçu','36918-970','MG');
Insert into cliente values (2,'Supermecado Baratão','Rua Cinquenta e Quatro 862','Aracaju','49044-495','SE');
Insert into cliente values (3,'Supermecado Arariboia','Rua Percílio 943','Rio de Janeiro','23540-170','RJ');
Insert into cliente values (4,'UFF','Praça Marechal Floriano Peixoto, 1002','Itaboraí','24800-971','RJ');
Insert into cliente values (5,'CSN','Rua Hélio Walcacer 654','Rio de Janeiro','21840-520','RJ');
Insert into cliente values (6,'Pegout','Rua Santa Marta 372','Santos','11082-230','SP');
Insert into cliente values (7,'Ind. Quimicas Paulistas','Avenida Michajlo Halajko 194','Cubatão','11535-065','SP');
Insert into cliente values (8,'Ford Caminhoes','Rua 1º de Maio 751','Santos','11035-181','SP');
Insert into cliente values (9,'Riocel Celulose','Avenida São Francisco 689','Santos','11013-202','SP');
Insert into cliente values (10,'Elevadores Sur','Rua da Constituição 782','Santos','11015-470','SP');

Insert into vendedor values (11, 'Paulo Alberto', 1200, 10);
Insert into vendedor values (12, 'Brenda Barbosa', 1500, 15);
Insert into vendedor values (13, 'Cassia Andrade', 2000, 20);
Insert into vendedor values (14, 'Maria Paula', 1250, 15);

Insert into pedido values (1111,5,11,2);
Insert into pedido values (2111,10,14,9);
Insert into pedido values (2113,15,14,8);
Insert into pedido values (5111,2,13,5);
Insert into pedido values (7111,1,12,1);

Insert into item_pedido values (1111,5,150);
Insert into item_pedido values (1111,2,150);
Insert into item_pedido values (2111,1,500);
Insert into item_pedido values (2113,5,500);
Insert into item_pedido values (5111,3,500);
Insert into item_pedido values (7111,1,500);