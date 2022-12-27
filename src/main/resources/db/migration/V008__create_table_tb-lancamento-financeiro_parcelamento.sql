drop table if exists tb_lancamento_financeiro_produto_servico cascade;

create table if not exists tb_lancamento_financeiro_produto_servico (
    codigo serial not null,
    id_lancamento_financeiro integer not null,
    id_produto_servico integer not null,
    data_criacao date not null,
    constraint pk_lancamento_financeiro_produto_servico primary key (codigo),
    constraint fk_lancamento_financeiro foreign key (id_lancamento_financeiro) references tb_lancamento_financeiro (codigo),
    constraint fk_produto_servico foreign key (id_produto_servico) references tb_produto_servico (codigo)
);