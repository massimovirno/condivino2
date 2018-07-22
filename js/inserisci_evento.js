$(document).ready(function(){
    
    $('#inserimento').validate({
        rules: {
            nome_evento: {
                required: true
            },
            data_evento: {
                required: true
            },
            costo: {
                required:true
            },
            posti_disponibili: {
                required: true, 
                range: [1, 100]
            }
        }
    });
    
   $('.nascosto').on('mouseover', function () {
        if($('#inserimento').valid()){
            document.getElementById("submit_offri").disabled=false;
        }
       });
      
     
    // Inserisco il calendario di jQuery UI
    $("#data_evento_ins").datepicker({
        showOn: "button",
        buttonImage: "templates/main/template/img/calendario.gif",
        buttonImageOnly: true,
        minDate: 0,
        changeMonth: true,
        changeYear: true,
        yearRange: "2018:2020",
        dateFormat: "yy/mm/dd",
        defaultDate: "2000/01/01"
    });
    
    $('#submit_vino_da_inserisci').on("click",function(){
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'inserimento_vino',  da:'inserisci' },
            success:aggiungi_vino
        });    
    });

$('#submit_offri').on("click",function(){
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'inserisci', 
            nome_evento:$('#nome_evento').val(),
            data_evento:$('#data_evento_ins').val(),
            vino_evento:$('#vino_evento').val(),
            costo:$('#costo').val(), 
            posti_disponibili:$('#posti_disponibili').val(), 
            note:$('#note').val(), 
            immagine_evento:$('#immagine_evento').val()
            },
            success:smista
        });    
    });

});

function aggiungi_vino(data){
    $('#pagina_parziale').hide('slow');
    $('#form_vino').html(data).show('slow');
}

function smista(data){
    $('#pagina_parziale').html(data).show('slow');
    $('#ricerca_utenti').hide();
    $('#ricerca_eventi').hide('slow');
    $('#form_vino').hide();
}