drop table if exists tb_conta_bancaria cascade;

create table if not exists tb_conta_bancaria (
    codigo serial not null,
    id_tipo_conta_bancaria integer not null,
    id_pessoa_instituicao_financeira integer not null,
    id_pessoa_titular integer not null,
    id_cartao_bancario integer not null,
    id_agencia_bancaria integer not null,
    data_abertura date not null,
    data_fechamento date null,
    saldo_atual date not null,
    constraint pk_conta_bancaria primary key (codigo),
    constraint fk_tipo_conta_bancaria foreign key (id_tipo_conta_bancaria) references tb_tipo_conta_bancaria (codigo),
    constraint fk_cartao_bancario foreign key (id_cartao_bancario) references tb_cartao_bancario (codigo),
    constraint fk_agencia_bancaria foreign key (id_agencia_bancaria) references tb_agencia_bancaria (codigo)
);