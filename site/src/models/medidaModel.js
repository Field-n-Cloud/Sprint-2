var database = require("../database/config");

function buscarUltimasMedidasSetores(idEstadio) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        // instrucaoSql = `select top ${limite_linhas}
        // dht11_temperatura as temperatura, 
        // dht11_umidade as umidade,  
        //                 dtCaptura,
        //                 TIME_FORMAT(dtCaptura, '%T') as momento_grafico
        //             from medida
        //             where fk_aquario = ${idAquario}
        //             order by id desc`;
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        // instrucaoSql = `select 
        // dht11_temperatura as temperatura, 
        // dht11_umidade as umidade,
        //                 momento,
        //                 DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico
        //             from medida
        //             where fk_aquario = ${idAquario}
        //             order by id desc limit ${limite_linhas}`;

        instrucaoSql = `
        SELECT valorCaptura as umidade,
        dtCaptura,
        TIME_FORMAT(dtCaptura, '%T') as momento_grafico, idSetor
     FROM dadosSensor JOIN
        Sensor ON fkSensor = idSensor 
        JOIN SetorEstadio ON fkSetor = idSetor
        JOIN Estadio ON fkEstadio = idEstadio
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
        // instrucaoSql = `select top ${limite_linhas}
        // dht11_temperatura as temperatura, 
        // dht11_umidade as umidade,  
        //                 dtCaptura,
        //                 TIME_FORMAT(dtCaptura, '%T') as momento_grafico
        //             from medida
        //             where fk_aquario = ${idAquario}
        //             order by id desc`;
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        // instrucaoSql = `select 
        // dht11_temperatura as temperatura, 
        // dht11_umidade as umidade,
        //                 momento,
        //                 DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico
        //             from medida
        //             where fk_aquario = ${idAquario}
        //             order by id desc limit ${limite_linhas}`;

        instrucaoSql = `
        SELECT valorCaptura as umidade,
            dtCaptura,
            TIME_FORMAT(dtCaptura, '%T') as momento_grafico, idSetor
         FROM dadosSensor JOIN
            Sensor ON fkSensor = idSensor 
            JOIN SetorEstadio ON fkSetor = idSetor
            JOIN Estadio ON fkEstadio = idEstadio
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
        // instrucaoSql = `select top ${limite_linhas}
        // dht11_temperatura as temperatura, 
        // dht11_umidade as umidade,  
        //                 dtCaptura,
        //                 TIME_FORMAT(dtCaptura, '%T') as momento_grafico
        //             from medida
        //             where fk_aquario = ${idAquario}
        //             order by id desc`;
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        // instrucaoSql = `select 
        // dht11_temperatura as temperatura, 
        // dht11_umidade as umidade,
        //                 momento,
        //                 DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico
        //             from medida
        //             where fk_aquario = ${idAquario}
        //             order by id desc limit ${limite_linhas}`;

        instrucaoSql = `
        SELECT valorCaptura as umidade,
            dtCaptura,
            TIME_FORMAT(dtCaptura, '%T') as momento_grafico, idSetor
         FROM dadosSensor JOIN
            Sensor ON fkSensor = idSensor 
            JOIN SetorEstadio ON fkSetor = idSetor
            JOIN Estadio ON fkEstadio = idEstadio
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
        // instrucaoSql = `select top ${limite_linhas}
        // dht11_temperatura as temperatura, 
        // dht11_umidade as umidade,  
        //                 dtCaptura,
        //                 TIME_FORMAT(dtCaptura, '%T') as momento_grafico
        //             from medida
        //             where fk_aquario = ${idAquario}
        //             order by id desc`;
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        // instrucaoSql = `select 
        // dht11_temperatura as temperatura, 
        // dht11_umidade as umidade,
        //                 momento,
        //                 DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico
        //             from medida
        //             where fk_aquario = ${idAquario}
        //             order by id desc limit ${limite_linhas}`;

        instrucaoSql = `
        SELECT valorCaptura as umidade,
            dtCaptura,
            TIME_FORMAT(dtCaptura, '%T') as momento_grafico, idSetor
         FROM dadosSensor JOIN
            Sensor ON fkSensor = idSensor 
            JOIN SetorEstadio ON fkSetor = idSetor
            JOIN Estadio ON fkEstadio = idEstadio
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
        // instrucaoSql = `select top ${limite_linhas}
        // dht11_temperatura as temperatura, 
        // dht11_umidade as umidade,  
        //                 dtCaptura,
        //                 TIME_FORMAT(dtCaptura, '%T') as momento_grafico
        //             from medida
        //             where fk_aquario = ${idAquario}
        //             order by id desc`;
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        // instrucaoSql = `select 
        // dht11_temperatura as temperatura, 
        // dht11_umidade as umidade,
        //                 momento,
        //                 DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico
        //             from medida
        //             where fk_aquario = ${idAquario}
        //             order by id desc limit ${limite_linhas}`;

        instrucaoSql = `
        SELECT valorCaptura as umidade,
            dtCaptura,
            TIME_FORMAT(dtCaptura, '%T') as momento_grafico, idSetor
         FROM dadosSensor JOIN
            Sensor ON fkSensor = idSensor 
            JOIN SetorEstadio ON fkSetor = idSetor
            JOIN Estadio ON fkEstadio = idEstadio
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
        // instrucaoSql = `
        // select top 1
        // dht11_temperatura as temperatura, 
        // dht11_umidade as umidade,  
        //                 CONVERT(varchar, momento, 108) as momento_grafico, 
        //                 fk_aquario 
        //                 from medida where fk_aquario = ${idEstadio} 
        //             order by id desc
        //             `;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        // instrucaoSql = `
        // select 
        // dht11_temperatura as temperatura, 
        // dht11_umidade as umidade,
        //                 DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico, 
        //                 fk_aquario 
        //                 from medida where fk_aquario = ${idEstadio} 
        //             order by id desc limit 1
        //             `;
        
        instrucaoSql = `
        SELECT valorCaptura as umidade,
                        dtCaptura, idSetor,
                        TIME_FORMAT(dtCaptura, '%T') as momento_grafico
            FROM dadosSensor JOIN
            Sensor ON fkSensor = idSensor 
            JOIN SetorEstadio ON fkSetor= idSetor
            JOIN Estadio ON fkEstadio = idEstadio
                WHERE idEstadio = ${idEstadio}
                    ORDER BY dtCaptura DESC LIMIT 4;
        `;

        // instrucaoSql = `
        // SELECT valorCaptura as umidade,
        //         dtCaptura, idSetor, nomeSetor,
        //         TIME_FORMAT(dtCaptura, '%T') as momento_grafico
        // FROM dadosSensor JOIN
        // Sensor ON fkSensor = idSensor 
        // JOIN SetorEstadio ON fkSetor= idSetor
        // JOIN Estadio ON fkEstadio = idEstadio
        // WHERE idEstadio = 1
        //     ORDER BY dtCaptura and idSetor desc;
        // `;

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
        // instrucaoSql = `
        // select top 1
        // dht11_temperatura as temperatura, 
        // dht11_umidade as umidade,  
        //                 CONVERT(varchar, momento, 108) as momento_grafico, 
        //                 fk_aquario 
        //                 from medida where fk_aquario = ${idEstadio} 
        //             order by id desc
        //             `;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        // instrucaoSql = `
        // select 
        // dht11_temperatura as temperatura, 
        // dht11_umidade as umidade,
        //                 DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico, 
        //                 fk_aquario 
        //                 from medida where fk_aquario = ${idEstadio} 
        //             order by id desc limit 1
        //             `;
        
        instrucaoSql = `
        SELECT valorCaptura as umidade,
                        dtCaptura, idSetor,
                        TIME_FORMAT(dtCaptura, '%T') as momento_grafico
            FROM dadosSensor JOIN
            Sensor ON fkSensor = idSensor 
            JOIN SetorEstadio ON fkSetor= idSetor
            JOIN Estadio ON fkEstadio = idEstadio
                WHERE idEstadio = ${idEstadio} AND idSetor = 1
                    ORDER BY idCaptura desc LIMIT 1;
        `;

        // instrucaoSql = `
        // SELECT valorCaptura as umidade,
        //         dtCaptura, idSetor, nomeSetor,
        //         TIME_FORMAT(dtCaptura, '%T') as momento_grafico
        // FROM dadosSensor JOIN
        // Sensor ON fkSensor = idSensor 
        // JOIN SetorEstadio ON fkSetor= idSetor
        // JOIN Estadio ON fkEstadio = idEstadio
        // WHERE idEstadio = 1
        //     ORDER BY dtCaptura and idSetor desc;
        // `;

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
        // instrucaoSql = `
        // select top 1
        // dht11_temperatura as temperatura, 
        // dht11_umidade as umidade,  
        //                 CONVERT(varchar, momento, 108) as momento_grafico, 
        //                 fk_aquario 
        //                 from medida where fk_aquario = ${idEstadio} 
        //             order by id desc
        //             `;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        // instrucaoSql = `
        // select 
        // dht11_temperatura as temperatura, 
        // dht11_umidade as umidade,
        //                 DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico, 
        //                 fk_aquario 
        //                 from medida where fk_aquario = ${idEstadio} 
        //             order by id desc limit 1
        //             `;
        
        instrucaoSql = `
        SELECT valorCaptura as umidade,
                        dtCaptura, idSetor,
                        TIME_FORMAT(dtCaptura, '%T') as momento_grafico
            FROM dadosSensor JOIN
            Sensor ON fkSensor = idSensor 
            JOIN SetorEstadio ON fkSetor= idSetor
            JOIN Estadio ON fkEstadio = idEstadio
                WHERE idEstadio = ${idEstadio} AND idSetor = 2
                    ORDER BY idCaptura desc LIMIT 1;
        `;

        // instrucaoSql = `
        // SELECT valorCaptura as umidade,
        //         dtCaptura, idSetor, nomeSetor,
        //         TIME_FORMAT(dtCaptura, '%T') as momento_grafico
        // FROM dadosSensor JOIN
        // Sensor ON fkSensor = idSensor 
        // JOIN SetorEstadio ON fkSetor= idSetor
        // JOIN Estadio ON fkEstadio = idEstadio
        // WHERE idEstadio = 1
        //     ORDER BY dtCaptura and idSetor desc;
        // `;

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
        // instrucaoSql = `
        // select top 1
        // dht11_temperatura as temperatura, 
        // dht11_umidade as umidade,  
        //                 CONVERT(varchar, momento, 108) as momento_grafico, 
        //                 fk_aquario 
        //                 from medida where fk_aquario = ${idEstadio} 
        //             order by id desc
        //             `;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        // instrucaoSql = `
        // select 
        // dht11_temperatura as temperatura, 
        // dht11_umidade as umidade,
        //                 DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico, 
        //                 fk_aquario 
        //                 from medida where fk_aquario = 3
        //             order by id desc limit 1
        //             `;
        
        instrucaoSql = `
        SELECT valorCaptura as umidade,
                        dtCaptura, idSetor,
                        TIME_FORMAT(dtCaptura, '%T') as momento_grafico
            FROM dadosSensor JOIN
            Sensor ON fkSensor = idSensor 
            JOIN SetorEstadio ON fkSetor= idSetor
            JOIN Estadio ON fkEstadio = idEstadio
                WHERE idEstadio = ${idEstadio} AND idSetor = ${idSetor}
                    ORDER BY idCaptura desc LIMIT 1;
        `;

        // instrucaoSql = `
        // SELECT valorCaptura as umidade,
        //         dtCaptura, idSetor, nomeSetor,
        //         TIME_FORMAT(dtCaptura, '%T') as momento_grafico
        // FROM dadosSensor JOIN
        // Sensor ON fkSensor = idSensor 
        // JOIN SetorEstadio ON fkSetor= idSetor
        // JOIN Estadio ON fkEstadio = idEstadio
        // WHERE idEstadio = 1
        //     ORDER BY dtCaptura and idSetor desc;
        // `;

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
        // instrucaoSql = `
        // select top 1
        // dht11_temperatura as temperatura, 
        // dht11_umidade as umidade,  
        //                 CONVERT(varchar, momento, 108) as momento_grafico, 
        //                 fk_aquario 
        //                 from medida where fk_aquario = ${idEstadio} 
        //             order by id desc
        //             `;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        // instrucaoSql = `
        // select 
        // dht11_temperatura as temperatura, 
        // dht11_umidade as umidade,
        //                 DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico, 
        //                 fk_aquario 
        //                 from medida where fk_aquario = ${idEstadio} 
        //             order by id desc limit 1
        //             `;
        
        instrucaoSql = `
        SELECT valorCaptura as umidade,
                        dtCaptura, idSetor,
                        TIME_FORMAT(dtCaptura, '%T') as momento_grafico
            FROM dadosSensor JOIN
            Sensor ON fkSensor = idSensor 
            JOIN SetorEstadio ON fkSetor= idSetor
            JOIN Estadio ON fkEstadio = idEstadio
                WHERE idEstadio = ${idEstadio} AND idSetor = 4
                    ORDER BY idCaptura desc LIMIT 1;
        `;

        // instrucaoSql = `
        // SELECT valorCaptura as umidade,
        //         dtCaptura, idSetor, nomeSetor,
        //         TIME_FORMAT(dtCaptura, '%T') as momento_grafico
        // FROM dadosSensor JOIN
        // Sensor ON fkSensor = idSensor 
        // JOIN SetorEstadio ON fkSetor= idSetor
        // JOIN Estadio ON fkEstadio = idEstadio
        // WHERE idEstadio = 1
        //     ORDER BY dtCaptura and idSetor desc;
        // `;

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
