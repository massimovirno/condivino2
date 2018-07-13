$(document).ready(function(){    
//    $('button').button();
    
    // Inserisco il calendario di jQuery UI
    $(function() {
        $("#data_nascita").datepicker({
        changeMonth: true,
        changeYear: true,
        yearRange: "1935:2005",
        dateFormat: "yy/mm/dd",
        defaultDate: "2000/01/01"
        });
    });
});