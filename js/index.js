 $(document).ready(function(){
$('.riepilogo_viaggio').on("click",function(){
    var viaggio=$(this).attr('value');
    var indietro=$(this).attr('name'); //se vero appare il tasto indietro
    $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'riepilogo_viaggio', ricerca:indietro, num_viaggio:viaggio},
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

$('#amm_viaggi').on("click",function(){
    $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'amministra_viaggi', ordinamento:'num_viaggio'},
            success:amm_viaggi
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

$('.gestisci_viaggi_personali').on("click",function(){
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'registrazione', task:'gestisci_viaggi'},
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
    $('#ricerca_viaggi').hide();
    $('#form_vino').hide();
}

function amm_utenti(data){
    $('#pagina_parziale').hide('slow');
    $('#ricerca_viaggi').hide('slow');
    $('#ricerca_utenti').html(data).show('slow');
    $('.mostra_avanzata').hide();
    $('.nascondi_avanzata').show();
    $('.mostra_ricerca').hide();
    $('#form_vino').hide();
}

function amm_viaggi(data){
    $('#pagina_parziale').hide('slow');
    $('#ricerca_utenti').hide('slow');
    $('#ricerca_viaggi').html(data).show('slow');
    $('.mostra_avanzata').hide();
    $('.nascondi_avanzata').show();
    $('.mostra_ricerca').hide();
    $('#form_vino').hide();
}

function indietro_admin(){
    $('#ricerca_viaggi').show('slow');
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
    $('#ricerca_viaggi').html(data).show('slow');
    $('#form_vino').hide();
}