<br>
<h1 class="pagetitle">Gestione utenti</h1><br>
<script src="js/ricerca_amministrazione_utenti.js"></script>
<div class="column1-unit">
    <h1 class="block">Ricerca utenti</h1>
    <!-- Content unit - One column -->
    <h2>
    <div class="pulsante nascondi_avanzata" name="nascondi">► ricerca avanzata</div>
    <div class="pulsante mostra_avanzata" name="mostra">◄ nascondi</div>
    </h2>
    <div class="mostra_ricerca">
        <div class="contactform">
            <form>
                <fieldset>
                    <p><label for="username" class="left">Username: </label>
                    <input type="text" name="username" id="username_ricerca" class="field" value="" tabindex="1"  /></p>
                    <p><label for="cognome" class="left">Cognome:</label>
                    <input type="text" name="cognome" id="cognome_ricerca" class="field" value="" tabindex="2"  /></p>
                    <p><label for="citta" class="left">Citta Residenza:</label>
                    <input type="text" name="citta" id="citta_residenza_ricerca" class="field" value="" tabindex="3"  /></p>
                    <p><input type="button" id="submit_ricerca_utenti" class="button" value="Cerca" tabindex="4" /></p>
                </fieldset>
            </form>
        </div>
    </div>
</div>
<div class="column1-unit">
    <div id="risultati_utenti" >      
        <div> 
            {if $utenti}
                <div style="width:650px;height:800px;overflow-y: scroll; border:1px solid white;">
                    <table width:650px;>
			<tr>
                            <th class="top">
                                <div class="ordina_utenti pulsante" name="username">Username  ▼</div>
                            </th>
                            <th class="top">
                                <div class="ordina_utenti pulsante" name="nome">Nome  ▼</div>
                            </th>
                            <th class="top">
                                <div class="ordina_utenti pulsante" name="cognome">Cognome  ▼</div>
                            </th>
                            <th class="top">
                                <div class="ordina_utenti pulsante" name="citta_residenza">Città di residenza  ▼</div>
                            </th>
			</tr>
                    {section name=nr loop=$utenti}
                    <tr>				
			<td>
                            <div><a class="visualizza_utente pulsante" value="{$utenti[nr].username}">{$utenti[nr].username}</a></div>
			</td>
			<td>
                            <div>{$utenti[nr].nome}</div>
			</td>
			<td>
                            <div>{$utenti[nr].cognome}</div>
			</td>
			<td>
                            <div>{$utenti[nr].citta_residenza}</div>
			</td>
			</tr>
                    {/section}
                    </table>
                  </div>
            {else}
		 <div class="contactform">
                    <p class="center"><label class="center-title"> Nessun utente trovato!</label></p>  
		</div>
            {/if}
        </div>
    </div>
<div id="risultati_ricerca_utenti"></div>
</div>