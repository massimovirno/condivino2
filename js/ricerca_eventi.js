$(document).ready(function(){
    var acList = ["Agrigento", "Alessandria", "Ancona", "Aosta", "Arezzo","Ascoli Piceno","Asti","Avellino","Bari,Barletta-Andria-Trani","Belluno","Benevento","Bergamo","Biella","Bologna","Bolzano","Brescia","Brindisi","Cagliari","Caltanissetta","Campobasso","Carbonia-Iglesias","Caserta","Catania","Catanzaro","Chieti","Como","Cosenza","Cremona","Crotone","Cuneo","Enna","Fermo","Ferrara","Firenze","Foggia","Forli-Cesena","Frosinone","Genova","Gorizia","Grosseto","Imperia","Isernia","La Spezia","L'Aquila","Latina","Lecce","Lecco","Livorno","Lodi","Lucca","Macerata","Mantova","Massa-Carrara","Matera","Messina","Milano","Modena","Monza e della Brianza","Napoli","Novara","Nuoro","Olbia-Tempio","Oristano","Padova","Palermo","Parma","Pavia","Perugia","Pesaro e Urbino","Pescara","Piacenza","Pisa","Pistoia","Pordenone","Potenza","Prato","Ragusa","Ravenna","Reggio Calabria","Reggio Emilia","Rieti","Rimini","Roma","Rovigo","Salerno","Medio Campidano","Sassari","Savona","Siena","Siracusa","Sondrio","Taranto","Teramo","Terni","Torino","Trapani","Trento","Treviso","Trieste", "Udine", "Varese","Venezia","Verbano-Cusio-Ossola","Vercelli","Verona","Vibo Valentia","Vicenza","Viterbo"];
        $('#citta_partenza').autocomplete({
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
                                $("#citta_partenza").val("");
                            }
                         }                 
        });
     
     var acList = ["Agrigento", "Alessandria", "Ancona", "Aosta", "Arezzo","Ascoli Piceno","Asti","Avellino","Bari,Barletta-Andria-Trani","Belluno","Benevento","Bergamo","Biella","Bologna","Bolzano","Brescia","Brindisi","Cagliari","Caltanissetta","Campobasso","Carbonia-Iglesias","Caserta","Catania","Catanzaro","Chieti","Como","Cosenza","Cremona","Crotone","Cuneo","Enna","Fermo","Ferrara","Firenze","Foggia","Forli-Cesena","Frosinone","Genova","Gorizia","Grosseto","Imperia","Isernia","La Spezia","L'Aquila","Latina","Lecce","Lecco","Livorno","Lodi","Lucca","Macerata","Mantova","Massa-Carrara","Matera","Messina","Milano","Modena","Monza e della Brianza","Napoli","Novara","Nuoro","Olbia-Tempio","Oristano","Padova","Palermo","Parma","Pavia","Perugia","Pesaro e Urbino","Pescara","Piacenza","Pisa","Pistoia","Pordenone","Potenza","Prato","Ragusa","Ravenna","Reggio Calabria","Reggio Emilia","Rieti","Rimini","Roma","Rovigo","Salerno","Medio Campidano","Sassari","Savona","Siena","Siracusa","Sondrio","Taranto","Teramo","Terni","Torino","Trapani","Trento","Treviso","Trieste", "Udine", "Varese","Venezia","Verbano-Cusio-Ossola","Vercelli","Verona","Vibo Valentia","Vicenza","Viterbo"];
        $('#citta_arrivo').autocomplete({
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
                                $("#citta_arrivo").val("");
                            }
                         }                 
        });
// Inserisco il calendario di jQuery UI
    $("#data_evento_ric").datepicker({
        showOn: "button",
        buttonImage: "templates/main/template/img/calendario.gif",
        buttonImageOnly: true,
        minDate: 0,
        changeMonth: true,
        changeYear: true,
        yearRange: "2000:2020",
        dateFormat: "yy/mm/dd",
        defaultDate: "2000/01/01"
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