CREATE DATABASE safelawn;
DROP DATABASE safelawn;
USE safelawn;

CREATE TABLE  tipoUsuario (
	idTipoUsuario INT PRIMARY KEY AUTO_INCREMENT,
	tipoUsuario VARCHAR(45)
);

INSERT INTO tipoUsuario (tipoUsuario) VALUES 
	('Administrador'), 
    ('Funcionario');
    
CREATE TABLE estado (
	idEstado INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    uf CHAR(2)
);

INSERT INTO estado VALUES 
	(NULL, 'Acre', 'AC'),
	(NULL, 'Alagoas', 'AL'),
	(NULL, 'Amazonas', 'AM'),
	(NULL, 'Amapá', 'AP'),
	(NULL, 'Bahia', 'BA'),
	(NULL, 'Ceará', 'CE'),
	(NULL, 'Distrito Federal', 'DF'),
	(NULL, 'Espírito Santo', 'ES'),
	(NULL, 'Goiás', 'GO'),
	(NULL, 'Maranhão', 'MA'),
	(NULL, 'Mato Grosso', 'MG'),
	(NULL, 'Mato Grosso do Sul', 'MS'),
	(NULL, 'Minas Gerais', 'MG'),
	(NULL, 'Pará', 'PA'),
	(NULL, 'Paraíba', 'PB'),
	(NULL, 'Paraná', 'PR'),
	(NULL, 'Pernambuco', 'PE'),
	(NULL, 'Piauí', 'PI'),
	(NULL, 'Rio de Janeiro', 'RJ'),
	(NULL, 'Rio Grande do Norte', 'RN'),
	(NULL, 'Rio Grande do Sul', 'RS'),
	(NULL, 'Rondônia', 'RO'),
	(NULL, 'Roraima', 'RR'),
	(NULL, 'Santa Catarina', 'SC'),
	(NULL, 'São Paulo', 'SP'),
	(NULL, 'Sergipe', 'SE'),
	(NULL, 'Tocantins', 'TO');
    
CREATE TABLE clube (
	idClube INT PRIMARY KEY AUTO_INCREMENT,
	nomeClube VARCHAR(45),
	cnpjClube CHAR(14) UNIQUE,
    senhaClube VARCHAR(10),
	emailClube VARCHAR(45),
    telefoneClube CHAR(11),
    fkTipoUsuario INT,
	fkEstado INT,
    CONSTRAINT fkTipoClube FOREIGN KEY (fkTipoUsuario) REFERENCES tipoUsuario (idTipoUsuario),
    CONSTRAINT fkEstadoClube FOREIGN KEY (fkEstado) REFERENCES estado(idEstado)
);

/*INSERT INTO clube (nomeClube, cnpjClube, senhaClube, emailClube, telefoneClube, fkTipoUsuario, fkEstado) VALUES
	('São Paulo ', '12345678901234', 'spfc123', 'saopaulo@spfc1.com.br', '11999999999', 1, 1),
	('Flamengo', '23456789012345', 'mengo456', 'flamengo@crf2.com.br', '21999999999', 1, 2),
	('Atlético Mineiro', '34567890123456', 'galo789', 'atletico@galo3.com.br', '31999999998', 1, 3);*/
    
CREATE TABLE usuario (
	idUsuario INT AUTO_INCREMENT,
	nomeUsuario VARCHAR(45),
	emailUsuario VARCHAR(45),
	senhaUsuario VARCHAR(20),
	telefoneUsuario CHAR(11),
	fkClube INT, 
    fkTipoUsuario INT,
    FOREIGN KEY (fkClube) REFERENCES clube(idClube),
	PRIMARY KEY (idUsuario, fkClube),
    FOREIGN KEY (fkTipoUsuario) REFERENCES tipoUsuario(idTipoUsuario)
);

/*INSERT INTO usuario (nomeUsuario, emailUsuario, senhaUsuario, telefoneUsuario, fkClube, fkTipoUsuario) VALUES
	('João Alvares', 'joao.alvares@spfc1.com.br', '123456', '11988888888', 1, 1),
	('Pedro Roberto', 'pedro.roberto@crf2.com.br', '123456', '21977777777', 2, 2),
	('Felipe Silve', 'felipe.silva@galo3.com.br', '123456', '31966666666', 3, 2);*/

CREATE TABLE fornecedorGramado (
idFornecedorGramado INT PRIMARY KEY AUTO_INCREMENT,
nomeFornecedor VARCHAR(45) UNIQUE,
telefoneFornecedor VARCHAR(45),
emailFornecedor VARCHAR(45)
);

/*INSERT INTO fornecedorGramado (nomeFornecedor, telefoneFornecedor, emailFornecedor) VALUES
	('Fornecedor A', '11987654321', 'contato@fornecedora.com.br'),
	('Fornecedor B', '21987654321', 'contato@fornecedorb.com.br'),
	('Fornecedor C', '31987654321', 'contato@fornecedorc.com.br');*/

CREATE TABLE parametro (
	idParametro INT PRIMARY KEY AUTO_INCREMENT,
    min FLOAT,
    max FLOAT
);

INSERT INTO parametro VALUES 
	(NULL, 20.90, 35.40);

CREATE TABLE pisoGramado (
	idPiso INT PRIMARY KEY AUTO_INCREMENT,
    material VARCHAR(45)
);

INSERT INTO pisoGramado VALUES 
	(NULL, 'cimento'),
	(NULL, 'areia'),
	(NULL, 'cascalho');

CREATE TABLE modeloGramado (
	idmodeloGramado INT PRIMARY KEY AUTO_INCREMENT,
    nomeModelo VARCHAR(45),
    fkFornecedorGramado INT,
    fkPisoGramado INT,
    fkParametro INT,
    CONSTRAINT fkFornecedorModelo FOREIGN KEY (fkFornecedorGramado) REFERENCES fornecedorGramado(idFornecedorGramado),
    CONSTRAINT fkPisoModelo FOREIGN KEY (fkPisoGramado) REFERENCES pisoGramado (idPiso),
    CONSTRAINT fkParametroModelo FOREIGN KEY (fkParametro) REFERENCES parametro(idParametro)
);
  
 INSERT INTO modeloGramado (nomeModelo, fkFornecedorGramado, fkPisoGramado, fkParametro) VALUES
	('fibrilatica 3000', 1, 1, 1),
    ('green camp',2, 2, 2),
    ('grasslide', 3, 3, 3);

CREATE TABLE estadio (
	idEstadio INT PRIMARY KEY AUTO_INCREMENT,
	nomeEstadio VARCHAR(40),
    cnpjEstadio VARCHAR (14) UNIQUE,
	fkClube INT,
    fkModeloGramado INT, 
    CONSTRAINT fkEstadioCLube FOREIGN KEY (fkClube) REFERENCES clube(idClube),
    CONSTRAINT fkEstadioModelo FOREIGN KEY (fkModeloGramado) REFERENCES modeloGramado(idmodeloGramado)
);

INSERT INTO estadio (nomeEstadio, cnpjEstadio, fkClube, fkModeloGramado) VALUES 
	('Estadio1', '12345678901234', 1, 1),
	('Estadio2', '23456789012345', 2, 2),
	('Estadio3', '34567890123456', 3, 3);

CREATE TABLE endereco (
	idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    cep CHAR(8),
	logradouro VARCHAR(45),
	numero INT,
	complemento VARCHAR(45),
    fkEstadio INT,
    CONSTRAINT fkEnderecoEstadio FOREIGN KEY (fkEstadio) REFERENCES estadio(idEstadio)
);

INSERT INTO endereco (cep, logradouro, numero, complemento, fkEstadio) VALUES
	('01234567', 'Rua A', 123, NULL, 1),
	('89012345', 'Avenida B', 456, 'Sala 1', 2),
	('65432109', 'Rua C', 789, 'Bloco D', 3);

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
    

CREATE TABLE medidaSensor (
	idMedidaSensor INT,
    fkMedida INT,
    fkModeloSensor INT,
    CONSTRAINT pkCompostaAssociativa PRIMARY KEY (idMedidaSensor, fkMedida, fkModeloSensor),
    CONSTRAINT fkMedidaSensor FOREIGN KEY (fkMedida) REFERENCES medida(idMedida),
    CONSTRAINT fkModeloMedida FOREIGN KEY (fkModeloSensor) REFERENCES modeloSensor(idModeloSensor)
);

INSERT INTO medidaSensor VALUES 
	(1, 1, 1),
	(2, 2, 1),
	(1, 1, 2);

CREATE TABLE Sensor (
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(45),
    fkSetor INT, 
    fkstatusSensor INT,
    fkmodeloSensor INT,
     FOREIGN KEY (fkSetor) REFERENCES SetorEstadio(idSetor),
    FOREIGN KEY (fkstatusSensor) REFERENCES statusSensor(idStatusSensor),
    FOREIGN KEY (fkmodeloSensor) REFERENCES modeloSensor(idModeloSensor)
);
    

CREATE TABLE DadosSensor (
	idCaptura INT AUTO_INCREMENT,
    dtCaptura DATETIME,
    valorCaptura FLOAT,
    fkSensor INT,
    fkMedida INT,
	FOREIGN KEY (fkSensor) REFERENCES Sensor(idSensor),
    PRIMARY KEY (idCaptura, fkSensor),
    FOREIGN KEY (fkMedida) REFERENCES medida(idMedida)
);

INSERT INTO DadosSensor (dtCaptura, valorCaptura, fkSensor, fkMedida) VALUES
    (NOW(), 23, 1, 1),
    (NOW(), 23, 2, 1),
    (NOW(), 23, 3, 1),
    (NOW(), 28, 4, 1);


-- BLOCO DE EXECUÇÕES 
UPDATE modeloGramado SET fkParametro = 1 WHERE idModeloGramado = 1;
INSERT INTO Sensor (descricao, fkSetor, fkstatusSensor, fkmodeloSensor) VALUES
	('Sensor 1', 1, 1, 1),
    ('Sensor 2', 2, 2, 1),
    ('Sensor 3', 3, 3, 2),
    ('Sensor 4', 4, 1, 2);

-- ATIVAR DADOS DO ARDUINO
        
        
        
-- SELECTS
SELECT * FROM estadio;
SELECT * FROM clube;
SELECT * FROM parametro;
SELECT * FROM modeloGramado;

DELIMITER $$
CREATE TRIGGER insercao_Setores_Estadio
	AFTER INSERT ON estadio
    FOR EACH ROW

/*INSERT INTO setorEstadio SET 
     nomeSetor = 'Norte-Leste',
     fkEstadio = NEW.idEstadio;*/
BEGIN
     call insere_all_setores(new.idEstadio);
END$$

DELIMITER ;


DROP TRIGGER insercao_Setores_Estadio;
     

SELECT * FROM estadio;
SELECT * FROM setorEstadio WHERE fkEstadio = 34;
INSERT INTO estadio (nomeEstadio, cnpjEstadio, fkClube, fkModeloGramado) VALUES 
	('san', '13098172346', 3, 1);
-- SUBQUERY

	INSERT INTO setorEstadio (nomeSetor, fkEstadio)VALUES 
		('Norte-Leste', NEW.idEstadio),
		('Norte-Oeste', NEW.idEstadio),
		('Sul-Leste', NEW.idEstadio),
		('Sul-Oeste', NEW.idEstadio);

INSERT INTO estadio (nomeEstadio, cnpjEstadio, fkClube)
	VALUES ('san pablo', '12345123',  (SELECT idClube FROM clube WHERE cnpjClube = '12345678901234'));
    
-- todos
SELECT * FROM clube;
SELECT * FROM tipoUsuario;
SELECT * FROM usuario;
SELECT * FROM endereco;
SELECT * FROM tipoGrama;
SELECT * FROM medida;
SELECT * FROM alturagramado;
SELECT * FROM fornecedorGramado;
SELECT * FROM modeloGramado;
SELECT * FROM estadio;
SELECT * FROM SetorEstadio;
SELECT * FROM statusSensor;
SELECT * FROM modeloSensor;
SELECT * FROM Sensor;
SELECT * FROM dadosSensor;

-- cadastro 
SELECT * FROM usuario JOIN clube ON fkClube=idClube JOIN tipoUsuario ON fkTipoUsuario=idTipousuario;
SELECT * FROM clube JOIN usuario ON fkClube=idClube WHERE fkTipoUsuario=1;
SELECT * FROM clube JOIN usuario ON fkclube=idClube WHERE idClube=1;
SELECT * FROM endereco JOIN estadio ON fkEndereco=idEndereco; 

 -- gramado
SELECT * FROM alturagramado JOIN medida ON fkMedida=idMedida;
SELECT * FROM fornecedorGramado JOIN modeloGramado ON fkFornecedorGramado=IdFornecedorGramado JOIN estadio ON fkModeloGramado=idModelogramado WHERE idestadio=2;
SELECT * FROM tipoGrama JOIN modeloGramado ON fkTipoGrama=idtipoGrama JOIN fornecedorGramado ON fkFornecedorGramado=idFornecedorGramado;
SELECT * FROM modeloGramado JOIN fornecedorGramado ON fkFornecedorGramado=idFornecedorGramado 
JOIN alturagramado ON fkAlturaGramado=idAlturaGramado JOIN medida ON fkMedida=idMedida;

-- sensor
SELECT * FROM modeloSensor JOIN Sensor ON fkmodeloSensor=idmodeloSensor JOIN DadosSensor ON fkSensor=idSensor;

-- estadio e setor
SELECT * FROM estadio JOIN SetorEstadio ON fkEstadio=idEstadio WHERE idEstadio=2;

-- estadio, setor e sensor
SELECT * FROM estadio JOIN SetorEstadio ON fkEstadio=idEstadio JOIN Sensor ON fkSetor=idSetor WHERE idEstadio=2;

-- estadio
SELECT * FROM estadio JOIN clube ON fkClube=IdClube JOIN endereco ON fkEndereco=idEndereco
JOIN modeloGramado ON fkModeloGramado=idModeloGramado;

DELIMITER $$
	CREATE PROCEDURE insere_all_setores(idEstadio INT)
	BEGIN
	INSERT INTO setorEstadio (nomeSetor, fkEstadio)VALUES 
		('Norte-Leste', idEstadio),
		('Norte-Oeste', idEstadio),
		('Sul-Leste', idEstadio),
		('Sul-Oeste', idEstadio);
    
END$$

DROP PROCEDURE insere_all_setores;
