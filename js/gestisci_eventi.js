$(document).ready(function(){
$('.riepilogo_evento').on("click",function(){
    var evento=$(this).attr('value');
    $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'riepilogo_evento', num_evento:evento},
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

$('.gestisci_eventi_personali').on("click",function(){
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'registrazione', task:'gestisci_eventi'},
            success:smista
        });    
    });
});

function smista(data){
    $('#pagina_parziale').html(data).show('slow');
    $('#ricerca_utenti').hide();
    $('#ricerca_eventi').hide();
    $('#form_vino').hide();
}