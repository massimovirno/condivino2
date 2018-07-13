<script src="js/ricerca_amministrazione_utenti.js"></script>
<div class="column1-unit">
    <div> 
        {if $utenti}
            <h1 class="block"> Risultati ricerca</h1>
                <div style="width:650px;height:800px;overflow-y: scroll; border:1px solid white;">
                    <table width:650px;>
                        <tr>
				<th class="top">
					<div name="username">Username  ▼</div>
				</th>
				<th class="top">
					<div name="nome">Nome  </div>
				</th>
				<th class="top">
					<div name="cognome">Cognome  </div>
				</th>
				<th class="top">
					<div name="citta_residenza">Città di residenza  </div>
				</th>
			</tr>
            {section name=nr loop=$utenti}
			<tr> 
				<td>
                    <div><a class="visualizza_utente pulsante" value="{$utenti[nr].username}">{$utenti[nr].username}</a></div>
				</td>
				<td>
                    <div>{$utenti[nr].nome}</div>
				</td>
				<td>
                    <div>{$utenti[nr].cognome}</div>
				</td>
				<td>
                    <div>{$utenti[nr].citta_residenza}</div>
				</td>
			</tr>
            {/section}
			</table>
                  </div>
        {else}
			<div class="contactform">
            <p class="center"><label class="center-title"> Nessun utente trovato!</label></p>  
			</div>
        {/if}
    </div>
</div>