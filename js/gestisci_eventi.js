$(document).ready(function(){
$('.riepilogo_viaggio').on("click",function(){
    var viaggio=$(this).attr('value');
    $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'riepilogo_viaggio', num_viaggio:viaggio},
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

$('.gestisci_viaggi_personali').on("click",function(){
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'registrazione', task:'gestisci_viaggi'},
            success:smista
        });    
    });
});

function smista(data){
    $('#pagina_parziale').html(data).show('slow');
    $('#ricerca_utenti').hide();
    $('#ricerca_viaggi').hide();
    $('#form_vino').hide();
}