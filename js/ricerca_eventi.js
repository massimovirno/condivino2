$(document).ready(function(){
  
// Inserisco il calendario di jQuery UI
    $("#data_evento_ric").datepicker({
        showOn: "button",
        buttonImage: "templates/main/template/img/calendario.gif",
        buttonImageOnly: true,
        minDate: 0,
        changeMonth: true,
        changeYear: true,
        yearRange: "2018:2020",
        dateFormat: "yy/mm/dd",
        defaultDate: "2018/01/01"
    });
    
$('#submit_ricerca').on("click",function(){
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'invio_ricerca', nome_evento:$('#nome_evento').val(), data_evento:$('#data_evento_ric').val(), vino_evento:$('#vino_evento').val()},
            success:ricerca_avanzata
        });    
    });
});

function ricerca_avanzata(data){
    $('#ricerca').html(data).show('slow');
}