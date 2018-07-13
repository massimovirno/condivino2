<br>
<script src="js/gestisci_profilo.js"></script>
<h1 class="pagetitle">Gestisci profilo</h1>
<h1 class="block">&nbsp{$username}&nbsp&nbsp({$nome}&nbsp{$cognome})</h1>
        <div class="column1-unit">
            <div class="contactform">  
					<p class="center"><label class="center-title">Immagine del profilo:</label></p><br>
                    <p><img class="center" src={$immagine_profilo} alt="Image description" height="200" width="200"/></p><br>
                <div>
                    <form action="index.php" method="post" enctype="multipart/form-data" name="carica_immagine">
                        <input type="hidden" name="controller" value="registrazione" />
                        <input type="hidden" name="task" value="carica_immagine" />    
                        <p class="center"><label for="img" class="center-title">Cambia immagine del profilo:</label></p><br>
						<p class="center"><input type="file" name="img" style="font-weight: bold;"/>
                        <input type="submit" class="button_center" name="carica_immagine"  value="Carica immagine" tabindex="5" /></p>
                    </form>
                </div>
				<hr>
				<br>
            <p><label for="modifica_password" class="center-title">Modifica password:</label>
            <input type="button" name="modifica_password" id="modifica_password" class="button_center" value="Modifica" tabindex="6" /></p>
            </div>
        </div>
        <h1 class="block"> I tuoi veicoli </h1>
        <div class="coloum1-unit">
            <div class="contactform">
                {if $array}
                    <table>
                        <tr>
                            <th class="mini">
                                <div>Targa</div>
                            </th>
                            <th class="mini">
                                <div>Tipo</div>
                            </th>
                            </tr>
                    {section name=nr loop=$array}     
                        <tr class="riepilogo_veicolo pulsante" value="{$array[nr].targa}">
                            <td>
                                <div>{$array[nr].targa}</div>
                            </td>
                            <td>
                                <div><b>{$array[nr].tipo}</b></div>
                            </td>
                        </tr>
                    {/section}
                    </table>
                {else}
                    <p class="center"><label class="center-title"> Non ci sono veicoli!</label></p>  
                {/if}
                <p class="center"><input type="button" id="submit_veicolo_da_profilo" class="button_center" value="Aggiungi un veicolo" tabindex="5" /></p>
                <br><br><br>
            </div>
        </div>