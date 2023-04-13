CREATE DATABASE safelawn;

USE safelawn;

CREATE TABLE clube (
	idClube INT PRIMARY KEY AUTO_INCREMENT,
	nomeClube VARCHAR(45),
	cnpj CHAR(14),
	email VARCHAR(45),
	uf CHAR(2)
);

CREATE TABLE funcionario (
	idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
	nomeFunc VARCHAR(45),
	email VARCHAR(45),
	senha VARCHAR(20),
	telCel CHAR(11),
	fkClube INT, CONSTRAINT fkClubeFuncionario FOREIGN KEY (fkClube) REFERENCES clube(idClube),
	CONSTRAINT pkCompostaClubeFuncionario PRIMARY KEY (idFuncionario, fkClube)
);

CREATE TABLE endereco (
	idEndereco INT PRIMARY KEY AUTO_INCREMENT,
	cep CHAR(8),
	logradouro VARCHAR(45),
	numero INT,
	complemento VARCHAR(45)
);

CREATE TABLE gramadoEstadio (
	idGramadoEstadio INT PRIMARY KEY AUTO_INCREMENT,
	fornecederoGramado VARCHAR(45),
    modelo VARCHAR(45),
    minUmidade INT,
    maxUmidade INT
);

CREATE TABLE estadio (
	idEstadio INT PRIMARY KEY AUTO_INCREMENT,
	nomeEstadio VARCHAR(40),
	fkClube INT,
	fkEndereco INT, CONSTRAINT fkEnderecoEstadio FOREIGN KEY (fkEndereco) REFERENCES endereco(idEndereco),
    fkGramado INT, CONSTRAINT fkGramadoEstadio FOREIGN KEY (fkGramado) REFERENCES gramadoEstadio(idGramadoEstadio)
);

CREATE TABLE SetorEstadio (
	idSetor INT PRIMARY KEY AUTO_INCREMENT,
    nomeSetor VARCHAR(45),
    fkEstadio INT,
    CONSTRAINT fkSetorEstadio FOREIGN KEY (fkEstadio) REFERENCES estadio(idEstadio)
);

CREATE TABLE Sensor (
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(10),
    statusSensor VARCHAR(15),
    Observacoes VARCHAR(100),
    fkSetorSensor INT, CONSTRAINT fkSensorSetor FOREIGN KEY (fkSensor) REFERENCES SetorEstadio(idSetor)
);


CREATE TABLE DadosSensor (
	idCaptura INT AUTO_INCREMENT,
    dtCaptura DATE,
    valorDados FLOAT,
    fkSensor INT,
    CONSTRAINT fkDadosSensor FOREIGN KEY (fkSensor) REFERENCES Sensor(idSensor),
    CONSTRAINT pkCompostaDadosSensor PRIMARY KEY (idCaptura, fkSensor)
);
