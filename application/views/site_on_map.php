<!-- load scripts -->
<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDczDfEHTE-O8noyduCL0zC1MDmVx_cJLU&sensor=false"></script>
<script src="<?php echo base_url();?>js/site.js"></script>


<div id="container" class="col-md-8 col-md-offset-2">
	<h1 class="title">Site information: <?php echo $site[0]["name"];?></h1>
	<hr/>
	
	
	<script>
		var site_name = "<?php echo $site[0]["name"];?>";
		var lat = <?php echo $site[0]["latitude"];?>;
		var long = <?php echo $site[0]["longitude"];?>;
		google.maps.event.addDomListener(window, 'load', initialize);
	</script>
	
	
	<div class="row">
		<div class="col-md-5">
			<table class="table table-striped">							
				<tr>
					<td>
						Site name:
					</td>
					
					<td>
						<?php echo $site[0]["name"]; ?>
					</td>
				</tr>
				
				<tr>
					<td>
						FIPS:
					</td>
					
					<td>
						<?php echo $site[0]["FIPS"]; ?>
					</td>
				</tr>								
				
				<tr>
					<td>
						Functional Class:
					</td>
					
					<td>
						<?php echo $site[0]["functional_class"]; ?>
					</td>
				</tr>
				
				<tr>
					<td>
						Latitude:
					</td>
					
					<td>
						<?php echo $site[0]["latitude"]; ?>
					</td>
				</tr>
				
				<tr>
					<td>
						Longitude:
					</td>
					
					<td>
						<?php echo $site[0]["longitude"]; ?>
					</td>
				</tr>
				
				<tr>
					<td>
						Lane count:
					</td>
					
					<td>
						<?php echo $site[0]["lane_count"]; ?>
					</td>
				</tr>
				
				<tr>
					<td>
						Start date:
					</td>
					
					<td>
						<?php echo $site[0]["start_date"]; ?>
					</td>
				</tr>
				
				<tr>
					<td>
						Address:
					</td>
					
					<td>
						<?php echo $site[0]["address"]; ?>
					</td>
				</tr>
			</table>
		</div>
		
		<!-- site mape -->
  		<div class="col-md-6">
  			<div id="googleMap" style="width:500px;height:380px;"></div>  				
  		</div>		
	</div>
	
	
</div>

