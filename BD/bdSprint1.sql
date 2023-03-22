USE sprint1;

CREATE TABLE cliente(
	idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    email VARCHAR(100) CONSTRAINT chkEmail CHECK (email LIKE '%@%.com')
);

CREATE TABLE estadio(
	idEstadio INT PRIMARY KEY AUTO_INCREMENT,
    estadoEstadio VARCHAR (40),
    nomeEstadio VARCHAR (40),
    sistemaDrenagem VARCHAR(100),
    sistemaIrrigacao VARCHAR(100)
);

CREATE TABLE sensores (
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    tipoSensor VARCHAR(20),
    setorSensor VARCHAR(40),
    estadoAtual TINYINT CONSTRAINT chkEstadoAtual CHECK ( estadoAtual IN ( 0, 1))
);

CREATE TABLE dadosSensor (
	idCaptura INT PRIMARY KEY AUTO_INCREMENT,
    dataCaptura DATETIME DEFAULT CURRENT_TIMESTAMP,
    umidade DOUBLE,
    temperatura DOUBLE
);

desc dadosSensor;


INSERT INTO cliente(nome, email) VALUES
	('Júlo Casares', 'Juliocasares@gmail.com' ),
    ('Leila Pereira', 'leilapereira@gmail.com'),
    ('Duílio Monteiro', 'duiliomoreira@gmail.com'),
    ('Andrés Rueda', 'andresrueda@gmail.com');

SELECT * FROM cliente;

INSERT INTO estadio(estadoEstadio, nomeEstadio, sistemaDrenagem, sistemaIrrigacao)VALUES 
	('São Paulo','Cicero Pompeu De Toledo - Morumbi ','Cano','irrigmatic'),
	('São Paulo','Allianz Parque - Parque Antártica','Colchões','regatec'),
	('São Paulo','Neo Quimica Arena - Arena Corinthians ','Colchões','acquacontroll'),
	('São Paulo','Vila Belmiro','Cano','hidrosistemas');
    
SELECT * FROM estadio; 

INSERT INTO sensores(tipoSensor, setorSensor, estadoAtual) VALUES
    ('LB35','Norte',1),
    ('DHT11','Sul',1),
    ('LB35','Leste',0),
    ('DHT11','Oeste',1);
    
    SELECT * FROM sensores;
    
INSERT INTO dadosSensor (dataCaptura, umidade, temperatura) VALUES
	-- ('2023-03-12 09:00:10', 22.09, 24),
    -- ('2023-03-12', 12, 30),
    ('2023-01-10 19:00:00', 20.09, 11),
    ('2023-01-22', 10, 11),
    ('2023-02-27', 19, 22);
    
SELECT * FROM dadosSensor;

SELECT nomeEstadio FROM estadio WHERE idEstadio IN (1, 2);

SELECT * FROM sensores WHERE tipoSensor = 'LB35';

SELECT * FROM cliente WHERE nome LIKE 'J%';

SELECT nomeEstadio AS Estadios FROM estadio;