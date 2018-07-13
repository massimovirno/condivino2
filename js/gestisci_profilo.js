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

$('.riepilogo_veicolo').on("click",function(){
    var targa_veicolo=$(this).attr('value');
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'riepilogo_veicolo', targa:targa_veicolo},
            success:smista
        });    
    });

$('#submit_veicolo_da_profilo').on("click",function(){
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'inserimento_veicolo',  da:'profilo'},
            success:smista
        });    
    });
    
});

    function smista(data){
    $('#pagina_parziale').html(data).show('slow');
    $('#ricerca_utenti').hide();
    $('#ricerca_viaggi').hide();
    $('#form_veicolo').hide();
}