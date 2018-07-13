$(document).ready(function(){
$('#submit_aggiungi_da_inserisci').on("click",function(){
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'aggiungi_veicolo', da:'inserisci', targa:$('#targa').val(), tipo:$('#tipo').val(), num_posti:$('#num_posti').val(), carburante:$('#carburante').val(), consumo_medio:$('#consumo_medio').val()}, 
            success:veicolo_aggiunto
        });    
    });

$('#submit_aggiungi_da_profilo').on("click",function(){
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'aggiungi_veicolo', da:'profilo', targa:$('#targa').val(), tipo:$('#tipo').val(), num_posti:$('#num_posti').val(), carburante:$('#carburante').val(), consumo_medio:$('#consumo_medio').val()}, 
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

$('.elimina_veicolo').on("click",function(){
    var targa_veicolo=$(this).attr('name');
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'elimina_veicolo', targa:targa_veicolo},
            success:smista
        });    
    });

$("#veicolo").validate(
    {   // Regole di validazione
        rules:
        {
            targa: 
            {   
                required: true,
                maxlength: 10,
                minlength:2
            }
        },
        messages:
        {
            targa: 
            {
                    required: " Inserisci la targa!",
                    maxlength: " La lunghezza massima è 10"
            }
        }
});

$('.nascosto').on('mouseover', function () {
        if($('#veicolo').valid()){
            document.getElementById("submit_aggiungi_da_inserisci").disabled=false;
        }
    });    

$('#targa').on('focusout', function(){
        $.ajax({
           url:'index.php',
           data: {controller:'ricerca', task:'verifica_targa', targa:$('#targa').val()},
           type: 'GET',
           dataType: 'json',
           success: check_esiste
        });
    return true;
    });
});

function check_esiste(data) {
    if(data.unique === true){
        // Targa Libera
        $('#errore_targa').hide('normal');
        targa_libera=true;
        $('#targa').removeClass('error');
    }
    else
    {   // Targa utilizzata
        $('#errore_targa').show('normal');
        $('#targa').addClass('error');
        targa_libera=false;
    }
}

function veicolo_aggiunto(data){
    $('#form_veicolo').hide('slow');
    $('#menu_veicoli').html(data).show('slow');
    $('#pagina_parziale').show('slow');
}

function smista(data){
    $('#pagina_parziale').html(data).show('slow');
    $('#ricerca_utenti').hide();
    $('#ricerca_viaggi').hide();
    $('#form_veicolo').hide();
}