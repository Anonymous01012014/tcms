<div id="container" class="col-md-8 col-md-offset-2">
	<h1 class="title">Modify Site Data</h1>
	<hr />
	<form method="post" action="<?php echo base_url();?>site/saveData/edit/<?php echo $site['id']; ?>" >
		<table id="addFormTable">
			<tr>
				
				<!-- site name -->
				<td>
					<label for="name">Site Name:</label>
				</td>
				
				<td>
					<input class="form-control" type="text" name="name" id="name" required value="<?php echo $site['name']; ?>"/>
				</td>
				
				<!-- FIPS -->
				<td>
					<label for="FIPS">FIPS Name:</label>
				</td>
				
				<td>
					<select class="form-control" type="text" name="FIPS" id="FIPS" >
						<?php
							for($i=0;$i<=56;$i++){
								$FIPS_name = FIPS_text($i);
								if(isset($FIPS_name)){
						?>
						<option value="<?php echo $i; ?>" <?php if($site['FIPS'] == $i) echo "selected"; ?> ><?php echo $FIPS_name; ?></option>
						<?php
								}
							}
						?>
					</select>
				</td>
			</tr>
		
			<tr>
				<!-- longtitude -->
				<td>
					<label for="longitude">Longitude:</label>
				</td>
				
				<td>
					<input class="form-control" type="text" name="longitude" id="longitude" value="<?php echo $site['longitude']; ?>"/>
				</td>
				
				
				<!-- latitude -->
				<td>
					<label for="latitude">Latitude:</label>
				</td>
				<td>
					<input class="form-control" type="text" name="latitude" id="latitude" value="<?php echo $site['latitude']; ?>"/>
				</td>
			</tr>
			
			<tr>
				<!-- start date -->
				<td >
					<label for="startDate">Start Date:</label>
				</td>
				<td>
					<input class="form-control" type="text" name="startDate" id="startDate" value="<?php echo $site['start_date']; ?>"/>
				</td>
				
				<!-- count of lanes -->
				<td >
					<label for="laneCount">Count of Lanes:</label>
				</td>
				
				<td>
					<input class="form-control" type="text" name="laneCount" id="laneCount" value="<?php echo $site['lane_count']; ?>"/>
				</td>
				
			</tr>
			
			<tr>
				
				<!-- site class -->
				<td>
					<label for="functionalClass">Site Class:</label>
				</td>
				
				<td>
					<select class="form-control" type="text" name="functionalClass" id="functionalClass" >
						<?php
							for($i=0;$i<=56;$i++){
								$functional_class_name = functional_class_text($i);
								if(isset($functional_class_name)){
						?>
						<option value="<?php echo $i; ?>" <?php if($site['functional_class'] == $i) echo "selected"; ?> ><?php echo $functional_class_name; ?></option>
						<?php
								}
							}
						?>
					</select>
				</td>
				
				
				
			</tr>
			
			
			<tr>
				<!-- address -->
				<td>
					<label for="address">Address:</label>
				</td>
				<td colspan="3">
					<textarea class="form-control" name="address" id="address"><?php echo $site['address']; ?></textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<button type="submit" class="btn btn-info" id="btn_add">
						<span class="glyphicon glyphicon-ok">Save</span> 
					</button>
					
					<button type="Button" class="btn btn-default" id="btn_cancel" onclick="location.assign('<?php echo base_url();?>dashboard');">
						<span class="glyphicon glyphicon-remove">Cancel</span> 
					</button>			
				</td>
			</tr>
		</table>
		
		
	</form>
	

</div>
<script type="text/javascript">
	$('input#startDate').datepicker({
		format: "yyyy-mm-dd"
	});
</script>
