CREATE DATABASE safelawn;

USE safelawn;

CREATE TABLE clube (
	idClube INT PRIMARY KEY AUTO_INCREMENT,
	nomeClube VARCHAR(45),
	cnpj CHAR(14),
	email VARCHAR(45),
    telefoneCelular CHAR(11),
	uf CHAR(2)
);

CREATE TABLE  tipoUsuario (
idTipoUsuario INT PRIMARY KEY AUTO_INCREMENT,
tipo VARCHAR(45)
);

CREATE TABLE usuario (
	idusuario INT AUTO_INCREMENT,
	nomeUsuario VARCHAR(45),
	email VARCHAR(45),
	senha VARCHAR(20),
	telefoneCelular CHAR(11),
	fkClube INT, 
    fkTipoUsuario INT,
    FOREIGN KEY (fkClube) REFERENCES clube(idClube),
	PRIMARY KEY (idFuncionario, fkClube),
    FOREIGN KEY (fkTipoUsuario) REFERENCES tipoUsuario(idTipoUsuario)
);

CREATE TABLE endereco (
	idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    cep CHAR(8),
	logradouro VARCHAR(45),
	numero INT,
	complemento VARCHAR(45)
);

CREATE TABLE tipoGrama (
idTipoGrama INT PRIMARY KEY AUTO_INCREMENT,
tipoGrama VARCHAR(15)
);

CREATE TABLE medida (
idMedida INT PRIMARY KEY AUTO_INCREMENT,
UnidadeMedida VARCHAR(45),
sigla VARCHAR(45)
);

CREATE TABLE alturaGramado (
idAlturaGramado INT PRIMARY KEY AUTO_INCREMENT,
altura INT,
fkMedida INT,
FOREIGN KEY (fkmedida) REFERENCES medida(idMedida)
); 

CREATE TABLE fornecedorGramado (
idFornecedorGramado INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
telefone VARCHAR(45),
email VARCHAR(45)
);

CREATE TABLE modeloGramado (
	idmodeloGramado INT PRIMARY KEY AUTO_INCREMENT,
    minUmidade INT,
    maxUmidade INT,
    fkFornecedor INT,
    fkTipoGrama INT,
    fkAlturaGramado INT,
    FOREIGN KEY (fkFornecedorGramado) REFERENCES fornecedorGramado(idFornecedorGramado),
    FOREIGN KEY (fkTipoGrama) REFERENCES tipoGrama(idTipoGrama),
    FOREIGN KEY (fkalturaGramado) REFERENCES alturaGramado(idAlturaGramado)
);

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

CREATE TABLE SetorEstadio (
	idSetor INT PRIMARY KEY AUTO_INCREMENT,
    nomeSetor VARCHAR(45),
    fkEstadio INT,
    FOREIGN KEY (fkEstadio) REFERENCES estadio(idEstadio)
);

CREATE TABLE statusSensor (
idStatusSensor INT PRIMARY KEY AUTO_INCREMENT,
statusSendor VARCHAR(45)
);

CREATE TABLE modeloSensor (
idModeloSensor INT PRIMARY KEY AUTO_INCREMENT,
modeloSensor VARCHAR(45)
);

CREATE TABLE Sensor (
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(45),
    fkSetor INT, 
    fkstatusSensor INT,
    fkmodeloSensor INT,
    FOREIGN KEY (fkstatusSensor) REFERENCES statusSensor(idStatusSensor),
    FOREIGN KEY (fkmodeloSensor) REFERENCES modeloSensor(idModeloSensor)
);

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






