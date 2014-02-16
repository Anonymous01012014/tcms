<div id="container" class="col-md-8 col-md-offset-2">
	<h1 class="title">Add Site</h1>
	<hr />
	<form method="post" action="<?php echo base_url();?>site/saveData" >
		<table id="addFormTable">
			<tr>
				<td >
					<label for="name">Site Name:</label>
					<input type="text" name="name" id="name" />
				</td>
				<td>
					<label for="FIPS">FIPS Name:</label>
					<select type="text" name="FIPS" id="FIPS" >
						<?php
							for($i=0;$i<=56;$i++){
								$FIPS_name = FIPS_text($i);
								if(isset($FIPS_name)){
						?>
						<option value="<?php echo $i; ?>"><?php echo $FIPS_name; ?></option>
						<?php
								}
							}
						?>
					</select>
				</td>
			</tr>
		
			<tr>
				<td >
					<label for="longitude">Longitude:</label>
					<input type="text" name="longitude" id="longitude" />
				</td>
				<td>
					<label for="latitude">Longitude:</label>
					<input type="text" name="latitude" id="latitude" />
				</td>
			</tr>
			
			<tr>
				<td >
					<label for="startDate">Start Date:</label>
					<input type="text" name="startDate" id="startDate" />
				</td>
				<td >
					<label style="vertical-align: middle; padding-bottom: 30px;" for="address">Address:</label>
					<textarea name="address" id="address" ></textarea>
				</td>
			</tr>
			
			<tr>
				<td>
					<label for="functionalClass">Site Class:</label>
					<select type="text" name="functionalClass" id="FunctionalClass" >
						<?php
							for($i=0;$i<=56;$i++){
								$functional_class_name = functional_class_text($i);
								if(isset($functional_class_name)){
						?>
						<option value="<?php echo $i; ?>"><?php echo $functional_class_name; ?></option>
						<?php
								}
							}
						?>
					</select>
				</td>
				<td >
					<label for="laneCount">Count of Lanes:</label>
					<input type="text" name="laneCount" id="laneCount" />
				</td>
				
			</tr>
			
		</table>
		<button type="submit" class="btn btn-default btn-lg" id="btn_add">
			<span class="glyphicon glyphicon-ok"></span> Add
		</button>
		<a href="<?php echo base_url();?>dashboard">
		<button type="Button" class="btn btn-danger btn-lg" id="btn_cancel">
			<span class="glyphicon glyphicon-remove"></span> Cancel
		</button>
		</a>
	</form>
	

</div>
		
