<!-- INSERIMENTO EVENTO -->
<script src="js/inserisci_evento.js"></script>
<br>
<h1 class="pagetitle">Crea un Evento</h1>
<!-- Content unit - One column -->
<div>
<h1 class="block">Dati dell'evento</h1>
    <div class="column1-unit">
        <div class="contactform">
            <form id="inserimento">
                <fieldset>
                <p><label for="nome_evento" class="left">Nome evento:</label>
                   <input type="text" name="nome_evento" id="nome_evento" class="field" value="" tabindex="1"  /></p>
                <p><label for="vino_evento" class="left">Nome vino:</label>
                   <input type="text" name="data_evento" id="data_evento_ins" class="field" value="" tabindex="2" /></p>
                   <p> </p>
		        <div id="menu_vini">
                    <p><label for="nome_vino" class="left">Scegli un vino:</label>
                    <select name="vino" class="vino combo"> 
                        {section name=nr loop=$vini}
                            <option value="{$vini[nr].nome_vino}"><h5>{$vini[nr].nome_vino}</h5></option>
                        {/section}
                   </select></p>
                </div>
                <p><label for="aggiungi_vino" class="left">Oppure:</label>
                    <input type="button" name="aggiungi_vino" id="submit_vino_da_inserisci" class="button_left" value="Aggiungi vino" tabindex="4" /></p>
                <br><br>
                <p><label for="costo" class="left">Costo:</label>
                    <input type="text" name="costo" id="costo" class="mini field" value="" tabindex="5"  />&nbsp € (a persona)</p>
                <p><label for="note" class="left">Note evento:</label>
                   <textarea name="note" maxlength="300" id="note" cols="45" rows="7" tabindex="6"></textarea></p>
                <div class="nascosto"><br>
                    <p><input type="button" id="submit_offri" class="button" disabled value="Inserisci evento" tabindex="8" /></p><br><br>
                </div>
		</fieldset>
            </form>
        </div>
    </div>
</div>