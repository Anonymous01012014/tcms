<div id="container" class="col-md-8 col-md-offset-2">
	<h1 class="title">Login</h1>
	<hr />
	<div id="error"><?php if($is_post_back)echo validation_errors();?></div>
	<form method="post" action="<?php echo base_url();?>login_user/login" id="login" >
		<p>
			<label for="username" id="username">User:</label>
			<input type="text" name="username" id="username" required/>
		</p>
		<p>
			<label for="password" id="password">Password:</label>
			<input type="password" name="password" id="password" required/>
		</p>	
		<button type="submit" class="btn btn-default btn-lg" id="btn_login">
			<span class="glyphicon glyphicon-ok"></span> Enter
		</button>
		</a>
	</form>
	

</div>
		
