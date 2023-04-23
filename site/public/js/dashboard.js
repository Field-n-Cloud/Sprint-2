function dashboard(){
    grafico_norte_leste.style = "display: none;"
    grafico_norte_oeste.style = "display: none;"
    grafico_sul_leste.style = "display: none;"
    grafico_sul_oeste.style = "display: none;"
    grafico_geral.style= "display: block;"
    grafico_historico.style= "display: block;"
    
    titulo_umidade.innerHTML = "Umidade do gramado"
    card_umidade.style = "background-color: #28AD44";
    dados_umidade.innerHTML = "33%"
}

function norte_leste(){
    grafico_norte_leste.style = "display: block;"
    grafico_norte_oeste.style = "display: none;"
    grafico_sul_leste.style = "display: none;"
    grafico_sul_oeste.style = "display: none;"
    grafico_geral.style= "display: none;"
    grafico_historico.style= "display: none;"

    card_umidade.style = "background-color: #c2a70c";
    dados_umidade.innerHTML = "32,5%";
    titulo_umidade.innerHTML = "Umidade do setor Norte-Leste"
}

function norte_oeste(){
    grafico_norte_leste.style = "display: none;"
    grafico_norte_oeste.style = "display: block;"
    grafico_sul_leste.style = "display: none;"
    grafico_sul_oeste.style = "display: none;"
    grafico_geral.style= "display: none;"
    grafico_historico.style= "display: none;"

    card_umidade.style = "background-color: #28AD44";
    dados_umidade.innerHTML = "33%"
    titulo_umidade.innerHTML = "Umidade do setor Norte-Oeste"
}

function sul_leste(){
    grafico_norte_leste.style = "display: none;"
    grafico_norte_oeste.style = "display: none;"
    grafico_sul_leste.style = "display: block;"
    grafico_sul_oeste.style = "display: none;"
    grafico_geral.style= "display: none;"
    grafico_historico.style= "display: none;"

    card_umidade.style = "background-color: #c2a70c";
    dados_umidade.innerHTML = "49%";
    titulo_umidade.innerHTML = "Umidade do setor Sul-Leste"
}

function sul_oeste(){
    grafico_norte_leste.style = "display: none;"
    grafico_norte_oeste.style = "display: none;"
    grafico_sul_leste.style = "display: none;"
    grafico_sul_oeste.style = "display: block;"
    grafico_geral.style= "display: none;"
    grafico_historico.style= "display: none;"

    card_umidade.style = "background-color: #28AD44";
    dados_umidade.innerHTML = "33%"
    titulo_umidade.innerHTML = "Umidade do setor Sul-Oeste"
}