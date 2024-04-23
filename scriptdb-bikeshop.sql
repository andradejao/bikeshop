CREATE DATABASE bikeshop;
USE bikeshop;

CREATE TABLE inventario(
idinventario int auto_increment primary key,
modelo varchar(50) not null,
marca varchar(50) not null,
quantidade int not null,
preco decimal(6,2) not null,
idfornecedor int not null
);

CREATE TABLE cliente(
idcliente int auto_increment primary key,
nome varchar(50) not null,
endereco varchar(100) not null,
telefone varchar(15) not null,
email varchar(100)
);

CREATE TABLE venda(
idvenda int auto_increment primary key,
data datetime default current_timestamp(),
idcliente int not null,
idinventario int not null,
quantidadevendida int not null,
precototal decimal(6,2) not null,
metodopagamento enum("Dinheiro","Crédito","Débito","Pix"),
idvendedor int not null
);

CREATE TABLE fornecedor(
idfornecedor int auto_increment primary key,
nomefornecedor varchar(50) not null,
enderecofornecedor varchar(100) not null,
telefonefornecedor varchar(15) not null,
emailfornecedor varchar(100) not null
);

CREATE TABLE vendedor(
idvendedor int auto_increment primary key,
nomevendedor varchar(50) not null,
idfuncionario int not null
);

CREATE TABLE funcionario(
idfuncionario int auto_increment primary key,
nomefuncionario varchar(50) not null,
cargo varchar(30) not null,
salario decimal(6,2) not null,
dataadmissao date not null
);

CREATE TABLE detalhevenda(
iddetalhevenda int auto_increment primary key,
idvenda int not null,
idinventario int not null
);

-- Iniciando as alterações nas tables para 
-- interligar as foreign keys 

ALTER TABLE inventario ADD CONSTRAINT `fk.inven_pk.forne`
FOREIGN KEY inventario(`idfornecedor`) REFERENCES fornecedor(`idfornecedor`);

ALTER TABLE venda ADD CONSTRAINT `fk.venda_pk.cliente`
FOREIGN KEY venda(`idcliente`) REFERENCES cliente(`idcliente`);

ALTER TABLE venda ADD CONSTRAINT `fk.venda_pk.inven`
FOREIGN KEY venda(`idinventario`) REFERENCES inventario(`idinventario`);

ALTER TABLE venda ADD CONSTRAINT `fk.venda_pk.vendedor`
FOREIGN KEY venda(`idvendedor`) REFERENCES vendedor(`idvendedor`);

ALTER TABLE vendedor ADD CONSTRAINT `fk.vendedor_pk.func`
FOREIGN KEY vendedor(`idfuncionario`) REFERENCES funcionario(`idfuncionario`);

ALTER TABLE detalhevenda ADD CONSTRAINT `fk.dtvenda_pk.venda`
FOREIGN KEY detalhevenda(`idvenda`) REFERENCES venda(`idvenda`);

ALTER TABLE detalhevenda ADD CONSTRAINT `fk.dtvenda_pk.inven`
FOREIGN KEY detalhevenda(`idinventario`) REFERENCES inventario(`idinventario`);







