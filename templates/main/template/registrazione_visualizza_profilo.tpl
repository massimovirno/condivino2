<script src="js/index.js"></script>
<br>
<h1 class="pagetitle">Il tuo profilo</h1>
<h1 class="block">&nbsp{$username}&nbsp</h1>
<div class="column1-unit">
    <div class="contactform">
        <h1><b>{$nome}&nbsp{$cognome}</b></h1>
        <h3>{$citta_residenza}</h3>   
		
		
		
        <p><img src={$immagine_profilo} alt="Image description" height="200" width="200"/></p>
        <p>Valutazione guidatore:
		{section name=i loop=$media_feedback_guidatore} 
		 <img class="star" src="templates/main/template/img/star1.png" alt="imgstar" width="20" heigth="20"/>
		{/section}({$num_viaggi_guid} viaggi)</p>
        <p>Valutazione passeggero: {section name=i loop=$media_feedback_passeggero} 
		 <img class="star" src="templates/main/template/img/star1.png" alt="imgstar" width="20" heigth="20"/>
		{/section}({$num_voti_pass} voti)</p>
	    <p>Email:<b>&nbsp{$email}</b></p>
        <p>Numero di telefono:<b>&nbsp{$num_telefono}</b></p>
        <p>Data di nascita:<b>&nbsp{$data_nascita}</b></p>
        <p>Città di nascita:<b>&nbsp{$citta_nascita}</b></p><br><br><br><br>
    </div>
</div>
	<h1 class="block">Feedback ricevuti da {$username} per i passaggi offerti</h1>
<div class="column1-unit">
	<div class="contactform">
		{if $array_commenti_guidatore}
		   <table>
			<th class="top">
                            <div>Commento dei passeggeri</div>
			</th>
			<th class="mini">
                            <div>Media voto </div>
			</th>
			<th class="mini">
                            <div>ID </div>
			</th>
                    </tr>
			</table>
			<div class="contenitore">
			<table>
				
                    {section name=nr loop=$array_commenti_guidatore}
                        <tr class="riepilogo_viaggio pulsante" value="{$array_commenti_guidatore[nr].num_viaggio}"> 
                            <td width="35%">
								<div>
								{if $array_commenti_guidatore[nr].num_voti>0}
									{$array_commenti_guidatore[nr].commento}
								{else}
									[Nessun commento]
								{/if}
                            </td>
                            <td width="25%">
                                <div>
								{if $array_commenti_guidatore[nr].num_voti>0}
								{section name=i loop=$array_commenti_guidatore[nr].voto_totale/$array_commenti_guidatore[nr].num_voti} 
										<img class="star" src="templates/main/template/img/star1.png" alt="imgstar" width="20" heigth="20"/>
								{/section}
								{else}
									[Nessun voto]
								{/if}
								</div>
                            </td>
                             <td width="25%">
                                <div>
									{$array_commenti_guidatore[nr].num_viaggio}
								</div>
								
                            </td>
			</tr>
                    {/section}
			</table>
		{else}
		<p class="center"><label class="center-title"> Nessun viaggio presente!</label></p>
		{/if}
	</div>
	</div>
	</div>
	<h1 class="block">Feedback ricevuti da {$username} come passeggero </h1>
	<div class="column1-unit">
	<div class="contactform">
		{if $array_commenti_passeggero}
		   <table>
			<th class="top">
                            <div>Commento </div>
			</th>
			<th class="mini">
                            <div>Voto</div>
			</th>
			<th class="mini">
                            <div>ID</div>
			</th>
                    </tr>
			</table>
			<div class="contenitore">
			<table>
				
                    {section name=nr loop=$array_commenti_passeggero}
                        <tr class="riepilogo_viaggio pulsante" value="{$array_commenti_passeggero[nr].num_viaggio}"> 
                            <td width="35%">
								<div>
								{if $array_commenti_passeggero[nr].feedback_guid !=0}
									{$array_commenti_passeggero[nr].commento_guid}
								{else}
									[Nessun commento]
								{/if}
                            </td>
                            <td width="25%">
                                <div>
								{if $array_commenti_passeggero[nr].feedback_guid !=0}
									{section name=i loop=$array_commenti_passeggero[nr].feedback_guid} 
										<img class="star" src="templates/main/template/img/star1.png" alt="imgstar" width="20" heigth="20"/>
									{/section}
								{else}
									[Nessun voto]
								{/if}
								</div>
                            </td>
                             <td width="25%">
                                <div>
									{$array_commenti_passeggero[nr].num_viaggio}
								</div>
								
                            </td>
			</tr>
                    {/section}
		{else}
		<p class="center"><label class="center-title"> Nessun viaggio presente!</label></p>
		{/if}
	</div>
	</div>