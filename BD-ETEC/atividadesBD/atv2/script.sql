DROP SCHEMA IF EXISTS prjEmpresa;

CREATE SCHEMA prjEmpresa;

USE prjEmpresa;




CREATE TABLE fornecedor

(
  cd_fornecedor INT,
  nm_fornecedor VARCHAR(50),
  nm_endereço VARCHAR(45),
  cd_fax VARCHAR(45),
  CONSTRAINT pk_fornecedor PRIMARY KEY (cd_fornecedor)

);

CREATE TABLE mercadoria
(
  cd_mercadoria INT,
  cd_fornecedor INT,
  nm_mercadoria VARCHAR(45),
  sg_unidade_medida VARCHAR(45),
  vl_unitario DECIMAL(9,2),

  CONSTRAINT pk_mercadoria PRIMARY KEY (cd_mercadoria,cd_fornecedor),
  CONSTRAINT fk_mercadoria_fornecedor FOREIGN KEY (cd_fornecedor) REFERENCES fornecedor (cd_fornecedor)
);

CREATE TABLE tipo_transporte
(
  cd_tipo_transporte INT,
  nm_tipo_transporte VARCHAR(45),

  CONSTRAINT pk_tipo_transporte PRIMARY KEY (cd_tipo_transporte)
);

CREATE TABLE transporte
(
  cd_transporte INT,
  cd_tipo_transporte INT,
  dt_saida DATE,
  dt_chegada DATE,

  CONSTRAINT pk_transporte PRIMARY KEY (cd_transporte),
  CONSTRAINT fk_transporte_tipo_transporte FOREIGN KEY (cd_tipo_transporte) REFERENCES tipo_transporte (cd_tipo_transporte)
);

CREATE TABLE contrato
(
cd_contrato INT,
cd_mercadoria INT,
cd_fornecedor INT,
cd_transporte INT,
dt_assinatura DATE,
dt_validade DATE,
nm_moeda VARCHAR(45),
vl_contrato DECIMAL(9,2),
qt_mercadoria INT,

CONSTRAINT pk_contrato PRIMARY KEY (cd_contrato,cd_mercadoria,cd_fornecedor,cd_transporte),

CONSTRAINT fk_contrato_mercadoria FOREIGN KEY (cd_mercadoria,cd_fornecedor) REFERENCES mercadoria (cd_mercadoria,cd_fornecedor),
CONSTRAINT fk_contrato_transporte FOREIGN KEY (cd_transporte) REFERENCES transporte (cd_transporte)
);

insert into fornecedor values (1,'Fernando Filho','Rua Jurubatubra','98976-2924');
insert into fornecedor values (2,'Miguel Alencar','Avenida Afonso Pena','97835-6394');
insert into fornecedor values (3,'Luiz Gustavo','Rua ALmirante Fernandes','99463-7835');

insert into tipo_transporte values(1,'van');
insert into tipo_transporte values(2,'avião');
insert into tipo_transporte values(3,'caminhão');

insert into transporte values (1,1,'2021-06-15','2021-06-17');
insert into transporte values (2,2,'2021-05-15','2021-06-10');
insert into transporte values (3,3,'2021-06-19','2021-06-27');

insert into mercadoria values (1,1,'chapa de ferro','m','30.90');
insert into mercadoria values (2,1,'chapa de aluminio','m','35.90');
insert into mercadoria values (3,2,'barras de ferro','m','20.90');

insert into contrato values(1,1,1,1,'2021-05-20','2022-06-1','real','350.00',100);
insert into contrato values(2,2,1,2,'2021-07-20','2022-08-1','dolar','150.00',10);
insert into contrato values(3,3,2,2,'2021-03-28','2022-09-1','real','240.00',50);


select nm_fornecedor,nm_endereço,cd_fax from fornecedor;

select nm_mercadoria,sg_unidade_medida,vl_unitario from mercadoria;
select nm_tipo_transporte from tipo_transporte;
insert into contrato values(4,3,2,1,'2021-09-20','2022-06-1','real','300.00',20);
