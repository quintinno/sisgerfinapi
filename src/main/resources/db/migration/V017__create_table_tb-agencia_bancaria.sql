drop table if exists tb_agencia_bancaria cascade;

create table if not exists tb_agencia_bancaria (
    codigo serial not null, 
    numero varchar(100) not null,
    constraint pk_agencia_bancaria primary key (codigo)
);