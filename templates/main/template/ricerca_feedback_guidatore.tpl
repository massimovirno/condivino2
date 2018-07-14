<script src="js/valutazione.js"></script>
<br>
<h1 class="pagetitle">Rilascia un feedback a {$username_partecipante}</h1>
<!-- Content unit - One column -->
<div> 
    <h1 class="block">Viaggio: &nbsp{$num_viaggio} da: {$citta_partenza} a: {$citta_arrivo} del {$data_partenza}</h1>
    <div class="column1-unit">
        <div class="contactform">
			<table>
				<th class="mini">
				<div id='rate' >Voto:&nbsp</div> 
				</th>
				<th class="top">
				Commento: (facoltativo)
				</th>
				<tr class="normale">
					<td>
						<div id="jqxWidget">
							<div id="jqxRating"></div>
						</div>
					</td>
					<td>
						<textarea name="commento" class="commento" cols="70" rows="5" tabindex="1" maxlength="100"></textarea></p>
					</td>
				</tr>
			</table>
			 
        

            <p class="center"><input type="button" class="valuta_pass button_center" name1="{$username_partecipante}" name2="{$num_viaggio}" value="Valuta" tabindex="3" /></p>
            <br>              
        </div>              
    </div>
</div>
