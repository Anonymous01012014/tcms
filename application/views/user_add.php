<div id="container" class="col-md-8 col-md-offset-2">
	<h1 class="title">Add User</h1>
	<hr />
	<div id="status_message" style="display: none;">
		
	</div>
	<form method="post" action="<?php echo base_url();?>user/saveData/add" >
		<table id="addFormTable">
				
			
			<tr>
				<td colspan="2">
					<h3 class="title" >Login Information</h3>
				</td>
			</tr>
			<tr>				
				<td>
					<label for="username">Username:</label>
				</td>
				<td>
					<input class="form-control" type="text" name="username" id="username" placeholder="username" required="required"/>
				</td>				
			</tr>
			
			<tr>
				<td>
					<label for="password">Password:</label>
				</td>
				<td>
					<input type="password" class="form-control" name="password" id="password" placeholder="password" required/>
				</td>
			</tr>
				
			<tr>
				<td>
					<label for="re_password">Repeat Password:</label>
				</td>
				<td>
					<input type="password" class="form-control" name="re_password" id="re_password" placeholder="repeat password" required/>
				</td>
			</tr>
			<tr>
		
				<td>
					<label for="type">Role</label>
				</td>
				<td>
					<select class="form-control" type="text" name="type" id="type">
						<option value="0">Admin</option>
						<option value="1">Collector</option>
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
								
				<td>
					<input type="text" class="form-control col-xs-1" name="first_name" id="first_name" placeholder="first name" required/>
				</td>
				<td>				
					<input type="text" class="form-control col-xs-1" name="middle_name" id="middle_name" placeholder="middle name"/>
				</td>
				<td>
					<input type="text" class="form-control col-xs-1" name="last_name" id="last_name" placeholder="last name" required/>
				</td>
			</tr>	
			
			
			<tr>
				<td>
					<label for="phone_number">Phone:</label>
				</td>
				<td>
					<input type="text" class="form-control" name="phone_number" id="phone_number" placeholder="phone number"/>
				</td>
				<td>
					<label for="mobile_number">Mobile:</label>
				</td>
				
				<td align="right">				
					<input type="text" class="form-control" name="mobile_number" id="mobile_number" placeholder="mobile number"/>
				</td>
			</tr>	
			
			<tr>
				<td>
					<label style="vertical-align: middle; padding-bottom: 30px;" for="address">Address:</label>
				</td>
				<td colspan="3">
					<textarea class="form-control"  name="address" id="address" placeholder="address"></textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<button type="button" class="btn btn-info" id="btn_add" onclick="validateInputs()">
						<span class="glyphicon glyphicon-ok"></span> Add
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
	var pass = $('input#password').val();
	var re_pass = $('input#re_password').val();
		$.get('<?php echo base_url();?>'+'user/getUserByUsername?username='+name,function(data){
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
