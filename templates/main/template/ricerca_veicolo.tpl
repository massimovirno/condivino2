<script src="js/veicolo.js"></script>
<br>
<h1 class="pagetitle">Inserimento nuovo veicolo</h1>
    <h1 class="block">Dati veicolo</h1>
    <div class="column1-unit">
        <div class="contactform">
            <form id="veicolo">
                <fieldset>
                <p><label for="targa" class="left">Targa:</label>
                   <input type="text" name="targa" id="targa" class="field" value="" tabindex="1" maxlength="10" /></p>
                   <label id="errore_targa" class="valid" for="targa"> Targa già utilizzata </label>
                <p><label for="tipo" class="left">Tipo veicolo:</label>
                   <input type="text" name="tipo" id="tipo" class="field" value="" tabindex="2" maxlength="20" /></p>
                <p><label for="num_posti" class="left">Numero Posti:</label>
                   <select name="num_posti" id="num_posti" class="combo" tabindex="3">
				    <option value="5">5</option>
					<option value="4">4</option>
					<option value="3">3</option>
					<option value="2">2</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
				   </select>
				   </p>
                <p><label for="carburante" class="left">Carburante:</label>
                   <select name="carburante" id="carburante" class="combo"  tabindex="4" >
				    <option value="Benzina">Benzina</option>
					<option value="Diesel">Diesel</option>
					<option value="GPL">GPL</option>
					<option value="Metano">Metano</option>
					<option value="Altro">Altro</option>
					</select>
				   </p>
                <p><label for="consumo_medio" class="left">Consumo Medio (km/l):</label>
                   <input type="text" name="consumo_medio" id="consumo_medio" class="field" value="" tabindex="5" maxlength="3" /></p>
                {if ($da=='inserisci')}
                    <div class="nascosto"><br>
                        <p><input type="button" id="submit_aggiungi_da_inserisci" class="button_center" disabled value="Aggiungi" tabindex="6" /></p><br>
                    </div>
                {else}
                    <div class="nascosto"><br>
                        <p><input type="button" id="submit_aggiungi_da_profilo" class="button_center" value="Aggiungi" tabindex="7" /></p>
                    </div>
                {/if}
		</fieldset>
            </form>   
        </div>
</div>