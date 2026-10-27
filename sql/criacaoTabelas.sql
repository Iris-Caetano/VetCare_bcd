create database if not exists vetcare_bd;

use vetcare_bd;

create table if not exists especialidades(
	id_especialidade int auto_increment primary key,
    nome varchar(50) not null
);

create table if not exists servicos(
	id_servico int auto_increment primary key,
    nome varchar(50) not null,
    preco decimal(10, 2) not null
);

create table if not exists enderecos(
	id_endereco int auto_increment primary key,
    logradouro varchar(100) not null,
    numero varchar(10) not null,
    complemento varchar(100) not null, 
    bairro varchar(100) not null,
    cidade varchar(50) not null,
    estado varchar(50) not null,
    cep char(9)
);

create table if not exists tutores(
	id_tutor int auto_increment primary key,
    id_endereco int not null,
    nome varchar(100) not null,
    telefone varchar(10) not null,
    email varchar(100) not null,
    foreign key (id_endereco) references enderecos(id_endereco)
);

create table if not exists animais(
	id_animais int auto_increment primary key,
    id_tutor int not null,
    nome varchar(50) not null,
    especie varchar(20) not null,
    raca varchar(30) not null,
    data_nascimento date not null
);

create table if not exists veterinarios(
	id_veterinario int auto_increment primary key,
    id_especialidade int not null,
    nome varchar(100) not null,
    crmv varchar(20) not null,
    telefone char(10),
    foreign key (id_especialidade) references especialidades(id_especialidade)
);

create table if not exists consultas(
	id_consulta int auto_increment primary key,
    id_animais int not null,
    id_veterinario int not null,
    data_hora datetime not null,
    status_consulta varchar(20),
    observacoes text,
    foreign key (id_animais) references animais (id_animais),
    foreign key (id_veterinario) references veterinarios (id_veterinario)
);

create table if not exists consultas_servicos(
	id_consultas_servicos int auto_increment primary key,
    id_consulta int not null,
    id_servico int not null,
    quantidade int not null,
    valor_unitario decimal(10,2) not null,
    foreign key (id_consulta) references consultas (id_consulta),
    foreign key (id_servico) references servicos (id_servico)
);



