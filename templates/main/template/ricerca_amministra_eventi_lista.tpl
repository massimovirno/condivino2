<script src="js/ricerca_amministrazione_eventi.js"></script>
<div class="column1-unit">
    <div> 
        {if $eventi}
            <h1> Lista eventi cercati </h1>
                <div style="width:650px;height:800px;overflow-y: scroll; border:1px solid white;">
                    <table width:650px;>
                    <tr>
                        <th class="mini">
                            <div name="num_evento">ID ▼</div>
                        </th>
                        <th class="top">
                            <div name="nome_evento">Nome  </div>
                        </th>
                        <th class="top">
                            <div name="vino_evento">Vino  </div>
                        <th class="mini">    
                            <div name="data-partenza">Data evento  </div>
                        </th>
                     </tr>   
                {section name=nr loop=$eventi}
                     <tr class="riepilogo_evento pulsante" value="{$eventi[nr].num_evento}" name="true">
                        <div> 
                           <td>
                                <div>{$eventi[nr].num_evento}</div>
                           </td>
                           <td>
                                <div>{$eventi[nr].nome_evento}</div>
                           </td>
                           <td>
                                <div>{$eventi[nr].vino_evento}</div>
                           </td>
                           <td>
                                <div>{$eventi[nr].data_evento}</div>
                           </td>     
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