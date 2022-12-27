drop table if exists tb_produto_servico cascade;

create table if not exists tb_produto_servico (
    codigo serial not null,
    descricao varchar(100) not null,
    constraint pk_produto_servico primary key (codigo)
);