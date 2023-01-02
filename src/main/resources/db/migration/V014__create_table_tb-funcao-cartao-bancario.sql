drop table if exists tb_funcao_cartao_bancario cascade;
create table if not exists tb_funcao_cartao_bancario (
    codigo serial not null,
    descricao varchar(100) not null,
    constraint pk_funcao_cartao_bancario primary key (codigo)
);