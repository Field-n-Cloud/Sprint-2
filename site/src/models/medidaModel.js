var database = require("../database/config");

function buscarUltimasMedidasSetores(idEstadio) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `
        SELECT valorCaptura as umidade,
        dtCaptura,
        TIME_FORMAT(dtCaptura, '%T') as momento_grafico, 
        idSetor,
        max,
        min
        FROM dadosSensor 
            JOIN Sensor ON fkSensor = idSensor 
            JOIN SetorEstadio ON fkSetor = idSetor
            JOIN Estadio ON fkEstadio = idEstadio
            JOIN modeloGramado ON idModeloGramado = fkModeloGramado
            JOIN parametro ON idParametro = fkParametro
                WHERE idEstadio = ${idEstadio} ORDER BY dtCaptura DESC LIMIT 12;
        `; 
        

    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarUltimasMedidas1(idEstadio, limite_linhas) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {

        instrucaoSql = `
        SELECT valorCaptura as umidade,
            dtCaptura,
            TIME_FORMAT(dtCaptura, '%T') as momento_grafico, idSetor,
         parametro.max,
         parametro.min
            FROM dadosSensor JOIN
            Sensor ON fkSensor = idSensor 
            JOIN SetorEstadio ON fkSetor = idSetor
            JOIN Estadio ON fkEstadio = idEstadio
            JOIN modeloGramado ON idModeloGramado = fkModeloGramado
            JOIN parametro ON idParametro = fkParametro
                WHERE idEstadio = ${idEstadio} AND idSetor = 1 LIMIT 12;
        `; 
        

    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarUltimasMedidas2(idEstadio, limite_linhas) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {

        instrucaoSql = `
        SELECT valorCaptura as umidade,
            dtCaptura,
            TIME_FORMAT(dtCaptura, '%T') as momento_grafico, idSetor,
         parametro.max,
         parametro.min
            FROM dadosSensor JOIN
            Sensor ON fkSensor = idSensor 
            JOIN SetorEstadio ON fkSetor = idSetor
            JOIN Estadio ON fkEstadio = idEstadio
            JOIN modeloGramado ON idModeloGramado = fkModeloGramado
            JOIN parametro ON idParametro = fkParametro
                WHERE idEstadio = ${idEstadio} AND idSetor = 2
                    LIMIT ${limite_linhas};
        `; 
        

    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


function buscarUltimasMedidas3(idEstadio, limite_linhas) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {

        instrucaoSql = `
        SELECT valorCaptura as umidade,
            dtCaptura,
            TIME_FORMAT(dtCaptura, '%T') as momento_grafico, idSetor,
         parametro.max,
         parametro.min
            FROM dadosSensor JOIN
            Sensor ON fkSensor = idSensor 
            JOIN SetorEstadio ON fkSetor = idSetor
            JOIN Estadio ON fkEstadio = idEstadio
            JOIN modeloGramado ON idModeloGramado = fkModeloGramado
            JOIN parametro ON idParametro = fkParametro
                WHERE idEstadio = ${idEstadio} AND idSetor = 3;
        `; 
        

    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}
function buscarUltimasMedidas4(idEstadio, limite_linhas) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {

        instrucaoSql = `
        SELECT valorCaptura as umidade,
            dtCaptura,
            TIME_FORMAT(dtCaptura, '%T') as momento_grafico, idSetor,
         parametro.max,
         parametro.min
            FROM dadosSensor JOIN
            Sensor ON fkSensor = idSensor 
            JOIN SetorEstadio ON fkSetor = idSetor
            JOIN Estadio ON fkEstadio = idEstadio
            JOIN modeloGramado ON idModeloGramado = fkModeloGramado
            JOIN parametro ON idParametro = fkParametro
                WHERE idEstadio = ${idEstadio} AND idSetor = 4
                    LIMIT ${limite_linhas};
        `; 
        

    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoRealSetores(idEstadio) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        
        instrucaoSql = `
        SELECT valorCaptura as umidade,
                        dtCaptura, idSetor,
                        TIME_FORMAT(dtCaptura, '%T') as momento_grafico,
            parametro.max,
            parametro.min
                        FROM dadosSensor JOIN
            Sensor ON fkSensor = idSensor 
            JOIN SetorEstadio ON fkSetor= idSetor
            JOIN Estadio ON fkEstadio = idEstadio
            JOIN modeloGramado ON idModeloGramado = fkModeloGramado
            JOIN parametro ON idParametro = fkParametro
                WHERE idEstadio = ${idEstadio}
                    ORDER BY dtCaptura DESC LIMIT 4;
        `;

    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal1(idEstadio) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        
        instrucaoSql = `
        SELECT valorCaptura as umidade,
                        dtCaptura, idSetor,
                        TIME_FORMAT(dtCaptura, '%T') as momento_grafico,
            parametro.max,
            parametro.min
                        FROM dadosSensor JOIN
            Sensor ON fkSensor = idSensor 
            JOIN SetorEstadio ON fkSetor = idSetor
            JOIN Estadio ON fkEstadio = idEstadio
            JOIN modeloGramado ON idModeloGramado = fkModeloGramado
            JOIN parametro ON idParametro = fkParametro
                WHERE idEstadio = ${idEstadio} AND idSetor = 1
                    ORDER BY idCaptura desc LIMIT 1;
        `;

    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal2(idEstadio) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        
        instrucaoSql = `
        SELECT valorCaptura as umidade,
                        dtCaptura, idSetor,
                        TIME_FORMAT(dtCaptura, '%T') as momento_grafico,
            parametro.max,
            parametro.min
                        FROM dadosSensor JOIN
            Sensor ON fkSensor = idSensor 
            JOIN SetorEstadio ON fkSetor= idSetor
            JOIN Estadio ON fkEstadio = idEstadio
            JOIN modeloGramado ON idModeloGramado = fkModeloGramado
            JOIN parametro ON idParametro = fkParametro
                WHERE idEstadio = ${idEstadio} AND idSetor = 2
                    ORDER BY idCaptura desc LIMIT 1;
        `;

    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal3(idEstadio) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        
        instrucaoSql = `
        SELECT valorCaptura as umidade,
                        dtCaptura, idSetor,
                        TIME_FORMAT(dtCaptura, '%T') as momento_grafico,
            parametro.max,
            parametro.min
            FROM dadosSensor JOIN
            Sensor ON fkSensor = idSensor 
            JOIN SetorEstadio ON fkSetor= idSetor
            JOIN Estadio ON fkEstadio = idEstadio
            JOIN modeloGramado ON idModeloGramado = fkModeloGramado
            JOIN parametro ON idParametro = fkParametro
                WHERE idEstadio = ${idEstadio} AND idSetor = ${idSetor}
                    ORDER BY idCaptura desc LIMIT 1;
        `;

    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal4(idEstadio) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {

        instrucaoSql = `
        SELECT valorCaptura as umidade,
                        dtCaptura, idSetor,
                        TIME_FORMAT(dtCaptura, '%T') as momento_grafico,
            parametro.max,
            parametro.min
                        FROM dadosSensor JOIN
            Sensor ON fkSensor = idSensor 
            JOIN SetorEstadio ON fkSetor= idSetor
            JOIN Estadio ON fkEstadio = idEstadio
                WHERE idEstadio = ${idEstadio} AND idSetor = 4
                    ORDER BY idCaptura desc LIMIT 1;
        `;

    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasMedidas1,
    buscarUltimasMedidas2,
    buscarUltimasMedidas3,
    buscarUltimasMedidas4,
    buscarUltimasMedidasSetores,
    buscarMedidasEmTempoReal1,
    buscarMedidasEmTempoReal2,
    buscarMedidasEmTempoReal3,
    buscarMedidasEmTempoReal4,
    buscarMedidasEmTempoRealSetores
}
