<br>
<h1 class="pagetitle">Elenco Viaggi</h1><br>
<script src="js/ricerca_amministrazione_viaggi.js"></script>
<!-- Content unit - One column -->
<div class="column1-unit">
    <h1 class="block">Ricerca viaggi</h1>
<h2>
        <div class="pulsante nascondi_avanzata" name="nascondi">► ricerca avanzata</div>
        <div class="pulsante mostra_avanzata" name="mostra">◄ nascondi</div>
</h2>
<div class="mostra_ricerca">
        <div class="column1-unit">
          <div class="contactform">
             <form>
              <fieldset>
                <p><label for="citta_partenza" class="left">Citta di partenza:</label>
                   <input type="text" name="citta_partenza" id="citta_partenza_ricerca" class="field" value="" tabindex="1"  /></p>
                <p><label for="citta_arrivo" class="left">Citta di arrivo:</label>
                   <input type="text" name="citta_arrivo" id="citta_arrivo_ricerca" class="field" value="" tabindex="2" /></p>
                <p><label for="data_partenza" class="left">Data di partenza:</label>
                   <input type="text" name="data_partenza" id="data_partenza_ricerca" class="field" value="" tabindex="3" /></p>
                
                <p><input type="button" id="submit_ricerca_viaggi" class="button" value="Cerca" tabindex="4" /></p>
              </fieldset>
            </form>
         </div>
        </div>
</div>
</div>    
<div class="column1-unit">
    <div id="risultati_viaggi" >
        <div class="column1-unit">
    <div> 
        {if $viaggi}
            <h1> Lista viaggi cercati </h1>
            <div style="width:650px;height:800px;overflow-y: scroll; border:1px solid white;">
            <table width:650px;>
                <tr>
                    <th class="top">
                        <div class="ordina_viaggi pulsante" name="num_viaggio">Numero Viaggio ▼</div>
                    </th>
                    <th class="top">
                        <div class="ordina_viaggi pulsante" name="citta_partenza">Citta Partenza ▼</div>
                    </th>
                    <th class="top">
                        <div class="ordina_viaggi pulsante" name="citta_arrivo">Citta Arrivo ▼</div>
                    </th>
                    <th class="top">
                        <div class="ordina_viaggi pulsante" name="data_partenza">Data Partenza ▼</div>
                    </th>
                </tr>       
            {section name=nr loop=$viaggi}
           <tr class="riepilogo_viaggio pulsante" value="{$viaggi[nr].num_viaggio}">
             <div>
                <td>
                    <div>{$viaggi[nr].num_viaggio}</div>
                </td>
                <td>
                    <div>{$viaggi[nr].citta_partenza}</div>
                </td>
                <td>
                    <div>{$viaggi[nr].citta_arrivo}</div>
                </td>
                <td>
                    <div>{$viaggi[nr].data_partenza}</div>
                </td>    
                    </div> 
              </div>
            </tr>    
            {/section}
            </table>
            </div>
        {else}
            <div class="contactform">
                <p class="center"><label class="center-title"> Nessun viaggio trovato!</label></p>  
            </div>     
        {/if}
    </div>
         </div>
    </div>
</div> 
    </div>
        <div id="risultati_ricerca_viaggi"></div>
    </div>