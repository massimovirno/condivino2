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
});

function smista(data){
    $('#pagina_parziale').html(data).show('slow');
    $('#ricerca_utenti').hide();
    $('#ricerca_viaggi').hide('slow');
    $('#form_veicolo').hide();
}