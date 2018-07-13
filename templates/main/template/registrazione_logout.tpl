<div class="main-navigation">
        <div class="loginform">
		<br><br><br><br><br>
          <h3>Benvenuto, <a class="visualizza pulsante"> {$username}</a>!</h3><br>
		  <img class="visualizza center pulsante"src={$immagine_profilo} alt="Image description" eight="60" width="60"/>
		  <form method="post" action="index.php"> 
            <p><input type="hidden" name="controller" value="registrazione" /></p>
            <p><input type="hidden" name="task" value="esci" /></p>
            <fieldset>
    	      <p><input type="submit" name="cmdweblogout" class="button" value="LOGOUT"  /></p>
	     </fieldset>
          </form>
        </div>
</div>