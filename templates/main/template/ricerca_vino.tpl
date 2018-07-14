<script src="js/vino.js"></script>
<br>
<h1 class="pagetitle">Inserimento nuovo vino</h1>
    <h1 class="block">Dati vino</h1>
    <div class="column1-unit">
        <div class="contactform">
            <form id="vino">
                <fieldset>
                <p><label for="nome_vino" class="left">Nome vino:</label>
                   <input type="text" name="nome_vino" id="nome_vino" class="field" value="" tabindex="1" maxlength="20" /></p>
                   <label id="errore_nome_vino" class="valid" for="nome_vino"> Vino già presente </label>
                <p><label for="produttore" class="left">Produttore:</label>
                   <input type="text" name="produttore" id="produttore" class="field" value="" tabindex="2" maxlength="20" /></p>
                <p><label for="denominazione" class="left">Denominazione:</label>
                   <input type="text" name="denominazione" id="denominazione" class="field" value="" tabindex="3" maxlength="30" /></p>
                <p><label for="vitigno" class="left">Vitigno:</label>
                   <input type="text" name="vitigno" id="vitigno" class="field" value="" tabindex="4" maxlength="20" /></p>
                
                <p><label for="anno" class="left">Anno:</label>
          <select name="anno" id="anno" class="combo" tabindex="5">
				  <option value="2018">2018</option>
          <option value="2017">2017</option>
          <option value="2016">2016</option>
          <option value="2015">2015</option>
          <option value="2014">2014</option>
          <option value="2013">2013</option>
          <option value="2012">2012</option>
          <option value="2011">2011</option>
          <option value="2010">2010</option>
				   </select>
				   </p>
                <p><label for="descrizione" class="left">Descrizione:</label>
                   <input type="text" name="descrizione" id="descrizione" class="field" value="" tabindex="6" maxlength="100" /></p>
                
                <p><label for="immagine_vino" class="left">Immagine etichetta:</label>
                   <input type="text" name="immagine_vino" id="immagine_vino" class="field" value="" tabindex="7" maxlength="100" /></p>
                
                {if ($da=='inserisci')}
                    <div class="nascosto"><br>
                        <p><input type="button" id="submit_aggiungi_da_inserisci" class="button_center" disabled value="Aggiungi" tabindex="8" /></p><br>
                    </div>
                {else}
                    <div class="nascosto"><br>
                        <p><input type="button" id="submit_aggiungi_da_profilo" class="button_center" value="Aggiungi" tabindex="9" /></p>
                    </div>
                {/if}
		</fieldset>
            </form>   
        </div>
</div>