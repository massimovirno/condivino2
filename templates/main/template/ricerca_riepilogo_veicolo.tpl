<br>
<script src="js/veicolo.js"></script>
<h1 class="pagetitle">Dati veicolo</h1>
<!-- Content unit - One column -->
<div> 
    <h1 class="block">Dettagli del veicolo</h1>
    <div class="column1-unit">
        <div class="contactform">            
            <p class="center"><label class="center-title">Targa:</label><label class="center-title">&nbsp<b>{$targa}</label></b><br></p>
            <p><label class="left">Tipo:</label><label class="left">&nbsp<b>{$tipo}</b></label><br></p>
            <p><label class="left">Posti:</label><label class="left">&nbsp<b>{$num_posti}</b><br></label><br></p>
            <p><label class="left">Carburante:</label><label class="left">&nbsp<b>{$carburante}</b></label><br></p>
            <p><label class="left">Consumo medio:</label><label class="left">&nbsp<b>{$consumo_medio}</b>&nbsp (Km con 1 litro)</label></p>       
            <div>
				<br>
                <p class="center"><input type="button" class="elimina_veicolo button_center" tabindex="1" value="Elimina veicolo" name="{$targa}"/></p>
            </div>
        </div>              
    </div>
</div>