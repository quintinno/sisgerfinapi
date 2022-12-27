drop table if exists tb_lancamento_financeiro cascade;

create table if not exists tb_lancamento_financeiro (
    codigo serial not null,
    id_tipo_lancamento_financeiro integer not null,
    id_pessoa_recebimento_lancamento integer not null,
    id_pessoa_pagamento_lancamento integer not null,
    id_categoria_lancamento_financeiro integer not null,
    data_vencimento date not null,
    data_pagamento date null,
    valor_total float not null,
    valor_pagamento float not null,
    identificador varchar(100) not null,
    constraint pk_lancamento_financeiro primary key (codigo),
    constraint fk_tipo_lancamento_financeiro foreign key (id_tipo_lancamento_financeiro) references tb_tipo_lancamento_financeiro (codigo),
    constraint fk_categoria_lancamento_financeiro foreign key (id_categoria_lancamento_financeiro) references tb_categoria_lancamento_financeiro (codigo)
);