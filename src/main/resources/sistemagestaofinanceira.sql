drop table if exists flyway_schema_history cascade;

drop table if exists tb_tipo_contrato cascade;

drop table if exists tb_contrato cascade;

drop table if exists tb_tipo_periodo cascade;

drop table if exists tb_tipo_pessoa cascade;

drop table if exists tb_contrato_parcelamento cascade;

drop table if exists tb_parcelamento cascade;

drop table if exists tb_tipo_lancamento_financeiro cascade;

drop table if exists tb_categoria_lancamento_financeiro cascade;

drop table if exists tb_lancamento_financeiro cascade;

drop table if exists tb_tipo_parcelamento cascade;

drop table if exists tb_parcelamento cascade;

drop table if exists tb_lancamento_financeiro_parcelamento cascade;

drop table if exists tb_produto_servico cascade;

drop table if exists tb_lancamento_financeiro_produto_servico cascade;

-- Cadastrar Lancamento Financeiro (Receita Fixa)

/*
	1 - José Quintinno
	2 - Priscilla Mariano
	3 - Mirante Tecnologia da Informacao
	4 - Governo do Distrito Federal
	5 - Banco do Brasil
	6 - Banco Itaú
	7 - Sinagoga Keter Torah
	8 - Brava Internet Fixa
*/

insert into tb_lancamento_financeiro (
	id_tipo_lancamento_financeiro, id_categoria_lancamento_financeiro, id_pessoa_recebimento_lancamento, id_pessoa_pagamento_lancamento, 
	data_vencimento, data_pagamento, valor_total, valor_pagamento, identificador) values (
	(select codigo from tb_tipo_lancamento_financeiro where descricao like 'Receita Fixa'),
	(select codigo from tb_categoria_lancamento_financeiro where descricao like 'Salário Mensalista'),
	1, 3, '2023-01-10', null, 51600, 4300, 'RECEITA001MENSAL12FIXA' 
);

-- Cadastrar Lancamento Financeiro (Despesa Fixa)
insert into tb_lancamento_financeiro (
	id_tipo_lancamento_financeiro, id_categoria_lancamento_financeiro, id_pessoa_recebimento_lancamento, id_pessoa_pagamento_lancamento, 
	data_vencimento, data_pagamento, valor_total, valor_pagamento, identificador) values (
	(select codigo from tb_tipo_lancamento_financeiro where descricao like 'Despesa Fixa'),
	(select codigo from tb_categoria_lancamento_financeiro where descricao like 'Doação Pessoa Jurídica'),
	7, 1, '2023-01-10', null, 2400, 200, 'DESPESA007MENSAL12FIXA' 
);

insert into tb_lancamento_financeiro (
	id_tipo_lancamento_financeiro, id_categoria_lancamento_financeiro, id_pessoa_recebimento_lancamento, id_pessoa_pagamento_lancamento, 
	data_vencimento, data_pagamento, valor_total, valor_pagamento, identificador) values (
	(select codigo from tb_tipo_lancamento_financeiro where descricao like 'Despesa Fixa'),
	(select codigo from tb_categoria_lancamento_financeiro where descricao like 'Consóricio Pessoa Física'),
	7, 1, '2023-01-10', null, 2400, 100, 'DESPESA007MENSAL12FIXA' 
);

insert into tb_lancamento_financeiro (
	id_tipo_lancamento_financeiro, id_categoria_lancamento_financeiro, id_pessoa_recebimento_lancamento, id_pessoa_pagamento_lancamento, 
	data_vencimento, data_pagamento, valor_total, valor_pagamento, identificador) values (
	(select codigo from tb_tipo_lancamento_financeiro where descricao like 'Despesa Fixa'),
	(select codigo from tb_categoria_lancamento_financeiro where descricao like 'Empréstimo Pessoa Jurídica (Pagamento)'),
	7, 1, '2023-01-10', null, 2400, 400, 'DESPESA007MENSAL12FIXA' 
);
	
-- Recuperar Lancamentos Financeiros (Janeiro de 2023)
select 
	case when id_pessoa_recebimento_lancamento = 1 then 'José Quintinno'
	 when id_pessoa_recebimento_lancamento = 2 then 'Priscilla Mariano'
	 when id_pessoa_recebimento_lancamento = 3 then 'Mirante Tecnologia da Informacao'
	 when id_pessoa_recebimento_lancamento = 4 then 'Governo do Distrito Federal'
	 when id_pessoa_recebimento_lancamento = 5 then 'Banco do Brasil'
	 when id_pessoa_recebimento_lancamento = 6 then 'Banco Itaú'
	 when id_pessoa_recebimento_lancamento = 7 then 'Sinagoga Keter Torah'
	else ''
	end as favorecido,
	tipo_lancamento_financeiro.descricao,
	categoria_lancamento_financeiro.descricao,
	to_char(data_vencimento,'DD/MM/YYYY') as vencimento,
	concat('R$ ', valor_pagamento) as valor,
	identificador
from tb_lancamento_financeiro lancamento_financeiro
join tb_tipo_lancamento_financeiro tipo_lancamento_financeiro on tipo_lancamento_financeiro.codigo = lancamento_financeiro.id_tipo_lancamento_financeiro
join tb_categoria_lancamento_financeiro categoria_lancamento_financeiro on categoria_lancamento_financeiro.codigo = lancamento_financeiro.id_categoria_lancamento_financeiro
where data_vencimento between '2023-01-01' and '2023-01-31'
order by data_vencimento asc;

select 
	sum(valor_pagamento)
from tb_lancamento_financeiro lancamento_financeiro
join tb_tipo_lancamento_financeiro tipo_lancamento_financeiro on tipo_lancamento_financeiro.codigo = lancamento_financeiro.id_tipo_lancamento_financeiro
join tb_categoria_lancamento_financeiro categoria_lancamento_financeiro on categoria_lancamento_financeiro.codigo = lancamento_financeiro.id_categoria_lancamento_financeiro
where data_vencimento between '2023-01-01' and '2023-01-31'
and categoria_lancamento_financeiro.codigo <> 1;

