drop table if exists tb_lancamento_financeiro_parcelamento cascade;

create table if not exists tb_lancamento_financeiro_parcelamento (
    codigo serial not null,
    id_lancamento_financeiro integer not null,
    id_parcelamento integer not null,
    constraint pk_lancamento_financeiro_parcelamento primary key (codigo),
    constraint fk_lancamento_financeiro foreign key (id_lancamento_financeiro) references tb_lancamento_financeiro (codigo),
    constraint fk_parcelamento foreign key (id_parcelamento) references tb_parcelamento (codigo)
);