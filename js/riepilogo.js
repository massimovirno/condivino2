$(document).ready(function(){
$('#partecipa').on("click",function(){
    var viaggio=$(this).attr('name');
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'partecipa_viaggio', num_viaggio:viaggio},
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
    var viaggio=$(this).attr('name1');
    var username=$(this).attr('name2');
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'cancella_passeggero', num_viaggio:viaggio, username_passeggero:username},
            success:smista
        });    
    });

$('.feedback_passeggero').on("click",function(){
    var username=$(this).attr('name1');
    var viaggio=$(this).attr('name2');
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'inserisci_feedback',username_passeggero:username, num_viaggio:viaggio},
            success:smista
        });    
    });

$('.elimina_passeggero').on("click",function(){
    var username=$(this).attr('name1');
    var viaggio=$(this).attr('name2');
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'cancella_passeggero', username_passeggero:username, num_viaggio:viaggio},
            success:smista
        });    
    });

$('.elimina_viaggio').on("click",function(){
    var viaggio=$(this).attr('name');
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'elimina_viaggio', num_viaggio:viaggio},
            success:smista
        });    
    });

$('#feedback').on("click",function(){
    var viaggio=$(this).attr('name');
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'inserisci_feedback', num_viaggio:viaggio},
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
    $('#ricerca_viaggi').hide();
    $('#form_vino').hide();
}

function utente(data){
    $('#pagina_parziale').html(data).show('slow');
    $('#amministrazione').hide();
    $('#mostra_amministrazione').show();
    $('#nascondi_amministrazione').hide();
}

function indietro(){
    $('#ricerca_viaggi').show('slow');
    $('#pagina_parziale').hide('slow');
    $('.mostra_avanzata').show('slow');
    $('.nascondi_avanzata').hide('slow');
    $('.mostra_ricerca').show('slow');
}