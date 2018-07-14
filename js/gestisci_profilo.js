$(document).ready(function(){
$('#modifica_password').on("click",function(){
    $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'registrazione', task:'modifica_password'},
            success:smista
        });
    });

$('.riepilogo_vino').on("click",function(){
    var nome_vino_vino=$(this).attr('value');
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'riepilogo_vino', nome_vino:nome_vino_vino},
            success:smista
        });    
    });

$('#submit_vino_da_profilo').on("click",function(){
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'inserimento_vino',  da:'profilo'},
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