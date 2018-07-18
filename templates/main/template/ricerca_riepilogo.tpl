<br>
<script src="js/riepilogo.js"></script>
<h1 class="pagetitle">Dati viaggio</h1>
<div>
<!-- Content unit - One column -->
    <h1 class="block">Riepilogo del viaggio &nbsp{$num_viaggio}</h1>
    <div class="column1-unit">
        <div class="contactform">
            {if ($isPartecipante || $isGuidatore)}
                <p class="center"><label class="center-title">Partecipi a questo viaggio!</p>
            {/if}
			 {if $posti_disponibili<1 && !$isPartecipante}
                <p class="center"><label class="center-title">Non ci sono più posti disponibili!</label></p>
             {/if}
            <p class="center"><b>organizzato da:</b>&nbsp<label class="center pulsante"><a class="visualizza_utente"  name="{$partecipa}" value="{$username_guidatore}">{$username_guidatore}</a></label>{if ($isPartecipante && !$votato)}<input type="button" id="feedback" class="button_center" name="{$num_viaggio}" value="Feedback" tabindex="1" />{/if}</p>
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
			<th class="top">Tipo di vino:</th>
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
		   
			{if ($loggato && !$isPartecipante && !$isGuidatore && $posti_disponibili>0)}
			
                <p class="center"><input type="button" id="partecipa" class="button_center" name="{$num_viaggio}" value="Partecipa" tabindex="1" /></p>
                
            {/if}
            {if $isPartecipante}
                <p class="center"><input type="button" id="cancellami" class="button_center" name1="{$num_viaggio}" name2="{$username_partecipante}" value="Cancellami" tabindex="1" /></p>
			
			{/if}
			
            </div>
			</div>
    <h1 class="block">Informazioni vino</h1>
        <div class="contactform">
            <p><label class="left">Nome vino:</label><label class="left">&nbsp<b>{$nome_vino}</label></b><br></p>
            <p><label class="left">Produttore:</label><label class="left">&nbsp<b>{$produttore}</b></label><br></p>
            <p><label class="left">Denominazione:</label><label class="left">&nbsp<b>{$denominazione}</b><br></label><br></p>
            <p><label class="left">Vitigno:</label><label class="left">&nbsp<b>{$vitigno}</b></label><br></p>
            <p><label class="left">Anno:</label><label class="left">&nbsp<b>{$anno}</b></label><br></p>
            <p><label class="left">Descrizione:</label><label class="left">&nbsp<b>{$descrizione}</b></label><br></p>
            <p><label class="left">Etichetta:</label><label class="left">&nbsp<b>{$immagine_vino}</b></label><br></p>
        <br>
        </div>
    <h1 class="block">Passeggeri partecipanti</h1>
        <div class="contactform">
            {if $array_passeggeri}
                <hr><br>
                {section name=nr loop=$array_passeggeri}
                    <div>
                        <br>
			<p><a class="visualizza_utente"  name="{$partecipa}" value="{$array_passeggeri[nr].username_partecipante}"><label class="left pulsante">{$array_passeggeri[nr].username_partecipante} </label></a> {if ($array_passeggeri[nr].feedback_oste==0)  && $isGuidatore}<input type="button"  class="feedback_partecipante button_left" name1="{$array_passeggeri[nr].username_partecipante}" name2="{$num_viaggio}" value="Feedback" tabindex="1" />{if $passato==false}<input type="button"  class="elimina_partecipante button_left" name1="{$array_passeggeri[nr].username_partecipante}" name2="{$num_viaggio}" value="Elimina" tabindex="2" />{/if}<br>{else}<br>{/if}</p>
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