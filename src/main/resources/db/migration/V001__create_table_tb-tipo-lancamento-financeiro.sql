drop table if exists tb_tipo_lancamento_financeiro cascade;

create table if not exists tb_tipo_lancamento_financeiro (
    codigo serial not null,
    descricao varchar(100) not null,
    constraint pk_tipo_pessoa primary key (codigo)
);