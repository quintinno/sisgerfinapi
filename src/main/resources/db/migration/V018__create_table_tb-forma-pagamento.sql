drop table if exists tb_forma_pagamento cascade;

create table if not exists tb_forma_pagamento (
    codigo serial not null,
    descricao varchar(100) not null,
    constraint pk_forma_pagamento primary key (codigo)
);