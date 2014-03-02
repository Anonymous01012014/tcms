<!-- include the chart.js -->
<script src="<?php echo base_url();?>js/chart.js"></script>


<div id="container" class="col-md-8 col-md-offset-2">
	<h1 class="title">Charting analysis results</h1>
	<hr />
	<form method="post" action="#">
		<table>
			<tr>				
				<!-- site name -->
				<td>
					<label for="name">Site Name:</label>
				</td>
				
				<td>
				
					<script>
				        $(document).ready(function() { $("#site_name").select2(); });
				    </script>
					<select  name="site_name" id="site_name">
						
						<?php 
							foreach ($sites as $site) 
							{
						?>
								<option value="<?php echo $site['id'];?>"><?php echo $site['name'];?></option>		
						<?php	
							}						
						?>						
					</select>
				</td>
				
				<!-- FIPS -->
				<td>
					<label for="FIPS">FIPS Name:</label>
				</td>
				
				<td>
					<select class="form-control" type="text" name="mode" id="mode" >
						<option value="1">Count</option>
						<option value="2">Per vehicle</option>
						<option value="3">Axle</option>
						<option value="4">Speed</option>
					</select>
				</td>
			</tr>
			<tr>	
				<td>
					<label for="startDate">Start Date:</label>
				</td>
				
				<td>
					<input class="form-control" name="startDate" id="startDate"/>
				</td>
				
				<td>
					<label for="endDate">End Date:</label>
				</td>
				
				<td>
					<input class="form-control" name="endDate" id="endDate"/>
				</td>
			</tr>
		
			
			<tr>
				<td colspan="2" id="chart_container">
					
				</td>
			</tr>
		
			<tr>
				<td colspan="2">
					<input type="button" class="btn btn-info" value="Show Chart results" onclick="getCountChart();"/>
					<input type="reset" class="btn btn-default" value="Reset"/>
				</td>
			</tr>
			
		</table>
		
		
	</form>
	

</div>
<script type="text/javascript">
	$('input#startDate').datepicker({
		format: "yyyy-mm-dd"
	});
	
	$('input#endDate').datepicker({
		format: "yyyy-mm-dd"
	});
</script>


<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="http://code.highcharts.com/modules/exporting.js"></script>
