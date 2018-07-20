<br>
<script src="js/index.js"></script>
<h1 class="pagetitle">Home page</h1>
<div><h1 class="block">Ultimi eventi inseriti dagli utenti</h1></div>
<div class="column1-unit">	
    <div class="contactform" >
        {if $eventi}
             <table width:650px;>
                    <tr>
                        <th class="mini">
                            <div>ID</div>
			</th>
			<th class="mini">
                            <div>Evento  </div>
			</th>
			<th class="top">
                            <div>Data  </div>
			</th>
			<th class="top">
                            <div>Vino  </div>
			</th>
			<th class="mini">
                            <div>Costo  </div>
			</th>
                    </tr>
			</table>
			<div class="contenitore">
			<table width:650px>
				
                    {section name=nr loop=$eventi}
                        <tr  class="riepilogo_evento pulsante" value="{$eventi[nr].num_evento}"> 
                            <td width="87">
                                <div>{$eventi[nr].num_evento}</div>
                            </td>
                            <td width="87">
                                <div>{$eventi[nr].nome_evento}</div>
                            </td>
                            <td>
                                <div><b>{$eventi[nr].data_evento}</b></div>
                            </td>
                            <td>
                                <div><b>{$eventi[nr].vino_evento}</b></div>
                            </td>
                            <td width="87">
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
