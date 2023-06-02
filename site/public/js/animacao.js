function expandir(){
    var sidebar = document.getElementById('sidebar');
    var menu = document.getElementById('menu');
    var menuInativo = document.getElementById('menu-desativado');

    if(sidebar.classList.length > 1){
        sidebar.classList.replace('inative', 'active');
    }else{
        sidebar.classList.add('active')
    }


        var labels = document.querySelectorAll(`.conteudo`)
        labels.forEach(label=> {label.classList.add('item-ativo')});
    

    if(menu.classList[1] == 'ativada'){
        menu.classList.replace('ativada', 'desativada');
        menuInativo.classList.replace('desativada', 'ativada')
    }


    console.log('console do menu na func minimizar:'+ menu.classList[1]);
    console.log('console do menuInativo na func minimizar:'+ menuInativo.classList[1]);
}

function minimizar(){
    var sidebar = document.getElementById('sidebar');
    var menu = document.getElementById('menu');
    var menuInativo = document.getElementById('menu-desativado');


    if(sidebar.classList[1] == 'active'){
        sidebar.classList.replace('active', 'inative');
    }

    if(menuInativo.classList[1] == 'ativada'){
        menuInativo.classList.replace('ativada', 'desativada');
        menu.classList.replace('desativada', 'ativada')
    }

        var labels = document.querySelectorAll(`.conteudo`)
        labels.forEach(label=> {label.classList.remove('item-ativo')});


    console.log('console do menu na func minimizar:'+ menu.classList[1]);
    console.log('console do menuInativo na func minimizar:'+ menuInativo.classList[1]);
}

function movimentar(){
    var menuAtivo = document.getElementById('menu')

    if(menuAtivo.classList[1] == 'ativada'){
        expandir();
    }else{
        minimizar();
    }
}