drop table if exists tb_tipo_conta_bancaria cascade;

create table if not exists tb_tipo_conta_bancaria (
    codigo serial not null,
    descricao varchar(100) not null,
    constraint pk_tipo_conta_bancaria primary key (codigo)
);