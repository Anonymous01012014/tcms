<div id="container" class="col-md-8 col-md-offset-2">
	<h1 class="title">Add Case</h1>
	<hr />
	<form method="post" action="<?php echo base_url();?>case_manage/saveData" >
		<table id="addFormTable">
			<tr>
				<td>
					<label for="site">Site:</label>
					<select name="site" id="site" >
						<?php
							for($i=0;$i < count($sites);$i++){
								$site_name = $sites[$i]['name'];
								$site_id = $sites[$i]['id'];
						?>
						<option value="<?php echo $site_id; ?>"><?php echo $site_name; ?></option>
						<?php
							}
						?>
					</select>
				</td>
			</tr>			
		</table>
		<button type="submit" class="btn btn-primary btn-lg" id="btn_add">
			<span class="glyphicon glyphicon-ok"></span> Add Case
		</button>
		<a href="<?php echo base_url();?>dashboard">
		<button type="Button" class="btn btn-default btn-lg" id="btn_cancel">
			<span class="glyphicon glyphicon-remove"></span> Cancel
		</button>
		</a>
	</form>
	

</div>
		
