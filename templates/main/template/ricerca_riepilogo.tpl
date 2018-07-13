<br>
<script src="js/riepilogo.js"></script>
<h1 class="pagetitle">Dati viaggio</h1>
<div>
<!-- Content unit - One column -->
    <h1 class="block">Riepilogo del viaggio &nbsp{$num_viaggio}</h1>
    <div class="column1-unit">
        <div class="contactform">
            {if ($isPasseggero || $isGuidatore)}
                <p class="center"><label class="center-title">Partecipi a questo viaggio!</p>
            {/if}
			 {if $posti_disponibili<1 && !$isPasseggero}
                <p class="center"><label class="center-title">Non ci sono più posti disponibili!</label></p>
             {/if}
            <p class="center"><b>organizzato da:</b>&nbsp<label class="center pulsante"><a class="visualizza_utente"  name="{$partecipa}" value="{$username_guidatore}">{$username_guidatore}</a></label>{if ($isPasseggero && !$votato)}<input type="button" id="feedback" class="button_center" name="{$num_viaggio}" value="Feedback" tabindex="1" />{/if}</p>
           <table>
		   <tr class="normale">
			<th class="top">Data di partenza:</th>
			<td colspan="2"><h2>{$data_partenza}</h2></td>
			</tr>
			<tr class="normale">
			<th class="top">Città di partenza:</th>
			<td colspan="2"><h2>{$citta_partenza}</h2></td>
			</tr>
			<tr class="normale">
			<th class="top">Città di arrivo:</th>
			<td colspan="2"><h2>{$citta_arrivo}</h2></td>
			</tr>
			<tr class="normale">
			<th class="top">Tipo di veicolo:</th>
			<td width="220"><h2>{$tipo}</h2></td>
			<th class="top">Posti disponibili:</th>
			<td width="220"><h2>{$posti_disponibili}</h2></td>
			</tr>
			<tr class="normale">
			<th class="top">Costo a persona:</th>
			<td width="220"><h2>{$costo}&nbsp€</h2></td>
			</tr>
			<tr class="normale">
			<th class="top">Note:</th>
			<td  colspan="3"><p><h3><b>{$note}</b></h3></p></td>
			</tr>
		   </table>
		   
			{if ($loggato && !$isPasseggero && !$isGuidatore && $posti_disponibili>0)}
			
                <p class="center"><input type="button" id="partecipa" class="button_center" name="{$num_viaggio}" value="Partecipa" tabindex="1" /></p>
                
            {/if}
            {if $isPasseggero}
                <p class="center"><input type="button" id="cancellami" class="button_center" name1="{$num_viaggio}" name2="{$username_passeggero}" value="Cancellami" tabindex="1" /></p>
			
			{/if}
			
            </div>
			</div>
    <h1 class="block">Informazioni veicolo</h1>
        <div class="contactform">
            <p><label class="left">Targa:</label><label class="left">&nbsp<b>{$targa}</label></b><br></p>
            <p><label class="left">Tipo:</label><label class="left">&nbsp<b>{$tipo}</b></label><br></p>
            <p><label class="left">Posti:</label><label class="left">&nbsp<b>{$num_posti}</b><br></label><br></p>
            <p><label class="left">Carburante:</label><label class="left">&nbsp<b>{$carburante}</b></label><br></p>
            <p><label class="left">Consumo medio:</label><label class="left">&nbsp<b>{$consumo_medio}</b>&nbsp (Km con 1 litro)</label><br></p>
        <br>
        </div>
    <h1 class="block">Passeggeri partecipanti</h1>
        <div class="contactform">
            {if $array_passeggeri}
                <hr><br>
                {section name=nr loop=$array_passeggeri}
                    <div>
                        <br>
			<p><a class="visualizza_utente"  name="{$partecipa}" value="{$array_passeggeri[nr].username_passeggero}"><label class="left pulsante">{$array_passeggeri[nr].username_passeggero} </label></a> {if ($array_passeggeri[nr].feedback_guid==0)  && $isGuidatore}<input type="button"  class="feedback_passeggero button_left" name1="{$array_passeggeri[nr].username_passeggero}" name2="{$num_viaggio}" value="Feedback" tabindex="1" />{if $passato==false}<input type="button"  class="elimina_passeggero button_left" name1="{$array_passeggeri[nr].username_passeggero}" name2="{$num_viaggio}" value="Elimina" tabindex="2" />{/if}<br>{else}<br>{/if}</p>
                    </div>  
                <hr>
                <br>
                {/section}
            {else}
                <br>
                <h3> Non ci sono ancora passeggeri</h3>    
            {/if}
        </div>
        {if $isGuidatore || $isAmministratore}
            <div class="contactform">
                <h1 class="block"> Modifica viaggio </h1>
                {if $passato==false}
                <div>
                    <p class="center"><input type="button" class="elimina_viaggio button_center" name="{$num_viaggio}" value="Elimina viaggio" tabindex="8" /></p>
                </div>
                {/if}
            </div>
        {/if}
            <div class="contactform">
                {if $indietro}
                    <p class="center"><input type="button" class="indietro button_left" value="Indietro" tabindex="8" /></p><br><br>
            </div>
                {/if}
</div>