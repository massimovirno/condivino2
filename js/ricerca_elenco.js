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
});

function smista(data){
    $('#pagina_parziale').html(data).show('slow');
    $('#ricerca_utenti').hide();
    $('#ricerca_eventi').hide('slow');
    $('#form_vino').hide();
}