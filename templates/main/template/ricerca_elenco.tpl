<br>
<h1 class="pagetitle">Elenco Eventi</h1>
<!-- Content unit - One column -->
<h1 class="block">Dati eventi</h1>
<script src="js/ricerca_elenco.js"></script>         
<div class="column1-unit">
    <div class="contactform" >
        {if $eventi}
            <div style="width:650px;height:500px;overflow-y: scroll; border:1px ">
                <table width:650px;>
                    <tr>
                        <th class="mini">
                            <div>ID</div>
			</th>
			<th class="mini">
                            <div>Data  </div>
			</th>
			<th class="top">
                            <div>Partenza da  </div>
                        </th>
			<th class="top">
                            <div>Arrivo a  </div>
			</th>
			<th class="mini">
                            <div>Costo  </div>
			</th>
                    </tr>
                    {section name=nr loop=$eventi}     
                    <tr class="riepilogo_evento pulsante" value="{$eventi[nr].num_evento}" name="true">
                        <td>
                            <div>{$eventi[nr].num_evento}</div>
			</td>
			<td>
                            <div><b>{$eventi[nr].data_partenza}</b></div>
			</td>
                        <td>
                            <div><b>{$eventi[nr].citta_partenza}</b></div>
			</td>
                        <td>
                            <div><b>{$eventi[nr].citta_arrivo}</b></div>
			</td>
			<td>
                            <div>{$eventi[nr].costo}&nbsp €</div>
			</td>
                    </tr>
                    {/section}
		</table>
            </div>
        {else}
            <p class="center"><label class="center-title"> Non ci sono eventi!</label></p>     
        {/if}
    </div>              
</div>
