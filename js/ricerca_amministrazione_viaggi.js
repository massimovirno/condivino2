$(document).ready(function(){
    var acList = ["Agrigento", "Alessandria", "Ancona", "Aosta", "Arezzo","Ascoli Piceno","Asti","Avellino","Bari,Barletta-Andria-Trani","Belluno","Benevento","Bergamo","Biella","Bologna","Bolzano","Brescia","Brindisi","Cagliari","Caltanissetta","Campobasso","Carbonia-Iglesias","Caserta","Catania","Catanzaro","Chieti","Como","Cosenza","Cremona","Crotone","Cuneo","Enna","Fermo","Ferrara","Firenze","Foggia","Forli-Cesena","Frosinone","Genova","Gorizia","Grosseto","Imperia","Isernia","La Spezia","L'Aquila","Latina","Lecce","Lecco","Livorno","Lodi","Lucca","Macerata","Mantova","Massa-Carrara","Matera","Messina","Milano","Modena","Monza e della Brianza","Napoli","Novara","Nuoro","Olbia-Tempio","Oristano","Padova","Palermo","Parma","Pavia","Perugia","Pesaro e Urbino","Pescara","Piacenza","Pisa","Pistoia","Pordenone","Potenza","Prato","Ragusa","Ravenna","Reggio Calabria","Reggio Emilia","Rieti","Rimini","Roma","Rovigo","Salerno","Medio Campidano","Sassari","Savona","Siena","Siracusa","Sondrio","Taranto","Teramo","Terni","Torino","Trapani","Trento","Treviso","Trieste", "Udine", "Varese","Venezia","Verbano-Cusio-Ossola","Vercelli","Verona","Vibo Valentia","Vicenza","Viterbo"];
        $('#citta_partenza_ricerca').autocomplete({
                 minLength: 2,
                 source: function( request, response ) {
                            var matches = $.map( acList, function(acItem) {
                            if ( acItem.toUpperCase().indexOf(request.term.toUpperCase()) === 0 ) {
                                return acItem;
                            }
                            });
                          response(matches);
                          },
                 change: function (event, ui) {
                            if(!ui.item){
                                $("#citta_partenza_ricerca").val("");
                            }
                         }                 
        });
    
    var acList = ["Agrigento", "Alessandria", "Ancona", "Aosta", "Arezzo","Ascoli Piceno","Asti","Avellino","Bari,Barletta-Andria-Trani","Belluno","Benevento","Bergamo","Biella","Bologna","Bolzano","Brescia","Brindisi","Cagliari","Caltanissetta","Campobasso","Carbonia-Iglesias","Caserta","Catania","Catanzaro","Chieti","Como","Cosenza","Cremona","Crotone","Cuneo","Enna","Fermo","Ferrara","Firenze","Foggia","Forli-Cesena","Frosinone","Genova","Gorizia","Grosseto","Imperia","Isernia","La Spezia","L'Aquila","Latina","Lecce","Lecco","Livorno","Lodi","Lucca","Macerata","Mantova","Massa-Carrara","Matera","Messina","Milano","Modena","Monza e della Brianza","Napoli","Novara","Nuoro","Olbia-Tempio","Oristano","Padova","Palermo","Parma","Pavia","Perugia","Pesaro e Urbino","Pescara","Piacenza","Pisa","Pistoia","Pordenone","Potenza","Prato","Ragusa","Ravenna","Reggio Calabria","Reggio Emilia","Rieti","Rimini","Roma","Rovigo","Salerno","Medio Campidano","Sassari","Savona","Siena","Siracusa","Sondrio","Taranto","Teramo","Terni","Torino","Trapani","Trento","Treviso","Trieste", "Udine", "Varese","Venezia","Verbano-Cusio-Ossola","Vercelli","Verona","Vibo Valentia","Vicenza","Viterbo"];
        $('#citta_arrivo_ricerca').autocomplete({
                 minLength: 2,
                 source: function( request, response ) {
                            var matches = $.map( acList, function(acItem) {
                            if ( acItem.toUpperCase().indexOf(request.term.toUpperCase()) === 0 ) {
                                return acItem;
                            }
                            });
                          response(matches);
                          },
                 change: function (event, ui) {
                            if(!ui.item){
                                $("#citta_arrivo_ricerca").val("");
                            }
                         }                 
        });
// Inserisco il calendario di jQuery UI
    $("#data_partenza_ricerca").datepicker({
        showOn: "button",
        buttonImage: "templates/main/template/img/calendario.gif",
        buttonImageOnly: true,
        changeMonth: true,
        changeYear: true,
        yearRange: "2000:2020",
        dateFormat: "yy/mm/dd",
        defaultDate: "2000/01/01"
    });
    
$('.mostra_avanzata').on("click",function(){
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            success:mostra_avanzata
        });    
    });

$('.nascondi_avanzata').on("click",function(){
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            success:nascondi_avanzata
        });    
    });

$('#submit_ricerca_eventi').on("click",function(){
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'ricerca_eventi', ricerca:true, citta_partenza_ricerca:$('#citta_partenza_ricerca').val(), citta_arrivo_ricerca:$('#citta_arrivo_ricerca').val(), data_partenza_ricerca:$('#data_partenza_ricerca').val()},
            success:ricerca_eventi
        });    
    });

$('.ordina_eventi').on("click",function(){  
    var ordina=$(this).attr('name');
    $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'amministra_eventi', ordinamento:ordina},
            success:smista
        });
    });

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
    $('.mostra_ricerca').hide('slow');
    $('.mostra_avanzata').hide('slow');
    $('#form_vino').hide();
}

function mostra_avanzata(){
    $('.nascondi_avanzata').show('slow');
    $('.mostra_avanzata').hide('slow');
    $('.mostra_ricerca').hide('slow');
}
function nascondi_avanzata(){
    $('.mostra_avanzata').show('slow');
    $('.nascondi_avanzata').hide('slow');
    $('.mostra_ricerca').show('slow');
}

function ricerca_eventi(data){
    $('#pagina_parziale').hide('slow');
    $('.mostra_avanzata').show();
    $('.nascondi_avanzata').hide();
    $('.mostra_ricerca').show();
    $('#risultati_eventi').hide('slow');
    $('#risultati_ricerca_eventi').html(data).show('slow');
}