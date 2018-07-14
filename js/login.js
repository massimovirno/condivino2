$(document).ready(function(){

$('#forgotpwd').on("click",function(){
    $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'registrazione', task:'recupero_password'},
            success:smista
        });
    });
    
$('#conferma_password').on("click",function(){
    $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'registrazione', task:'conferma_password', pwdattuale:$('#pwdattuale').val(), pwd:$('#pwd').val(), pwd1:$('#pwd1').val()},
            success:smista
        });
    });
    
$('#mail_recupero').on("click",function(){
    $.ajax({
            url:'index.php',
            dataType:'html',
            type:'GET',
            data:{controller:'registrazione', task:'invio_recupero', email:$('#email').val()},
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