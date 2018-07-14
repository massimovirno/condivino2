$(document).ready(function(){
$('.mostra_avanzata').on("click",function(){
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            success:mostra_avanzata
        });    
    });

$('.nascondi_avanzata').on("click",function(){
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            success:nascondi_avanzata
        });    
    });
    
$('#submit_ricerca_utenti').on("click",function(){
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'ricerca_utenti', username_ricerca:$('#username_ricerca').val(), cognome_ricerca:$('#cognome_ricerca').val(), citta_residenza_ricerca:$('#citta_residenza_ricerca').val()},
            success:ricerca_utenti
        });    
    });

$('.visualizza_utente').on("click",function(){
    var user=$(this).attr('value');
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'registrazione', task:'visualizza_utente', username:user},
            success:amministrazione
        });    
    });
    
$('.ordina_utenti').on("click",function(){  
    var ordina=$(this).attr('name');
    $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'amministra_utenti', ordinamento:ordina},
            success:smista
        });
    });
});

function smista(data){
    $('#pagina_parziale').html(data).show('slow');
    $('#ricerca_utenti').hide('slow');
    $('#ricerca_viaggi').hide();
    $('.mostra_ricerca').hide('slow');
    $('#form_vino').hide();
    $('.mostra_avanzata').hide('slow');
}

function mostra_avanzata(){
    $('.nascondi_avanzata').show('slow');
    $('.mostra_avanzata').hide('slow');
    $('.mostra_ricerca').hide('slow');
}
function nascondi_avanzata(){
    $('.mostra_avanzata').show('slow');
    $('.nascondi_avanzata').hide('slow');
    $('.mostra_ricerca').show('slow');
}

function ricerca_utenti(data){
    $('#pagina_parziale').hide('slow');
    $('#ricerca_utenti').show('slow');
    $('.mostra_avanzata').show();
    $('.nascondi_avanzata').hide();
    $('.mostra_ricerca').show();
    $('#risultati_utenti').hide('slow');
    $('#risultati_ricerca_utenti').html(data).show('slow');
}

function amministrazione(data){
    $('#pagina_parziale').html(data).show('slow');
    $('#ricerca_utenti').hide('slow');
    $('#ricerca_viaggi').hide();
    $('#nascondi_amministrazione').hide();
}