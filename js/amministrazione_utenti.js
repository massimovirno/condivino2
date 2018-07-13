$(document).ready(function(){
$('#attiva_account').on("click",function(){
    var user=$(this).attr('name');
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'registrazione', task:'attiva_account', username:user},
            success:mostra_amministrazione
        });    
    });

$('#disattiva_account').on("click",function(){
    var user=$(this).attr('name');
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'registrazione', task:'disattiva_account', username:user},
            success:mostra_amministrazione
        });    
    });
$('#rendi_amministratore').on("click",function(){
    var user=$(this).attr('name');
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'registrazione', task:'rendi_amministratore', username:user},
            success:mostra_amministrazione
        });    
    });

$('#rendi_utente').on("click",function(){
    var user=$(this).attr('name');
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'registrazione', task:'rendi_utente', username:user},
            success:mostra_amministrazione
        });    
    });
    
$('#mostra_amministrazione').on("click",function(){
    var user=$(this).attr('name');
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'registrazione', task:'verifica_tipo_utente', username:user},
            success:mostra_amministrazione
        });    
    });

$('#nascondi_amministrazione').on("click",function(){
        $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            success:nascondi_amministrazione
        });    
    }); 
});

function mostra_amministrazione(data){
    $('#amministrazione').html(data).show('slow');
    $('#mostra_amministrazione').hide('slow');
    $('#nascondi_amministrazione').show('slow');
}

function nascondi_amministrazione(){
    $('#amministrazione').hide('slow');
    $('#mostra_amministrazione').show('slow');
    $('#nascondi_amministrazione').hide('slow');
}