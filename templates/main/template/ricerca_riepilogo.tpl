<br>
<script src="js/riepilogo.js"></script>
<h1 class="pagetitle">Dati evento</h1>
<div>
<!-- Content unit - One column -->
    <h1 class="block">Riepilogo del evento &nbsp{$num_evento}</h1>
    <div class="column1-unit">
        <div class="contactform">
            {if ($isPartecipante || $isOste)}
                <p class="center"><label class="center-title">Partecipi a questo evento!</p>
            {/if}
			 {if $posti_disponibili<1 && !$isPartecipante}
                <p class="center"><label class="center-title">Non ci sono più posti disponibili!</label></p>
             {/if}
            <p class="center"><b>organizzato da:</b>&nbsp<label class="center pulsante"><a class="visualizza_utente"  name="{$partecipa}" value="{$username_oste}">{$username_oste}</a></label>{if ($isPartecipante && !$votato)}<input type="button" id="feedback" class="button_center" name="{$num_evento}" value="Feedback" tabindex="1" />{/if}</p>
           <table>
		   <tr class="normale">
			<th class="top">Nome evento:</th>
			<td colspan="2"><h2>{$nome_evento}</h2></td>
			</tr>
			<tr class="normale">
			<th class="top">Data evento:</th>
			<td colspan="2"><h2>{$data_evento}</h2></td>
			</tr>
			<tr class="normale">
			<th class="top">Vino:</th>
			<td colspan="2"><h2>{$vino_evento}</h2></td>
                        </tr>

			<tr class="normale">
			<th class="top">Costo a persona:</th>
			<td width="220"><h2>{$costo}&nbsp€</h2></td>
			<th class="top">Posti disponibili:</th>
			<td width="220"><h2>{$posti_disponibili}</h2></td>
			</tr>
			<tr class="normale">
			<th class="top">Note:</th>
			<td  colspan="3"><p><h3><b>{$note}</b></h3></p></td>
			</tr>
		   </table>
		   
			{if ($loggato && !$isPartecipante && !$isOste && $posti_disponibili>0)}
			
                <p class="center"><input type="button" id="partecipa" class="button_center" name="{$num_evento}" value="Partecipa" tabindex="1" /></p>
                
            {/if}
            {if $isPartecipante}
                <p class="center"><input type="button" id="cancellami" class="button_center" name1="{$num_evento}" name2="{$username_partecipante}" value="Cancellami" tabindex="1" /></p>
			
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
            <br>
            <p><label class="left">Etichetta:</label><label class="left">&nbsp<b>{$immagine_vino}</b></label><br></p>
        <br>
        </div>
    <h1 class="block">Partecipanti</h1>
        <div class="contactform">
            {if $array_partecipanti}
                <hr><br>
                {section name=nr loop=$array_partecipanti}
                    <div>
                        <br>
			<p><a class="visualizza_utente"  name="{$partecipa}" value="{$array_partecipanti[nr].username_partecipante}"><label class="left pulsante">{$array_partecipanti[nr].username_partecipante} </label></a> {if ($array_partecipanti[nr].feedback_oste==0)  && $isOste}<input type="button"  class="feedback_partecipante button_left" name1="{$array_partecipanti[nr].username_partecipante}" name2="{$num_evento}" value="Feedback" tabindex="1" />{if $passato==false}<input type="button"  class="elimina_partecipante button_left" name1="{$array_partecipanti[nr].username_partecipante}" name2="{$num_evento}" value="Elimina" tabindex="2" />{/if}<br>{else}<br>{/if}</p>
                    </div>  
                <hr>
                <br>
                {/section}
            {else}
                <br>
                <h3> Non ci sono ancora partecipanti</h3>    
            {/if}
        </div>
        {if $isOste || $isAmministratore}
            <div class="contactform">
                <h1 class="block"> Modifica evento </h1>
                {if $passato==false}
                <div>
                    <p class="center"><input type="button" class="elimina_evento button_center" name="{$num_evento}" value="Elimina evento" tabindex="8" /></p>
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