<script>	
	$(document).ready(function() {		
	    gridRender('openCase');
	    gridRender('closedCase');
	}); 
</script>

<div id="container" class="col-md-8 col-md-offset-2">
	<h1 class="title">Manage Cases</h1>
	<hr />
	
		<h3>Open Cases</h3>
		<br/>
		<div class="grid" >
			<table id="openCase" action="<?php echo base_url();?>cases/ajaxGetCases/open" dir="ltr">				
				<tr>
					<th col="site" type="text">Site</th>
					<th col="open_date_time"  type="text">Open Date/Time</th>		
					<th col="admin" type="text">Admin</th>				
				</tr>										
			</table>
			<br />	
		</div>
		
		<h3>Closed Cases</h3>
		<br />
		<div class="grid">
			<table id="closedCase" action="<?php echo base_url();?>cases/ajaxGetCases/closed" dir="ltr">				
				<tr>
					<th col="site" type="text">Site</th>
					<th col="open_date_time"  type="text">Open Date/Time</th>		
					<th col="close_date_time" type="text">Close Date/Time</th>
					<th col="admin" type="text">Admin</th>
					<th col="collector" type="date">Collector</th>	
					<th col="count" type="date">Count</th>					
				</tr>										
			</table>	
		</div>
		
		

</div>
		
