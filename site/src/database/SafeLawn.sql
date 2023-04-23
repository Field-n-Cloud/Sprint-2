CREATE DATABASE safelawn;

USE safelawn;

CREATE TABLE clube (
	idClube INT PRIMARY KEY AUTO_INCREMENT,
	nomeClube VARCHAR(45),
	cnpj CHAR(14),
    senha VARCHAR(10),
	email VARCHAR(45),
    telefoneCelular CHAR(11),
	uf CHAR(2)
);

INSERT INTO clube (nomeClube, cnpj, senha, email, telefoneCelular, uf) VALUES
	('Flamengo ', '12345678901234', 'senha123', 'contato@flamengo.com.br', '21999999999', 'RJ'),
	('Corinthians', '23456789012345', 'senha456', 'contato@corinthians.com.br', '11999999999', 'SP'),
	('Palmeiras', '34567890123456', 'senha789', 'contato@palmeiras.com.br', '11999999998', 'SP');

CREATE TABLE  tipoUsuario (
	idTipoUsuario INT PRIMARY KEY AUTO_INCREMENT,
	tipo VARCHAR(45)
);

INSERT INTO tipoUsuario (tipo) VALUES 
	('Administrador'), 
    ('Funcionario');

CREATE TABLE usuario (
	idUsuario INT AUTO_INCREMENT,
	nomeUsuario VARCHAR(45),
	email VARCHAR(45),
	senha VARCHAR(20),
	telefoneCelular CHAR(11),
	fkClube INT, 
    fkTipoUsuario INT,
    FOREIGN KEY (fkClube) REFERENCES clube(idClube),
	PRIMARY KEY (idUsuario, fkClube),
    FOREIGN KEY (fkTipoUsuario) REFERENCES tipoUsuario(idTipoUsuario)
);

INSERT INTO usuario (nomeUsuario, email, senha, telefoneCelular, fkClube, fkTipoUsuario) VALUES
	('João Alvares', 'joao.alvares@flamengo.com.br', '123456', '21988888888', 1, 1),
	('Pedro Roberto', 'pedro.roberto@corinthians.com.br', '123456', '11977777777', 2, 2),
	('Felipe Silve', 'felipe.silva@palmeiras.com.br', '123456', '11966666666', 3, 2);

CREATE TABLE endereco (
	idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    cep CHAR(8),
	logradouro VARCHAR(45),
	numero INT,
	complemento VARCHAR(45)
);

INSERT INTO endereco (cep, logradouro, numero, complemento) VALUES
	('01234567', 'Rua A', 123, ''),
	('89012345', 'Avenida B', 456, 'Sala 1'),
	('65432109', 'Rua C', 789, 'Bloco D');

CREATE TABLE tipoGrama (
idTipoGrama INT PRIMARY KEY AUTO_INCREMENT,
tipoGrama VARCHAR(15)
);

INSERT INTO tipoGrama (tipoGrama) VALUES
	('Bermuda'),
	('Zoysia'),
    ('rizomatosas');

CREATE TABLE medida (
idMedida INT PRIMARY KEY AUTO_INCREMENT,
UnidadeMedida VARCHAR(45),
sigla VARCHAR(45)
);

INSERT INTO medida (UnidadeMedida, sigla) VALUES
	('Porcentagem', '%'), 
    ('Milímetro', 'mm'),
	('Grão por metro cúbico', 'g/m3'), 
	('Pascal', 'Pa');
    

CREATE TABLE alturaGramado (
idAlturaGramado INT PRIMARY KEY AUTO_INCREMENT,
altura INT,
fkMedida INT,
FOREIGN KEY (fkmedida) REFERENCES medida(idMedida)
); 

INSERT INTO alturaGramado (altura, fkMedida) VALUES
	(10, 2),
    (15, 2),
    (20, 2);

CREATE TABLE fornecedorGramado (
idFornecedorGramado INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
telefone VARCHAR(45),
email VARCHAR(45)
);

INSERT INTO fornecedorGramado (nome, telefone, email) VALUES
	('Fornecedor A', '11987654321', 'contato@fornecedora.com.br'),
	('Fornecedor B', '21987654321', 'contato@fornecedorb.com.br'),
	('Fornecedor C', '31987654321', 'contato@fornecedorc.com.br');

CREATE TABLE modeloGramado (
	idmodeloGramado INT PRIMARY KEY AUTO_INCREMENT,
    minUmidade INT,
    maxUmidade INT,
    fkFornecedorGramado INT,
    fkTipoGrama INT,
    fkAlturaGramado INT,
    FOREIGN KEY (fkFornecedorGramado) REFERENCES fornecedorGramado(idFornecedorGramado),
    FOREIGN KEY (fkTipoGrama) REFERENCES tipoGrama(idTipoGrama),
    FOREIGN KEY (fkalturaGramado) REFERENCES alturaGramado(idAlturaGramado)
);

INSERT INTO modeloGramado (minUmidade, maxUmidade, fkFornecedorGramado, fkTipoGrama, fkalturaGramado) VALUES
	(20, 55, 1, 1, 1),
    (25, 60, 2, 2, 2),
    (30, 65, 3, 3, 3);

CREATE TABLE estadio (
	idEstadio INT PRIMARY KEY AUTO_INCREMENT,
	nomeEstadio VARCHAR(40),
    cnpj VARCHAR (14),
	fkClube INT,
	fkEndereco INT,
    fkModeloGramado INT, 
    FOREIGN KEY (fkClube) REFERENCES clube(idClube),
    FOREIGN KEY (fkEndereco) REFERENCES endereco(idEndereco),
    FOREIGN KEY (fkModeloGramado) REFERENCES modeloGramado(idmodeloGramado)
);

INSERT INTO estadio (nomeEstadio, cnpj, fkClube, fkEndereco, fkModeloGramado) VALUES 
	('Maracanã', '12345678901234', 1, 1, 1),
	('Arena Corinthians', '23456789012345', 2, 2, 2),
	('Allianz Parque', '34567890123456', 3, 3, 3);

CREATE TABLE SetorEstadio (
	idSetor INT PRIMARY KEY AUTO_INCREMENT,
    nomeSetor VARCHAR(45),
    fkEstadio INT,
    FOREIGN KEY (fkEstadio) REFERENCES estadio(idEstadio)
);

INSERT INTO SetorEstadio (nomeSetor, fkEstadio) VALUES
	('Norte-Leste', 1),
    ('Norte-Oeste', 1),
    ('Sul-Leste', 1),
    ('Sul-Oeste', 1),
    ('Norte-Leste', 2),
    ('Norte-Oeste', 2),
    ('Sul-Leste', 2),
    ('Sul-Oeste', 2),
    ('Norte-Leste', 3),
    ('Norte-Oeste', 3),
    ('Sul-Leste', 3),
    ('Sul-Oeste', 3);

CREATE TABLE statusSensor (
idStatusSensor INT PRIMARY KEY AUTO_INCREMENT,
statusSendor VARCHAR(45)
);

INSERT INTO statusSensor (statusSendor) VALUES
	('Ativo'),
    ('Inativo'),
    ('Manutenção');

CREATE TABLE modeloSensor (
idModeloSensor INT PRIMARY KEY AUTO_INCREMENT,
modeloSensor VARCHAR(45)
);

INSERT INTO modeloSensor (modeloSensor) VALUES 
	('DHT11'),
    ('DHT12'),
    ('DHT13');

CREATE TABLE Sensor (
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(45),
    fkSetor INT, 
    fkstatusSensor INT,
    fkmodeloSensor INT,
    FOREIGN KEY (fkstatusSensor) REFERENCES statusSensor(idStatusSensor),
    FOREIGN KEY (fkmodeloSensor) REFERENCES modeloSensor(idModeloSensor)
);

INSERT INTO Sensor (descricao, fkSetor, fkstatusSensor, fkmodeloSensor) VALUES
	('Sensor 1', 1, 1, 1),
    ('Sensor 2', 2, 2, 1),
    ('Sensor 3', 3, 3, 2),
    ('Sensor 1', 5, 1, 2),
    ('Sensor 2', 6, 2, 2),
    ('Sensor 3', 7, 3, 3),
    ('Sensor 1', 9, 1, 1),
    ('Sensor 1', 10, 2, 2),
    ('Sensor 1', 11, 3, 3);

CREATE TABLE DadosSensor (
	idCaptura INT AUTO_INCREMENT,
    dtCaptura DATE,
    valorCaptura FLOAT,
    fkSensor INT,
    fkMedida INT,
	FOREIGN KEY (fkSensor) REFERENCES Sensor(idSensor),
    PRIMARY KEY (idCaptura, fkSensor),
    FOREIGN KEY (fkMedida) REFERENCES medida(idMedida)
);

INSERT INTO DadosSensor (dtCaptura, valorCaptura, fkSensor, fkMedida) VALUES
	('2023-04-21', 20, 1, 1),
    ('2023-04-21', null, 2, 1),
    ('2023-04-21', null, 3, 1),
    ('2023-04-22', 30, 4, 1),
    ('2023-04-22', null, 5, 1),
    ('2023-04-22', null, 6, 1),
    ('2023-04-21', 65, 7, 1),
    ('2023-04-21', null, 8, 1),
    ('2023-04-21', null, 9, 1);

DROP DATABASE safelawn;