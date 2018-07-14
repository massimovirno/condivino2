 $(document).ready(function(){
$('.riepilogo_evento').on("click",function(){
    var evento=$(this).attr('value');
    var indietro=$(this).attr('name'); //se vero appare il tasto indietro
    $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'riepilogo_evento', ricerca:indietro, num_evento:evento},
            success:smista
        });
    });
    
$('.indietro').on("click",function(){
    $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            success:indietro_admin
        });
    });

$('#amm_eventi').on("click",function(){
    $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'amministra_eventi', ordinamento:'num_evento'},
            success:amm_eventi
        });
    });
    
$('#amm_utenti').on("click",function(){
    $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'amministra_utenti', ordinamento:'username'},
            success:amm_utenti
        });
    });

$('#cerca').on("click",function(){
    $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'cerca'},
            success:ricerca
        });
    });

$('#offri').on("click",function(){
    $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'inserimento', dati:'false'},
            success:smista
        });
    });
  
$('.visualizza').on("click",function(){
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'registrazione', task:'visualizza_profilo'},
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

$('.gestisci_eventi_personali').on("click",function(){
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'registrazione', task:'gestisci_eventi'},
            success:smista
        });    
    });
    
// Funzione per il controllo abilitazione dei cookie    
if (!navigator.cookieEnabled) {
    alert("I cookie non sono abilitati.");
}

});

function smista(data){
    $('#pagina_parziale').html(data).show('slow');
    $('#ricerca_utenti').hide();
    $('#ricerca_eventi').hide();
    $('#form_vino').hide();
}

function amm_utenti(data){
    $('#pagina_parziale').hide('slow');
    $('#ricerca_eventi').hide('slow');
    $('#ricerca_utenti').html(data).show('slow');
    $('.mostra_avanzata').hide();
    $('.nascondi_avanzata').show();
    $('.mostra_ricerca').hide();
    $('#form_vino').hide();
}

function amm_eventi(data){
    $('#pagina_parziale').hide('slow');
    $('#ricerca_utenti').hide('slow');
    $('#ricerca_eventi').html(data).show('slow');
    $('.mostra_avanzata').hide();
    $('.nascondi_avanzata').show();
    $('.mostra_ricerca').hide();
    $('#form_vino').hide();
}

function indietro_admin(){
    $('#ricerca_eventi').show('slow');
    $('#form_vino').hide();
    $('#ricerca_utenti').hide();
    $('#pagina_parziale').hide('slow');
    $('.mostra_avanzata').show('slow');
    $('.nascondi_avanzata').hide('slow');
    $('.mostra_ricerca').show('slow');
}

function ricerca(data){
    $('#pagina_parziale').hide();
    $('#ricerca_utenti').hide();
    $('#ricerca').hide();
    $('.mostra_ricerca').show('slow');
    $('#ricerca_eventi').html(data).show('slow');
    $('#form_vino').hide();
}