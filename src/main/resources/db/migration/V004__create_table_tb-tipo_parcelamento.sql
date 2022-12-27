drop table if exists tb_tipo_parcelamento cascade;

create table if not exists tb_tipo_parcelamento (
    codigo serial not null,
    descricao varchar(100) not null,
    constraint pk_tipo_parcelamento primary key (codigo)
);