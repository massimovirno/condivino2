<br>
<script src="js/vino.js"></script>
<h1 class="pagetitle">Dati vino</h1>
<!-- Content unit - One column -->
<div> 
    <h1 class="block">Dettagli del vino</h1>
    <div class="column1-unit">
        <div class="contactform">            
            <p class="center"><label class="center-title">Nome vino:</label><label class="center-title">&nbsp<b>{$nome_vino}</label></b><br></p>
            <p><label class="left">Produttore:</label><label class="left">&nbsp<b>{$produttore}</b></label><br></p>
            <p><label class="left">Detonazione:</label><label class="left">&nbsp<b>{$denominazione}</b><br></label><br></p>
            <p><label class="left">Vitigno:</label><label class="left">&nbsp<b>{$vitigno}</b></label><br></p>
            <p><label class="left">Anno:</label><label class="left">&nbsp<b>{$anno}</b></label></p>
            <p><label for="descrizione" class="mini">Descrizione:</label>
            <textarea readonly name="descrizione" maxlength="300" id="descrizione" cols="45" rows="7" >{$descrizione}</textarea></p>
            
            <p><label class="left">Etichetta:</label><label class="left">&nbsp<b>{$immagine_vino}</b></label></p>       
            <div>
				<br>
                <p class="center"><input type="button" class="elimina_vino button_center" tabindex="1" value="Elimina vino" name="{$nome_vino}"/></p>
            </div>
        </div>              
    </div>
</div>