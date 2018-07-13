<!-- LOGIN -->
<script src="js/login.js"></script>
<div class="main-navigation">
        <h1>Login</h1>
        <div class="loginform">
          <form method="post" action="index.php"> 
            <p><input type="hidden" name="rememberme" value="0" /></p>
            <p><input type="hidden" name="controller" value="registrazione" /></p>
            <p><input type="hidden" name="task" value="autentica" /></p>
            <fieldset>
              <p><label for="username_1" class="top">Username:</label><br />
                <input type="text" name="username" id="username_1" tabindex="20" class="field" value="" /></p>
    	      <p><label for="password_1" class="top">Password:</label><br />
                <input type="password" name="password" id="password_1" tabindex="21" class="field" value="" /></p>
    	      <p><input type="submit" name="cmdweblogin" class="button" value="LOGIN"  /></p>
	      <p><a class="pulsante" id="forgotpwd">Password dimenticata?</a></p>
              <p><a href="index.php?controller=registrazione&task=registra" id="forgotpsswd_1">Non sei registrato?</a></p>
	    </fieldset>
          </form>
        </div>
</div>