<script>	
	$(document).ready(function() {		
	    gridRender('openCase');
	    gridRender('closedCase');
	}); 
</script>

<div id="container" class="col-md-8 col-md-offset-2">
	
	<h1 class="title">Manage Cases</h1>
	<hr />
	<div id="status_message" style="display: none;">
		
	</div>
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
					<th col="collector" type="text">Collector</th>	
					<th col="count" type="integer">Count</th>					
				</tr>										
			</table>	
		</div>
		
		

</div>
<?php if($message !== ""){?>
	<script>
		$(document).ready(function(){
			$('#status_message').html('<div class="alert alert-danger alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true" onclick="hideMessage();">&times;</button>'+"<?php echo $message;?>"+'</div>');
			$('#status_message').slideDown();
		});
		function hideMessage(){
			$('#status_message').hide();
		}
	</script>
<?php }?>
