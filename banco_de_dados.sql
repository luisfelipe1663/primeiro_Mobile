create database if not exists curriculos_db;

use curriculos_db;

create table if not exists curriculos(
	id int auto_increment primary key,
    nome varchar(150) not null,
    email varchar(150) not null,
    telefone varchar(25)  not null,
    cidade varchar(120)  not null,
    profissao varchar(120)  not null,
    objetivo text,
    resumo text
);

create table if not exists experiencias(
	id int auto_increment primary key,
    curriculo_id int not null,
    empresa varchar(150) not null,
    cargo varchar(120) not null,
    periodo varchar(80)not null,
    atividade text,
    constraint fk_experiencias_curriculares FOREIGN KEY (curriculo_id)
    REFERENCES curriculos(id) on delete cascade
);
create table if not exists formacoes(
	id int auto_increment primary key,
	curriculo_id int not null,
	escolaridade  varchar(80) ,
	curso varchar(160) not null,
	instituicao varchar(160) not null,
	conclusao varchar(30),
	constraint fk_experiencias_curriculares FOREIGN KEY (curriculo_id)
    REFERENCES curriculos(id) on delete cascade
);


create table if not exists habilidades(
	id int auto_increment primary key,
    curriculo_id int not null,
    nome varchar(100) not null,
    constraint fk_habilidades_curriculo FOREIGN KEY (curriculo_id)
    references curriculos(id) on delete cascade
);

create table if not exists idiomas(
	id int auto_increment primary key,
	curriculo_id int not null,
    nome varchar(80)  not null,
    nivel varchar(50)  not null,
	constraint fk_idiomas_curriculo FOREIGN KEY (curriculo_id)
    REFERENCES curriculos(id) on delete cascade
);
select * from curriculos;
insert into curriculos( nome,email,telefone,cidade,profissao,objetivo,resumo) values
('luis felipe', 'luisFortin@gmail.com', '11 55555-8888', 'cidade','Desenvolvedor from, mobile, e back','ganhar muito dinheiro e aprendender', 'desenvolverdor com experiencia em flutter e dart');


  insert into experiencias(curriculo_id,empresa,cargo,periodo,atividade) values
  (1,'Tech solucions','Desenvolvedor Mobile','2023','atual','Desenvolvimento de aplicativos utilizando Flutter');
  
  insert into formacoes(curriculo_id,escolaridade,curso,instituicao,conclusao) values
  (1,'Ensino Superior completo','Analise e desenvolvimento de sistemas','Faculdade de tecnologia Fatec','2026');
   


