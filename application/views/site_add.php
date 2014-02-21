<!-- set the fields that will be multiplied :) -->
<script type="text/javascript">

$(document).ready(function() {
     
    var sheepItForm = $('#sheepItForm').sheepIt({
        separator: '',
        allowRemoveLast: true,
        allowRemoveCurrent: true,
        allowRemoveAll: true,
        allowAdd: true,
        allowAddN: true,
        maxFormsCount: 10,
        minFormsCount: 0,
        iniFormsCount: 2
    });
 
});

</script>

<div id="container" class="col-md-8 col-md-offset-2">
	<h1 class="title">Add Site</h1>
	<hr />
	<form method="post" action="<?php echo base_url();?>site/saveData" >
		<table id="addFormTable" >
			<tr>
				
				<!-- site name -->
				<td>
					<label for="name">Site Name:</label>
				</td>
				
				<td>
					<input class="form-control" type="text" name="name" id="name" required/>
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
						<option value="<?php echo $i; ?>"><?php echo $FIPS_name; ?></option>
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
					<input class="form-control" type="text" name="longitude" id="longitude" required/>
				</td>
				
				
				<!-- latitude -->
				<td>
					<label for="latitude">Latitude:</label>
				</td>
				<td>
					<input class="form-control" type="text" name="latitude" id="latitude" required/>
				</td>
			</tr>
			
			<tr>
				<!-- start date -->
				<td >
					<label for="startDate">Start Date:</label>
				</td>
				<td>
					<input class="form-control" type="text" name="startDate" id="startDate" />
				</td>
				
				<!-- count of lanes -->
				<td >
					<label for="laneCount">Count of Lanes:</label>
				</td>
				
				<td>
					<input class="form-control" type="text" name="laneCount" id="laneCount" required/>
				</td>
				
			</tr>
			
			<tr>
				
				<!-- site class -->
				<td>
					<label for="functionalClass">Site Class:</label>
				</td>
				
				<td>
					<select class="form-control" type="text" name="functionalClass" id="FunctionalClass" >
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
				
				
				
			</tr>
			
			
			<tr>
				<!-- address -->
				<td>
					<label for="address">Address:</label>
				</td>
				<td colspan="3">
					<textarea class="form-control" name="address" id="address"></textarea>				
				</td>
			</tr>
			
			
			<!-- lane information -->
			<tr>
				<td>
					<h2>Lane Information:</h2>
				</td>
				<td>
					<!-- sheepIt Form -->
					<div id="sheepItForm">
					 
					  <!-- Form template-->
					  <div id="sheepItForm_template" class="form-inline">
					    <label for="sheepItForm_#index#_phone">Lane <span id="sheepItForm_label"></span></label>
					    <input id="sheepItForm_#index#_phone" class="form-control" name="person[phones][#index#][phone]" type="text" size="15" maxlength="10" />
					    
					    
					    <a id="sheepItForm_remove_current">
					    <button type="button" class="btn btn-default glyphicon glyphicon-minus"></button> 
					    </a>
					  </div>
					  <!-- /Form template-->
					   
					  <!-- No forms template -->
					  <div id="sheepItForm_noforms_template">No Lanes!!</div>
					  <!-- /No forms template-->
					   
					  <!-- Controls -->
					  <div id="sheepItForm_controls">
					    <div id="sheepItForm_add"><a><button type="button" class="btn btn-default glyphicon glyphicon-plus"></button></a></div>					    					    
					  </div>
					  <!-- /Controls -->
					   
					</div>
					<!-- /sheepIt Form -->

				</td>
			</tr>
			
			
			<tr>
				<td colspan="2">
					<button type="submit" class="btn btn-info" id="btn_add">
						<span class="glyphicon glyphicon-ok">Add</span> 
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
