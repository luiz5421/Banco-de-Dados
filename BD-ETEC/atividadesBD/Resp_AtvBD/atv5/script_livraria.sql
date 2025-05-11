DROP SCHEMA IF EXISTS atvLivraria;

CREATE SCHEMA atvLivraria;
USE atvLivraria;

CREATE TABLE editora 
(
  cd_editora INT,
  nm_editora VARCHAR(45),
  ds_endereço VARCHAR(120),
  nm_telefone VARCHAR(20),
  CONSTRAINT pk_editora PRIMARY KEY (cd_editora) 
);

CREATE TABLE livro 
(
  cd_livro INT,
  nm_titulo_livro VARCHAR(45),
  nm_idioma VARCHAR(45),
  dt_lançamento DATE,
  CONSTRAINT pk_livro PRIMARY KEY (cd_livro) 
);

CREATE TABLE edição 
(
  cd_ISBN INT,
  vl_edição DECIMAL(9,2),
  aa_publicação YEAR,
  qt_páginas INT,
  qt_exemplares_estoque INT,
  cd_editora INT,
  cd_livro INT,
  CONSTRAINT pk_edição PRIMARY KEY (cd_ISBN), 
  CONSTRAINT fk_edição_editora FOREIGN KEY (cd_editora) REFERENCES editora (cd_editora),
  CONSTRAINT fk_edição_livro FOREIGN KEY (cd_livro) REFERENCES livro (cd_livro)
);

CREATE TABLE autor 
(
  cd_autor INT,
  nm_autor VARCHAR(45),
  nm_pseudônimo VARCHAR(45),
  aa_nascimento YEAR,
  nm_país_origem VARCHAR(45),
  ds_biográfica VARCHAR(150),
  CONSTRAINT pk_autor PRIMARY KEY (cd_autor) 
);

CREATE TABLE livro_autor 
(
  cd_autor INT,
  cd_livro INT,
  CONSTRAINT pk_livro_autor PRIMARY KEY (cd_autor,cd_livro),
  CONSTRAINT fk_livro_autor_livro FOREIGN KEY (cd_livro) REFERENCES livro (cd_livro),
  CONSTRAINT fk_livro_autor_autor FOREIGN KEY (cd_autor) REFERENCES autor (cd_autor)
);

insert into autor values (1,'Fernando Filho','Fernando','1980','Brasil','Nasceu em São Paulo, e foi para sergipe com sua mãe e lá conheceu alguns autores');
insert into autor values (2,'José Almeida','Almeida','1930','França','Nasceu em Paris, e veio para o Brasil e conheceu alguns autores');
insert into autor values (3,'Luiza Ferreira','Luiza','1959','Cuba','Nasceu em Havana, e foi para a França onde estudou e conheceu alguns autores');


insert into editora values (1,'Saraiva','Rua Afonso Pena','(13) 99673-7824');
insert into editora values (2,'Blender','Rua Almirante Enerto','(15) 99274-5272');
insert into editora values (3,'Aleph','Rua Afonso Pena','(13) 99475-2857');

insert into livro values (1,'As Aventuras de Pedrux','Português','1990-06-15');
insert into livro values (2,'Historias Assonbradas','Português','1947-03-19');
insert into livro values (3,'As Avenduras dos Amigos','Inglês','1965-08-29');

insert into edição values (978316,'930.00','1990',320,290,1,1);
insert into edição values (975489,'2930.00','1949',740,250,2,2);
insert into edição values (970954,'9530.00','1967',520,120,3,3);
insert into edição values (978524,'4030.00','1979',560,180,1,2);

insert into livro_autor values (1,1);
insert into livro_autor values (2,2);
insert into livro_autor values (3,3);




