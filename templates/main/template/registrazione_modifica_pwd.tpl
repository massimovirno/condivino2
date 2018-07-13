<script src="js/login.js"></script>
<script src="js/gestisci_profilo.js"></script>
		<br>
<div>
        <h1 class="pagetitle">Gestisci profilo</h1>
        {if $errore} <h2>Attenzione errore inserimento campi</h2> {/if}
        <!-- Content unit - One column -->
		<h1 class="block">Modifica password</h1>
        <div class="column1-unit">
          <div class="contactform">
                <p><label class="left">Password attuale:</label>
                   <input type="password" id="pwdattuale" maxlength="20" class="field" value="" tabindex="1" /></p>
                <p><label class="left">Nuova password:</label>
                   <input type="password" id="pwd" maxlength="20" class="field" value="" tabindex="2" /></p>
                <p><label class="left">Conferma password:</label>
                   <input type="password" id="pwd1" maxlength="20" class="field" value="" tabindex="3" /></p>
                <p class="center"><input type="button" id="conferma_password" class="button_center" value="Modifica" tabindex="4" /></p>
          </div>
        </div>
</div>