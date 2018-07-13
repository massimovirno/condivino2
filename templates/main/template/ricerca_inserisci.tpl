<!-- INSERIMENTO VIAGGIO -->
<script src="js/inserisci_viaggio.js"></script>
<br>
<h1 class="pagetitle">Offri un viaggio</h1>
<!-- Content unit - One column -->
<div>
<h1 class="block">Dati del viaggio</h1>
    <div class="column1-unit">
        <div class="contactform">
            <form id="inserimento">
                <fieldset>
                <p><label for="citta_partenza" class="left">Citta di partenza:</label>
                   <input type="text" name="citta_partenza" id="citta_partenza" class="field" value="" tabindex="1"  /></p>
                <p><label for="citta_arrivo" class="left">Citta di arrivo:</label>
                   <input type="text" name="citta_arrivo" id="citta_arrivo" class="field" value="" tabindex="2" /></p>
                <p><label for="data_partenza" class="left">Data di partenza:</label>
                   <input type="text" name="data_partenza" id="data_partenza_ins" class="field" value="" tabindex="3" /></p>
		<div id="menu_veicoli">
                    <p><label for="targa" class="left1">Scegli un veicolo:</label>
                    <select name="targa" class="veicoli combo"> 
                        {section name=nr loop=$veicoli}
                            <option value="{$veicoli[nr].targa}"><h5>{$veicoli[nr].targa}</h5></option>
                        {/section}
                   </select></p>
                </div>
                <p><label for="aggiungi_veicolo" class="left">Oppure:</label>
                    <input type="button" name="aggiungi_veicolo" id="submit_veicolo_da_inserisci" class="button_left" value="Aggiungi veicolo" tabindex="5" /></p>
                <br><br>
                <p><label for="costo" class="left">Costo:</label>
                    <input type="text" name="costo" id="costo" class="mini field" value="" tabindex="6"  />&nbsp € (a persona)</p>
                <p><label for="note" class="left">Note viaggio:</label>
                   <textarea name="note" maxlength="300" id="note" cols="45" rows="7" tabindex="7"></textarea></p>
                <div class="nascosto"><br>
                    <p><input type="button" id="submit_offri" class="button" disabled value="Inserisci viaggio" tabindex="8" /></p><br><br>
                </div>
		</fieldset>
            </form>
        </div>
    </div>
</div>