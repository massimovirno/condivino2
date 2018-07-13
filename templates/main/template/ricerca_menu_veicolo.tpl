<div id="menu_veicoli">
      <p><label for="targa" class="left1">Scegli un veicolo:</label>
         <select name="targa" class="veicoli combo"> 
               {section name=nr loop=$veicoli}
                       <option value="{$veicoli[nr].targa}"><h5>{$veicoli[nr].targa}</h5></option>
               {/section}
         </select></p>
</div>