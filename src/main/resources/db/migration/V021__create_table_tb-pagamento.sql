drop table if exists tb_pagamento cascade;

create table if not exists tb_pagamento (
    codigo serial not null,
    id_conta_bancaria integer not null,
    id_forma_pagamento integer not null,
    valor float not null,
    constraint pk_pagamento primary key (codigo),
    constraint fk_conta_bancaria foreign key (id_conta_bancaria) references tb_conta_bancaria (codigo),
    constraint fk_forma_pagamento foreign key (id_forma_pagamento) references tb_forma_pagamento (codigo)
);