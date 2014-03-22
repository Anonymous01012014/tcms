<div id="container" class="col-md-8 col-md-offset-2">
	<h1 class="title">Open Case</h1>
	<hr />
	<form method="post" action="<?php echo base_url();?>cases/saveData/open" >
		<table>
			<tr>
				<td>
					<label for="site">Site:</label>
				</td>
				
				<td>
					<select name="site" id="site" >
						<?php
							for($i=0;$i < count($sites);$i++){
								$site_name = $sites[$i]['name'];
								$site_id = $sites[$i]['id'];
								$opened = false;
								foreach($open_sites as $open_site){
									if($site_id ==  $open_site['site_id']){
										$opened = true;
										break; 
									}
								}
						?>
						<option value="<?php echo $site_id; ?>" <?php if($opened){ echo "disabled='disabled'";}?>><?php echo $site_name; ?></option>
						<?php
							}
						?>
					</select>
				</td>
			</tr>
			
			
			<tr>
				<td colspan="2">
					<button type="submit" class="btn btn-info" id="btn_add">
						<span class="glyphicon glyphicon-ok"></span> Open
					</button>
					
					<button type="Button" class="btn btn-default" id="btn_cancel" onclick="location.assign('<?php echo base_url();?>dashboard')";>
						<span class="glyphicon glyphicon-remove"></span> Cancel
					</button>
					
				</td>				
			</tr>			
		</table>
		
	</form>
	

</div>
		
<script>
	$(document).ready(function(){
		$('#site').select2();
	});
</script>
