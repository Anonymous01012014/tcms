<div id="container" class="col-md-8 col-md-offset-2">
	<h1 class="title">Modify User Data</h1>
	<hr />
	<div id="status_message" style="display: none;">
		
	</div>
	<form method="post" action="<?php echo base_url();?>user/saveData/edit/<?php echo $user['id'];?>" >
		<table id="addFormTable">
				
			<input type="hidden" id="old_username" name="old_username" value="<?php echo $user['username'];?>" />
			<input type="hidden" id="hire_date" name="hire_date" value="<?php echo $user['hire_date'];?>" />
			<tr>
				<td>
					<h3 class="title" >Login Information</h3>
				</td>
			</tr>
			<tr>				
				<td>
					<label for="username" >Username:</label>
				</td>
				<td>
					<input class="form-control" type="text" name="username" id="username" value="<?php echo $user['username'];?>" placeholder="username"/>
				</td>				
			</tr>
			
			<tr>
				<td>
					<label for="password">Password:</label>
				</td>
				<td>
					<input class="form-control" type="password" name="password" id="password"/>
				</td>
			</tr>
				
			<tr>
				<td>
					<label for="re_password">Retype Password:</label>
				</td>
				<td>
					<input class="form-control" type="password" name="re_password" id="re_password"/>
				</td>
			</tr>
			<tr>
		
				<td>
					<label for="type">Role</label>
				</td>
				<td>
					<select class="form-control" type="text" name="type" id="type">
						<option value="0" <?php if($user['type'] == 0) echo 'selected';?>>Admin</option>
						<option value="1" <?php if($user['type'] == 1) echo 'selected';?>>Collector</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<h3 class="title">Personal Information</h3>
				</td>
			</tr>
			
			<tr>
				<!-- fullname -->
				<td>
					<label for="first_name">Full Name:</label>
				</td>
								
				<td >
					<input class="form-control" type="text" name="first_name" id="first_name" placeholder="first name" value="<?php echo $user['first_name'];?>"/>
				</td>
								
				<td >		
					<input class="form-control" type="text" name="middle_name" id="middle_name" placeholder="middle name" value="<?php echo $user['middle_name'];?>"/>
				</td>
								
				<td >
					<input class="form-control" type="text" name="last_name" id="last_name" placeholder="last name"  value="<?php echo $user['last_name'];?>"/>
				</td>
			</tr>	
			
			
			<tr>
				<td>
					<label for="phone_number">Phone:</label>
				</td>
				<td>
					<input class="form-control" type="text" name="phone_number" id="phone_number" value="<?php echo $user['phone_number'];?>"/>
				</td>
				<td>
					<label for="mobile_number">Mobile:</label>
				</td>
				
				<td align="right">				
					<input class="form-control" type="text" name="mobile_number" id="mobile_number" value="<?php echo $user['mobile_number'];?>"/>
				</td>
			</tr>	
			
			<tr>
				<td>
					<label style="vertical-align: middle; padding-bottom: 30px;" for="address">Address:</label>
				</td>
				<td colspan="3">
					<textarea class="form-control"  name="address" id="address"><?php echo $user['address'];?></textarea>
				</td>
			</tr>
			
			<tr>
				<td>
					<button type="button" class="btn btn-info" id="btn_edit" onclick="validateInputs()">
						<span class="glyphicon glyphicon-ok"></span> Save
					</button>
					
					<button type="Button" class="btn btn-default" id="btn_cancel" onclick="location.assign('<?php echo base_url();?>dashboard');">
						<span class="glyphicon glyphicon-remove"></span> Cancel
					</button>
				</td>	
			</tr>
					
		</table>
		
	<button type="submit" id="submit" style="display: none;"/>
	</form>
</div>

<script>
	function validateInputs(){
	var name = $('input#username').val();
	var oldName = $('input#old_username').val();
	var pass = $('input#password').val();
	var re_pass = $('input#re_password').val();
		$.get('<?php echo base_url();?>'+'user/getUserByUsername?username='+name+'&old_username='+oldName,function(data){
			if(data){
				$('#status_message').html('<div class="alert alert-danger alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true" onclick="hideMessage();">&times;</button>This username already exists in the database!!</div>');
				$('#status_message').slideDown();
			}else{
				if(pass == re_pass)
					$('form button#submit').click();
				else{
					$('#status_message').html('<div class="alert alert-danger alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true" onclick="hideMessage();">&times;</button>Password and repeat password fields must match!</div>');
					$('#status_message').slideDown();
				}
			}
		});
}
function hideMessage(){
			$('#status_message').hide();
	}	
</script>

		
