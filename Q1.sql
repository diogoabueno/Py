
create table VENDEDOR
(
Vendedor_id int not null,
Vendedor_nome varchar (255) null
)

create table VENDA
(
Venda_id int not null, 
Vendedor_id int not null,
Venda_data date null,
Venda_valor numeric(38,2) null,
)


INSERT INTO VENDEDOR (Vendedor_id,Vendedor_nome)
VALUES (1, 'ARTHUR'), 
(2, 'ROBERTO'), 
(3, 'JOAO'), 
(4, 'RENATA'),
(5, 'JOAQUINA')

SELECT * FROM VENDEDOR


INSERT INTO VENDA (Venda_id,Vendedor_id,Venda_data,Venda_valor)
VALUES(18,5,'05-01-2016',900.20),
(2,1,'05-04-2017',50225.30),
(3,1,'05-09-2016',10253.50),
(4,1,'05-11-2016',9126.42),
(5,2,'05-01-2016',1500.00),
(6,3,'05-04-2016',84522.45),
(7,2,'09-07-2016',20123.12),
(8,3,'05-20-2018',84300.45),
(9,3,'12-07-2016',10200.82),
(10,2,'12-25-2016',12200.55),
(11,4,'21-04-2016',1500.25),
(12,5,'09-07-2020',20000.00),
(13,4,'09-07-2018',42223.10),
(14,4,'11-6-2016',50123.12),
(15,5,'07-09-2016',48200.41),
(16,5,'12-10-2016',11000.00)

SELECT * FROM VENDA
order by Vendedor_id asc



with vd as
(
SELECT
Vendedor_nome,
Venda_data,
Venda_valor
FROM VENDA v
left join VENDEDOR vd on vd.Vendedor_id = v.Vendedor_id
WHERE YEAR(Venda_data) = 2016
)
select
vd1.Vendedor_nome,
vd1.Venda_data,
vd1.Venda_valor from vd vd1
left join vd vd2
ON vd1.Vendedor_nome = vd2.Vendedor_nome AND vd1.Venda_valor < vd2.Venda_valor
WHERE vd2.Vendedor_nome IS NULL
ORDER BY vd1.Vendedor_nome ASC