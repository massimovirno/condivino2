<br>
<script src="js/gestisci_eventi.js"></script>
<h1 class="pagetitle">Gestisci eventi</h1>

        <!-- Content unit - One column -->
		<h1 class="block">Eventi inseriti da {$username}</h1>        
        <div class="column1-unit">
          <div class="contactform" >
            
                {if $array_eventi}
               <table width:650px;>
			<th class="mini">
                            <div>ID  </div>
			</th>
			<th class="mini">
                            <div>Data  </div>
			</th>
			<th class="mini">
                            <div>Partenza da  </div>
			</th>
			<th class="mini">
                            <div>Arrivo a  </div>
			</th>
                    </tr>
			</table>
			<div class="contenitore">
			<table width:650px>
				
                    {section name=nr loop=$array_eventi}
                        <tr class="riepilogo_evento pulsante" value="{$array_eventi[nr].num_evento}"> 
                            <td width="108">
                                <div>{$array_eventi[nr].num_evento}</div>
                            </td>
                            <td width="108">
                                <div><b>{$array_eventi[nr].data_partenza}</b></div>
                            </td>
                             <td width="108">
                                <div><b>{$array_eventi[nr].citta_partenza}</b></div>
                            </td>
                            <td width="108">
                                <div><b>{$array_eventi[nr].citta_arrivo}</b></div>
                            </td>
			</tr>
                    {/section}
			
                
                </table>
            </div>
        {else}
                <p class="center"><label class="center-title"> Non hai inserito eventi!</label></p>     
        {/if}
        </div>
		</div>
		

           
      <h1 class="block">Eventi a cui partecipi </h1>        
		 <div class="column1-unit">
          <div class="contactform" >
            
            {if $array_partecipante}
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
			</table>
			<div class="contenitore">
			<table width:650px>
				
                    {section name=nr loop=$array_partecipante}
                        <tr  class="riepilogo_evento pulsante" value="{$array_partecipante[nr].num_evento}"> 
                            <td width="87">
                                <div>{$array_partecipante[nr].num_evento}</div>
                            </td>
                            <td width="87">
                                <div><b>{$array_partecipante[nr].data_partenza}</b></div>
                            </td>
                            <td>
                                <div><b>{$array_partecipante[nr].citta_partenza}</b></div>
                            </td>
                            <td>
                                <div><b>{$array_partecipante[nr].citta_arrivo}</b></div>
                            </td>
                            <td width="87">
                                <div>{$array_partecipante[nr].costo}&nbsp €</div>
                            </td>
			</tr>
                    {/section}
			
                
                </table>
            {else}
                    <p class="center"><label class="center-title"> Non partecipi a nessun evento!</label></p>    
            {/if}
           </div>              
        </div>