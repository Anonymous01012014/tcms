<div id="container" class="col-md-8 col-md-offset-2">
	<h1 class="title">Add User</h1>
	<hr />
	<div id="error" ></div>
	<form method="post" action="<?php echo base_url();?>user/saveData/edit/<?php echo $user['id'];?>" >
		<table id="addFormTable">
				
			
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
					<input type="text" name="username" id="username" value="<?php echo $user['username'];?>"/>
				</td>				
			</tr>
			
			<tr>
				<td>
					<label for="password">Password:</label>
				</td>
				<td>
					<input type="password" name="password" id="password"/>
				</td>
			</tr>
				
			<tr>
				<td>
					<label for="re_password">Retype Password:</label>
				</td>
				<td>
					<input type="password" name="re_password" id="re_password"/>
				</td>
			</tr>
			<tr>
		
				<td>
					<label for="type">Role</label>
				</td>
				<td>
					<select type="text" name="type" id="type">
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
								
				<td colspan="3">
					<input type="text" name="first_name" id="first_name" placeholder="first name" value="<?php echo $user['first_name'];?>"/>
								
					<input type="text" name="middle_name" id="middle_name" placeholder="middle name" value="<?php echo $user['middle_name'];?>"/>
				
					<input type="text" name="last_name" id="last_name" placeholder="last name"  value="<?php echo $user['last_name'];?>"/>
				</td>
			</tr>	
			
			
			<tr>
				<td>
					<label for="phone_number">Phone:</label>
				</td>
				<td>
					<input type="text" name="phone_number" id="phone_number" value="<?php echo $user['phone_number'];?>"/>
				</td>
				<td>
					<label for="mobile_number">Mobile:</label>
				</td>
				
				<td align="right">				
					<input type="text" name="mobile_number" id="mobile_number" value="<?php echo $user['mobile_number'];?>"/>
				</td>
			</tr>	
			
			<tr>
				<td>
					<label style="vertical-align: middle; padding-bottom: 30px;" for="address">Address:</label>
				</td>
				<td colspan="3">
					<textarea  name="address" id="address"><?php echo $user['address'];?></textarea>
				</td>
			</tr>
			
			<tr>
				<td>
					<button type="submit" class="btn btn-info" id="btn_edit">
						<span class="glyphicon glyphicon-ok"></span> Save
					</button>
					
					<button type="Button" class="btn btn-default" id="btn_cancel" onclick="location.assign('<?php echo base_url();?>dashboard');">
						<span class="glyphicon glyphicon-remove"></span> Cancel
					</button>
				</td>	
			</tr>
					
		</table>
		
	</form>
</div>
		
