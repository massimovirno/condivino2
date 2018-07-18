$(document).ready(function(){

$("#jqxRating").jqxRating({ width: 350, height: 35, theme: 'classic'});
$("#jqxRating").on('change', function (event) {
    $("#rate").find('span').remove();
    $("#rate").append('<span class="val_guid" name='+ event.value +'>' + event.value + '</span');
});

$('.valuta_pass').on("click",function(){
    var username=$(this).attr('name1');
    var evento=$(this).attr('name2');
    var rating=$('.val_guid').attr('name');
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'verifica_valutazione_oste',username_partecipante:username, num_evento:evento, valutazione:rating, commento:$('.commento').val()},
            success:smista
        });    
    });

$('#valuta').on("click",function(){
    var evento=$(this).attr('name');
    var rating=$('.val_guid').attr('name');
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'conferma_valutazione', num_evento:evento, valutazione:rating, commento:$('.commento').val()},
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