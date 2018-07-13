<script src="js/ricerca_amministrazione_viaggi.js"></script>
<div class="column1-unit">
    <div> 
        {if $viaggi}
            <h1> Lista viaggi cercati </h1>
                <div style="width:650px;height:800px;overflow-y: scroll; border:1px solid white;">
                    <table width:650px;>
                    <tr>
                        <th class="mini">
                            <div name="num_viaggio">ID ▼</div>
                        </th>
                        <th class="top">
                            <div name="citta_partenza">Citta Partenza  </div>
                        </th>
                        <th class="top">
                            <div name="citta_arrivo">Citta Arrivo  </div>
                        <th class="mini">    
                            <div name="data-partenza">Data Partenza  </div>
                        </th>
                     </tr>   
                {section name=nr loop=$viaggi}
                     <tr class="riepilogo_viaggio pulsante" value="{$viaggi[nr].num_viaggio}" name="true">
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