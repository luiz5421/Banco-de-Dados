DROP SCHEMA IF EXISTS atvVenda;

CREATE SCHEMA atvVenda;

USE atvVenda;

CREATE TABLE telefone 
(
  cd_telefone INT,
  nm_tipo_telefone VARCHAR(45),
  CONSTRAINT pk_telefone PRIMARY KEY (cd_telefone) 
);

CREATE TABLE cliente 
(
  nm_cpf_cliente VARCHAR(20),
  nm_cliente VARCHAR(45),
  nm_identidade VARCHAR(45),
  ds_endereço VARCHAR(150),

  CONSTRAINT pk_cliente PRIMARY KEY (nm_cpf_cliente) 
);

CREATE TABLE telefone_cliente 
(
  nm_cpf_cliente VARCHAR(20),
  cd_telefone INT,
  nm_telefone_cliente VARCHAR(20),  

  CONSTRAINT pk_telefone_cliente PRIMARY KEY (nm_cpf_cliente,cd_telefone),
  CONSTRAINT fk_telefone_cliente_cliente FOREIGN KEY (nm_cpf_cliente) REFERENCES cliente (nm_cpf_cliente),
  CONSTRAINT fk_telefone_cliente_telefone FOREIGN KEY (cd_telefone) REFERENCES telefone (cd_telefone)
);

CREATE TABLE vendedor 
(
  cd_matricula INT,
  nm_vendedor VARCHAR(45),
  nm_cpf_cliente VARCHAR(20),
  ds_endereço VARCHAR(150),
  vl_salario_base DECIMAL(9,2),
  CONSTRAINT pk_vendedor PRIMARY KEY (cd_matricula) 
);

CREATE TABLE telefone_vendedor 
(
  cd_matricula INT,
  cd_telefone INT,
  nm_telefone_vendedor VARCHAR(20),  

  CONSTRAINT pk_telefone_vendedor PRIMARY KEY (cd_matricula,cd_telefone),
  CONSTRAINT fk_telefone_vendedor_vendedor FOREIGN KEY (cd_matricula) REFERENCES vendedor (cd_matricula),
  CONSTRAINT fk_telefone_vendedor_telefone FOREIGN KEY (cd_telefone) REFERENCES telefone (cd_telefone)
);

CREATE TABLE tipo_venda 
(
  cd_tipo_venda INT,
  nm_venda VARCHAR(45),
  
  CONSTRAINT pk_tipo_venda PRIMARY KEY (cd_tipo_venda,nm_venda)
);

CREATE TABLE produto
(
  cd_produto INT,
  nm_produto VARCHAR(45),
  ds_produto VARCHAR(150),
  vl_produto DECIMAL(9,2),
  CONSTRAINT pk_produto PRIMARY KEY (cd_produto)
);

CREATE TABLE venda
(
  cd_venda INT,
  nm_cpf_cliente VARCHAR(20),
  cd_matricula INT,
  dt_venda DATE,
  hr_venda TIME,
  vl_venda DECIMAL(9,2),
  qt_produto_vendida INT,
  cd_tipo_venda INT,

  CONSTRAINT pk_venda PRIMARY KEY (cd_venda,nm_cpf_cliente,cd_matricula),
  CONSTRAINT fk_venda_cliente FOREIGN KEY (nm_cpf_cliente) REFERENCES cliente (nm_cpf_cliente),
  CONSTRAINT fk_venda_vendedor FOREIGN KEY (cd_matricula) REFERENCES vendedor (cd_matricula),
  CONSTRAINT fk_venda_tipo_venda FOREIGN KEY (cd_tipo_venda) REFERENCES tipo_venda (cd_tipo_venda)
);

CREATE TABLE parcela
(
  dt_vendimento DATE,
  vl_parcela DECIMAl(9,2),
  cd_venda INT,
  nm_cpf_cliente VARCHAR(20),
  cd_matricula INT,

  CONSTRAINT pk_parcela PRIMARY KEY (dt_vendimento),
  CONSTRAINT fk_parcela_venda FOREIGN KEY (cd_venda) REFERENCES venda (cd_venda),
  CONSTRAINT fk_parcela_cliente FOREIGN KEY (nm_cpf_cliente) REFERENCES cliente (nm_cpf_cliente),
  CONSTRAINT fk_parcela_vendedor FOREIGN KEY (cd_matricula) REFERENCES vendedor (cd_matricula)
);

CREATE TABLE produto_venda
(
  cd_produto INT,
  cd_venda INT,
  qt_produto_estoque INT,
  
  CONSTRAINT pk_produto_venda PRIMARY KEY (cd_produto,cd_venda),
  CONSTRAINT fk_produto_venda_produto FOREIGN KEY (cd_produto) REFERENCES produto (cd_produto),
  CONSTRAINT fk_produto_venda_venda FOREIGN KEY (cd_venda) REFERENCES venda (cd_venda)
);

insert into produto values(1,'Barra de Ferro','barra de ferro de 5kg','120.00');
insert into produto values(2,'Machado','machado de ferro inportado','145.00');
insert into produto values(3,'Pá','pá de cobre pequena','60.00');

insert into tipo_venda values(1,'parcelado');
insert into tipo_venda values(2,'a vista');

insert into telefone values(1,'fixo');
insert into telefone values(2,'celular');

insert into vendedor values(1,'Luiz Fernando','914.342.598-46','Rua Alexandre França','1250.00');
insert into vendedor values(2,'Cristina Ferreira','523.118.818-25','Rua Enersto Costa','1250.00');

insert into telefone_vendedor values(1,1,'(13)65395-3818');
insert into telefone_vendedor values(2,1,'(13)17573-3655');
insert into telefone_vendedor values(2,2,'(13)88700-0075');

insert into cliente values('814.817.028-23','Luiza Ferreira','32.234.182-6','Rua Alexandre Fontes');
insert into cliente values('192.349.708-10','Frendo Farias','15.427.119-6','Rua Senador Feijó');

insert into telefone_cliente values('814.817.028-23',1,'(13)88287-0259');
insert into telefone_cliente values('814.817.028-23',2,'(13)99254-8542');
insert into telefone_cliente values('192.349.708-10',1,'(13)39405-8546');

insert into venda values(1,'814.817.028-23',1,'2021-09-25','12:45','90.00',4,2);
insert into venda values(2,'192.349.708-10',2,'2021-10-15','14:45','100.00',7,1);

insert into produto_venda values(1,1,45);
insert into produto_venda values(2,2,30);

insert into parcela values('2021-12-15','30.00',2,'192.349.708-10',1);