<div id="menu_vini">
      <p><label for="vino_evento" class="left1">Scegli un vino:</label>
         <select name="vino_evento" id="vino_evento" class="vini combo"> 
               {section name=nr loop=$vini}
                       <option value="{$vini[nr].nome_vino}"><h5>{$vini[nr].nome_vino}</h5></option>
               {/section}
         </select></p>
</div>