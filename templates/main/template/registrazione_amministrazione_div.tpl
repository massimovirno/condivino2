<script src="js/amministrazione_utenti.js"></script>
<br>
{if $attivo}
    {if ($amministratore)}
        <div id="utente_amministratore">
            <p>Tipo utente: <b> Amministratore</b></p>
            <p><input type="button" class="button_center" id="rendi_utente" value="◄ Utente default" name="{$username}"></P>
        </div>
    {else}
        <div id="utente_normale">
            <p>Tipo utente: <b>Utente default</b></p>
            <p><input type="button" class="button_center" id="rendi_amministratore" value="► Amministratore" name="{$username}"></p>
        </div>
    {/if}
    <br><br>
    <div id="utente_attivo">
        <p>Stato: <b> Attivo </b></p>
        <p><input type="button" class="button_center" id="disattiva_account" value="◄ Disattiva" name="{$username}"></p>
    </div>
{else}
    <div id="utente_non_attivo">
        <p>Stato:<b> Non attivo</b></p>
        <p><input type="button" class="button_center" id="attiva_account" value="► Attiva" name="{$username}"></p>
    </div>
{/if}