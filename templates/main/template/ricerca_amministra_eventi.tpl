<br>
<h1 class="pagetitle">Elenco Eventi</h1><br>
<script src="js/ricerca_amministrazione_eventi.js"></script>
<!-- Content unit - One column -->
<div class="column1-unit">
    <h1 class="block">Ricerca eventi</h1>
<h2>
        <div class="pulsante nascondi_avanzata" name="nascondi">► ricerca avanzata</div>
        <div class="pulsante mostra_avanzata" name="mostra">◄ nascondi</div>
</h2>
<div class="mostra_ricerca">
        <div class="column1-unit">
          <div class="contactform">
             <form>
              <fieldset>
                <p><label for="nome_evento" class="left">Nome:</label>
                   <input type="text" name="nome_evento" id="nome_evento_ricerca" class="field" value="" tabindex="1"  /></p>
                <p><label for="data_evento" class="left">Data evento:</label>
                   <input type="text" name="data_evento" id="data_evento_ricerca" class="field" value="" tabindex="3" /></p>
                <p><input type="button" id="submit_ricerca_eventi" class="button" value="Cerca" tabindex="4" /></p>
              </fieldset>
            </form>
         </div>
        </div>
</div>
</div>    
<div class="column1-unit">
    <div id="risultati_eventi" >
        <div class="column1-unit">
    <div> 
        {if $eventi}
            <h1> Lista eventi cercati </h1>
            <div style="width:650px;height:800px;overflow-y: scroll; border:1px solid white;">
            <table width:650px;>
                <tr>
                    <th class="top">
                        <div class="ordina_eventi pulsante" name="num_evento">Numero ▼</div>
                    </th>
                    <th class="top">
                        <div class="ordina_eventi pulsante" name="nome_evento">Nome ▼</div>
                    </th>
                    <th class="top">
                        <div class="ordina_eventi pulsante" name="data_evento">Data ▼</div>
                    </th>
                    <th class="top">
                        <div class="ordina_eventi pulsante" name="vino_evento">Vino ▼</div>
                    </th>
                </tr>       
            {section name=nr loop=$eventi}
           <tr class="riepilogo_evento pulsante" value="{$eventi[nr].num_evento}">
             <div>
                <td>
                    <div>{$eventi[nr].num_evento}</div>
                </td>
                <td>
                    <div>{$eventi[nr].nome_evento}</div>
                </td>
                <td>
                    <div>{$eventi[nr].data_evento}</div>
                </td>
                <td>
                    <div>{$eventi[nr].vino_evento}</div>
                </td>    
                    </div> 
              </div>
            </tr>    
            {/section}
            </table>
            </div>
        {else}
            <div class="contactform">
                <p class="center"><label class="center-title"> Nessun evento trovato!</label></p>  
            </div>     
        {/if}
    </div>
         </div>
    </div>
</div> 
    </div>
        <div id="risultati_ricerca_eventi"></div>
    </div>