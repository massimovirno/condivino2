$(document).ready(function(){
$('#partecipa').on("click",function(){
    var evento=$(this).attr('name');
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'partecipa_evento', num_evento:evento},
            success:smista
        });    
    });

$('.visualizza_utente').on("click",function(){
    var user=$(this).attr('value');
    var partecipa=$(this).attr('name');
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'registrazione', task:'visualizza_utente', username:user, partecipa:partecipa},
            success:utente
        });    
    });

$('#cancellami').on("click",function(){
    var evento=$(this).attr('name1');
    var username=$(this).attr('name2');
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'cancella_partecipante', num_evento:evento, username_partecipante:username},
            success:smista
        });    
    });

$('.feedback_partecipante').on("click",function(){
    var username=$(this).attr('name1');
    var evento=$(this).attr('name2');
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'inserisci_feedback',username_partecipante:username, num_evento:evento},
            success:smista
        });    
    });

$('.elimina_partecipante').on("click",function(){
    var username=$(this).attr('name1');
    var evento=$(this).attr('name2');
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'cancella_partecipante', username_partecipante:username, num_evento:evento},
            success:smista
        });    
    });

$('.elimina_evento').on("click",function(){
    var evento=$(this).attr('name');
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'elimina_evento', num_evento:evento},
            success:smista
        });    
    });

$('#feedback').on("click",function(){
    var evento=$(this).attr('name');
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'inserisci_feedback', num_evento:evento},
            success:smista
        });    
    });

$('.indietro').on("click",function(){
    $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            success:indietro
        });
    });
});

function smista(data){
    $('#pagina_parziale').html(data).show('slow');
    $('#ricerca_utenti').hide();
    $('#ricerca_eventi').hide();
    $('#form_vino').hide();
}

function utente(data){
    $('#pagina_parziale').html(data).show('slow');
    $('#amministrazione').hide();
    $('#mostra_amministrazione').show();
    $('#nascondi_amministrazione').hide();
}

function indietro(){
    $('#ricerca_eventi').show('slow');
    $('#pagina_parziale').hide('slow');
    $('.mostra_avanzata').show('slow');
    $('.nascondi_avanzata').hide('slow');
    $('.mostra_ricerca').show('slow');
}