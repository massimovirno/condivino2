$(document).ready(function(){
$('#submit_aggiungi_da_inserisci').on("click",function(){
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'aggiungi_vino', da:'inserisci', 
            nome_vino:$('#nome_vino').val(), 
            produttore:$('#produttore').val(), 
            denominazione:$('#denominazione').val(), 
            vitigno:$('#vitigno').val(), 
            anno:$('#anno').val(), 
            descrizione:$('#descrizione').val(), 
            immagine_vino:$('#immagine_vino').val()}, 
            success:vino_aggiunto
        });    
    });

$('#submit_aggiungi_da_profilo').on("click",function(){
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'aggiungi_vino', da:'profilo', 
            nome_vino:$('#nome_vino').val(), 
            tipo:$('#tipo').val(), 
            num_posti:$('#num_posti').val(), 
            carburante:$('#carburante').val(), 
            consumo_medio:$('#consumo_medio').val()}, 
            success:smista
        });    
    });

$('.gestisci').on("click",function(){
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'registrazione', task:'gestisci_profilo'},
            success:smista
        });    
    });

$('.elimina_vino').on("click",function(){
    var nome_vino_vino=$(this).attr('name');
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'elimina_vino', nome_vino:nome_vino_vino},
            success:smista
        });    
    });

$("#vino").validate(
    {   // Regole di validazione
        rules:
        {
            nome_vino: 
            {   
                required: true,
                maxlength: 20,
                minlength:2
            }
        },
        messages:
        {
            nome_vino: 
            {
                    required: " Inserisci un vino!",
                    maxlength: " La lunghezza massima è 20"
            }
        }
});

$('.nascosto').on('mouseover', function () {
        if($('#vino').valid()){
            document.getElementById("submit_aggiungi_da_inserisci").disabled=false;
        }
    });    

$('#nome_vino').on('focusout', function(){
        $.ajax({
           url:'index.php',
           data: {controller:'ricerca', task:'verifica_nome_vino', nome_vino:$('#nome_vino').val()},
           type: 'GET',
           dataType: 'json',
           success: check_esiste
        });
    return true;
    });
});

function check_esiste(data) {
    if(data.unique === true){
        // Nome vino libero
        $('#errore_nome_vino').hide('normal');
        nome_vino_libera=true;
        $('#nome_vino').removeClass('error');
    }
    else
    {   // Nome vino utilizzato
        $('#errore_nome_vino').show('normal');
        $('#nome_vino').addClass('error');
        nome_vino_libera=false;
    }
}

function vino_aggiunto(data){
    $('#form_vino').hide('slow');
    $('#menu_vini').html(data).show('slow');
    $('#pagina_parziale').show('slow');
}

function smista(data){
    $('#pagina_parziale').html(data).show('slow');
    $('#ricerca_utenti').hide();
    $('#ricerca_viaggi').hide();
    $('#form_vino').hide();
}