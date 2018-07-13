<br>
<script src="js/gestisci_viaggi.js"></script>
<h1 class="pagetitle">Gestisci viaggi</h1>

        <!-- Content unit - One column -->
		<h1 class="block">Viaggi inseriti da {$username}</h1>        
        <div class="column1-unit">
          <div class="contactform" >
            
            {if $array_viaggi}
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
				
                    {section name=nr loop=$array_viaggi}
                        <tr class="riepilogo_viaggio pulsante" value="{$array_viaggi[nr].num_viaggio}"> 
                            <td width="108">
                                <div>{$array_viaggi[nr].num_viaggio}</div>
                            </td>
                            <td width="108">
                                <div><b>{$array_viaggi[nr].data_partenza}</b></div>
                            </td>
                             <td width="108">
                                <div><b>{$array_viaggi[nr].citta_partenza}</b></div>
                            </td>
                            <td width="108">
                                <div><b>{$array_viaggi[nr].citta_arrivo}</b></div>
                            </td>
			</tr>
                    {/section}
			
                
                </table>
            </div>
        {else}
                <p class="center"><label class="center-title"> Non hai inserito viaggi!</label></p>     
        {/if}
        </div>
		</div>
		

           
      <h1 class="block">Viaggi a cui partecipi </h1>        
		 <div class="column1-unit">
          <div class="contactform" >
            
            {if $array_passeggero}
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
				
                    {section name=nr loop=$array_passeggero}
                        <tr  class="riepilogo_viaggio pulsante" value="{$array_passeggero[nr].num_viaggio}"> 
                            <td width="87">
                                <div>{$array_passeggero[nr].num_viaggio}</div>
                            </td>
                            <td width="87">
                                <div><b>{$array_passeggero[nr].data_partenza}</b></div>
                            </td>
                            <td>
                                <div><b>{$array_passeggero[nr].citta_partenza}</b></div>
                            </td>
                            <td>
                                <div><b>{$array_passeggero[nr].citta_arrivo}</b></div>
                            </td>
                            <td width="87">
                                <div>{$array_passeggero[nr].costo}&nbsp €</div>
                            </td>
			</tr>
                    {/section}
			
                
                </table>
            {else}
                    <p class="center"><label class="center-title"> Non partecipi a nessun viaggio!</label></p>    
            {/if}
           </div>              
        </div>