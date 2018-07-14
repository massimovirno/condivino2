<div id="menu_vini">
      <p><label for="nome_vino" class="left1">Scegli un vino:</label>
         <select name="nome_vino" class="vini combo"> 
               {section name=nr loop=$vini}
                       <option value="{$vini[nr].nome_vino}"><h5>{$vini[nr].nome_vino}</h5></option>
               {/section}
         </select></p>
</div>