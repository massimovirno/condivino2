<script src="js/valutazione.js"></script>
<br>
<h1 class="pagetitle">Rilascia un feedback a {$username_oste}</h1>
<!-- Content unit - One column -->
<div> 
    <h1 class="block">Evento: &nbsp{$num_evento} da: {$citta_partenza} a: {$citta_arrivo} del {$data_partenza}</h1>
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
			 
        

            <p class="center"><input type="button" id="valuta" class="button_center" name="{$num_evento}" value="Valuta" tabindex="3" /></p>
            <br>           
            <br>
        </div>              
    </div>
</div>
