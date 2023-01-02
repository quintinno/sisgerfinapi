drop table if exists tb_lancamento_financeiro_pagamento cascade;

create table if not exists tb_lancamento_financeiro_pagamento (
    codigo serial not null,
    id_lancamento_financeiro integer not null,
    id_pagamento integer not null,
    constraint pk_lancamento_financeiro_pagamento primary key (codigo),
    constraint fk_lancamento_financeiro foreign key (id_lancamento_financeiro) references tb_lancamento_financeiro (codigo),
    constraint fk_pagamento foreign key (id_pagamento) references tb_pagamento (codigo)
);