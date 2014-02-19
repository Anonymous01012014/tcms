<script>	
	$(document).ready(function() {		
	    gridRender('user');
	}); 
</script>

<div id="container" class="col-md-8 col-md-offset-2">
	<h1 class="title">Manage Users</h1>
	<hr />
	
		
		<div class="grid">
			<table id="user" action="<?php echo base_url();?>user/ajaxGetUsers" dir="ltr">				
				<tr>
					<th col="full_name" type="text">Full Name</th>
					<th col="type"  type="text">Position</th>		
					<th col="phone_number" type="text">Phone</th>
					<th col="mobile_number" type="text">Mobile</th>
					<th col="hire_date" type="date">Hire Date</th>					
				</tr>										
			</table>	
		</div>

	

</div>
		
