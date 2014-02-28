<div id="container" class="col-md-4 col-md-offset-4">
	<h1 class="title">Login</h1>
	<hr />
	<div id="error"><?php if($is_post_back)echo validation_errors();?></div>
	<form method="post" action="<?php echo base_url();?>login_user/login" id="login" >
		<table>
			<tr>
				<td>
					<label for="username" id="username">User:</label>					
				</td>
				<td>
					<input type="text" class="form-control" name="username" id="username" required/>
				</td>
			</tr>
			<tr>
				<td>
					<label for="password" id="password">Password:</label>
				</td>
				<td>
					<input type="password" class="form-control" name="password" id="password" required/>
				</td>
			</tr>
			<tr>
				<td>	
					<button type="submit" class="btn btn-info btn-lg" id="btn_login">
						<span class="glyphicon glyphicon-ok"></span> Enter
					</button>
				</td>
			</tr>
	</form>
	

</div>
		
