$(document).ready(function(){
   
// Inserisco il calendario di jQuery UI
$("#data_evento_ricerca").datepicker({
        showOn: "button",
        buttonImage: "templates/main/template/img/calendario.gif",
        buttonImageOnly: true,
        changeMonth: true,
        changeYear: true,
        yearRange: "2000:2020",
        dateFormat: "yy/mm/dd",
        defaultDate: "2000/01/01"
    });

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

$('#submit_ricerca_eventi').on("click",function(){
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'ricerca_eventi', ricerca:true, nome_evento_ricerca:$('#nome_evento_ricerca').val(), vino_evento_ricerca:$('#vino_evento_ricerca').val(), data_evento_ricerca:$('#data_evento_ricerca').val()},
            success:ricerca_eventi
        });    
    });

$('.ordina_eventi').on("click",function(){  
    var ordina=$(this).attr('name');
    $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'amministra_eventi', ordinamento:ordina},
            success:smista
        });
    });

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

});

function smista(data){
    $('#pagina_parziale').html(data).show('slow');
    $('#ricerca_utenti').hide();
    $('#ricerca_eventi').hide('slow');
    $('.mostra_ricerca').hide('slow');
    $('.mostra_avanzata').hide('slow');
    $('#form_vino').hide();
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

function ricerca_eventi(data){
    $('#pagina_parziale').hide('slow');
    $('.mostra_avanzata').show();
    $('.nascondi_avanzata').hide();
    $('.mostra_ricerca').show();
    $('#risultati_eventi').hide('slow');
    $('#risultati_ricerca_eventi').html(data).show('slow');
}