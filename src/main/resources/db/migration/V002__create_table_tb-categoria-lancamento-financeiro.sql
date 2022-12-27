drop table if exists tb_categoria_lancamento_financeiro cascade;

create table if not exists tb_categoria_lancamento_financeiro (
    codigo serial not null,
    descricao varchar(100) not null,
    constraint pk_categoria_lancamento_financeiro primary key (codigo)
);