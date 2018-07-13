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
    
    $('#inserimento').validate({
        rules: {
            citta_partenza: {
                required: true
            },
            citta_arrivo: {
                required: true
            },
            data_partenza: {
                required: true
            },
            costo: {
                required:true
            }
        }
    });
    
   $('.nascosto').on('mouseover', function () {
        if($('#inserimento').valid()){
            document.getElementById("submit_offri").disabled=false;
        }
       });
      
     
    // Inserisco il calendario di jQuery UI
    $("#data_partenza_ins").datepicker({
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
    
    $('#submit_veicolo_da_inserisci').on("click",function(){
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'inserimento_veicolo',  da:'inserisci' },
            success:aggiungi_veicolo
        });    
    });

$('#submit_offri').on("click",function(){
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'ricerca', task:'inserisci', citta_partenza:$('#citta_partenza').val(), citta_arrivo:$('#citta_arrivo').val(), data_partenza:$('#data_partenza_ins').val(), costo:$('#costo').val(), note:$('#note').val(), targa:$('.veicoli').val()},
            success:smista
        });    
    });

});

function aggiungi_veicolo(data){
    $('#pagina_parziale').hide('slow');
    $('#form_veicolo').html(data).show('slow');
}

function smista(data){
    $('#pagina_parziale').html(data).show('slow');
    $('#ricerca_utenti').hide();
    $('#ricerca_viaggi').hide('slow');
    $('#form_veicolo').hide();
}