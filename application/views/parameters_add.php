<!-- set the fields that will be multiplied :) -->


<div id="container" class="col-md-8 col-md-offset-2">
	<h1 class="title">TSDP parameters</h1>
	<hr />	
		

	<form method="post" action="<?php echo base_url();?>analyze/analyzFile" >
		
		<input type="hidden" name="case_id" value="<?php echo $case_id;?>"/>
		
		<table id="addFormTable" >
			<tr>
				<!-- Type of analyze -->
				<td>
					<label for="analysis_type">Type of analyze:</label>
				</td>
				
				<td>
					<select name="analysis_type" class="form-control">
						<option value="volume">Volume</option>
						<option value="classification">Classification</option>
					</select>
				</td>
				
				<!-- lane number -->
				<td>
					<label for="num_lane">Number of lane:</label>
				</td>
				
				<td>
					<select name="num_lane" class="form-control">
						<option value="1">1</option>
						<option value="2">2</option>
					</select>
				</td>								
			</tr>
		
		
			<tr>
				<!-- lane direction -->
				<td>
					<label for="lane_direction">Lane direction:</label>
				</td>
				
				<td>
					<select name="lane_direction" class="form-control">
						<option value="oneWay">oneWay</option>
						<option value="twoWay">towWay</option>
					</select>
				</td>
				
				<!-- tude-->
				<td>
					<label for="tude">Tube:</label>
				</td>
				
				<td>
					<select name="tube" class="form-control">
						<option value="normal">normal</option>
						<option value="shortLong">shortLong</option>
						<option value="directional">directional</option>
					</select>
				</td>
				
			</tr>
		
		
			<tr>
				<!-- sensor spacing-->
				<td>
					<label for="sensor_spacing">Sensor spacing:</label>
				</td>
				
				<td>
					<input type="text" name="sensor_spacing" value="48" class="form-control"/>
				</td>
				
				
			</tr>
		
		
			
			<tr>
				<td colspan="2">
					<button type="submit" class="btn btn-info" id="btn_add" >
						<span class="glyphicon glyphicon-ok">Analyze</span> 
					</button>
					
					<button type="Button" class="btn btn-default" id="btn_cancel" onclick="location.assign('<?php echo base_url();?>dashboard');">
						<span class="glyphicon glyphicon-remove">Cancel</span> 
					</button>			
				</td>
			</tr>
			
		</table>

		
	</form>
	

</div>


