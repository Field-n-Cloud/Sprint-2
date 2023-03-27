USE sprint2;

CREATE TABLE cliente(
	idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    cnpj CHAR(14),
    telefone VARCHAR(11)
    email VARCHAR(60) CONSTRAINT chkEmail CHECK (email LIKE '%@%.com'),
    senha VARCHAR(20)
);

CREATE TABLE estadio(
	idEstadio INT PRIMARY KEY AUTO_INCREMENT,
    estadoEstadio CHAR (2),
    nomeEstadio VARCHAR (40),
    sistemaIrrigacao VARCHAR (60),
    fkIdCliente INT, CONSTRAINT fkIdClient FOREIGN KEY (fkIdCliente) REFERENCES cliente (idCliente)
);

CREATE TABLE sensores (
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    tipoSensor VARCHAR(20),
    setorSensor VARCHAR(10),
    estadoAtual TINYINT CONSTRAINT chkEstadoAtual CHECK ( estadoAtual IN ( 0, 1)),
    fkIdEstadio INT, CONSTRAINT fkIdStadium FOREIGN KEY (fkIdEstadio) REFERENCES estadio (idEstadio)
);

CREATE TABLE dadosSensor (
	idCaptura INT PRIMARY KEY AUTO_INCREMENT,
    dataCaptura DATETIME,
    umidade FLOAT,
    temperatura FLOAT,
    fkIdSensor INT, CONSTRAINT fkIdSens FOREIGN KEY (fkIdSensor) REFERENCES sensores (idSensor)
);

INSERT INTO cliente(nome, email) VALUES
	('Júlo Casares', 'Juliocasares@gmail.com', '2134julio' ),
    ('Leila Pereira', 'leilapereira@gmail.com', 'leila123'),
    ('Duílio Monteiro', 'duiliomoreira@gmail.com', '$corinthians'),
    ('Andrés Rueda', 'andresrueda@gmail.com', 'pelesantos123');

SELECT * FROM cliente;

INSERT INTO estadio(estadoEstadio, nomeEstadio, sistemaIrrigacao, fkIdCliente)VALUES 
	('São Paulo','Cicero Pompeu De Toledo - Morumbi ','irrigmatic',1),
	('São Paulo','Allianz Parque - Parque Antártica','regatec',2),
	('São Paulo','Neo Quimica Arena - Arena Corinthians ','acquacontroll',3),
	('São Paulo','Vila Belmiro','hidrosistemas',4);
    
SELECT * FROM estadio; 

INSERT INTO sensores(tipoSensor, setorSensor, estadoAtual, fkIdEstadio) VALUES
    ('LB35','Norte',1, 1),
    ('DHT11','Sul',1, 2),
    ('LB35','Leste',0, 3),
    ('DHT11','Oeste',1, 4);
    
    SELECT * FROM sensores;
    
INSERT INTO dadosSensor (dataCaptura, umidade, temperatura, fkidSensor) VALUES
	('2023-03-12 09:00:10', 22.09, 24, 1),
    ('2023-03-12 20:10:00', 12, 30, 1),
    ('2023-01-10 00:30:00', 20.09, 11, 2),
    ('2023-01-22 19:00:10', 10, 11, 2),
    ('2023-02-27 23:17:34', 19, 22, 2);
    
SELECT * FROM dadosSensor;
-- SELECTS DIFERENTES --


SELECT nomeEstadio FROM estadio WHERE idEstadio IN (1, 2);

SELECT * FROM sensores WHERE tipoSensor = 'LB35';

SELECT * FROM cliente WHERE nome LIKE 'J%';

SELECT nomeEstadio AS Estadios FROM estadio;
