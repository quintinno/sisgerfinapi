drop table if exists tb_parcelamento cascade;

create table if not exists tb_parcelamento (
    codigo serial not null,
    id_tipo_parcelamento integer not null,
    data_vencimento date not null,
    data_pagamento date not null,
    identificador varchar(100) not null,
    constraint pk_parcelamento primary key (codigo),
    constraint fk_tipo_parcelamento foreign key (id_tipo_parcelamento) references tb_tipo_parcelamento (codigo)
);