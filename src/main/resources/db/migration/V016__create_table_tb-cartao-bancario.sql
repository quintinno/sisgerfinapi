drop table if exists tb_cartao_bancario cascade;

create table if not exists tb_cartao_bancario (
    codigo serial not null,
    id_funcao_cartao_bancario integer not null, 
    data_validade date not null,
    constraint pk_cartao_bancario primary key (codigo),
    constraint fk_funcao_cartao_bancario foreign key (id_funcao_cartao_bancario) references tb_funcao_cartao_bancario (codigo)
);