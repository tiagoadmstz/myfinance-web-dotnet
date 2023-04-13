IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'myfinance')
  BEGIN
    CREATE DATABASE myfinance;
  END
GO

USE myfinance;
GO

IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'myfinance')
  BEGIN
    CREATE LOGIN PROD WITH PASSWORD = 'TESTE@123';
    CREATE USER PROD FOR LOGIN PROD;
  END
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='planoconta' and xtype='U')
BEGIN
  CREATE TABLE planoconta (
    id int identity(1, 1) not null,
    descricao varchar(50) not null,
    tipo char(1) not null,
    primary key (id)
  );

  insert into planoconta(descricao, tipo) values ('Combustível', 'D');
  insert into planoconta(descricao, tipo) values ('Alimentação', 'D');
  insert into planoconta(descricao, tipo) values ('Impostos', 'D');
  insert into planoconta(descricao, tipo) values ('Salário', 'R');
END
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='transacao' and xtype='U')
BEGIN
  create table transacao (
    id int identity(1, 1) not null,
    historico text null,
    data date not null,
    valor decimal(9, 2),
    planocontaid int not null,
    primary key(id),
    foreign key(planocontaid) references planoconta(id)
  );

  insert into transacao(historico, data, valor, planocontaid) values ('Gasolina para viagem', getdate(), 300, 1);
  insert into transacao(historico, data, valor, planocontaid) values ('Compras do mês', getdate()+2, 650, 2);
  insert into transacao(historico, data, valor, planocontaid) values ('Salário do mês', '2023-01-07', 1000, 4);
END
GO
