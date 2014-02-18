<script>	
	$(document).ready(function() {		
	    gridRender('site');
	}); 
</script>

<div id="container" class="col-md-8 col-md-offset-2">
	<h1 class="title">Manage Sites</h1>
	<hr />
	
		
		<div class="grid">
			<table id="site" action="<?php echo base_url();?>site/ajaxGetSites" dir="ltr">				
				<tr>																
					<th col="id" type="text">ID</th>
					<th col="name" type="text">Site name</th>
					<th col="FIPS"  type="text">FIPS</th>		
					<th col="latitude" type="number">latitude</th>
					<th col="longitude" type="number">longitude</th>
					<th col="lane_count" type="number">Lane count</th>
					<th col="start_date" type="date">Start date</th>					
				</tr>										
			</table>	
		</div>

	

</div>
		
