<div id="container" class="col-md-8 col-md-offset-2">
	<h1 class="title">Add Site</h1>
	<hr />
	<form method="post" action="<?php echo base_url();?>case/saveData" >
		<table id="addFormTable">
			<tr>
				<td>
					<label for="site">Site:</label>
					<select name="site" id="site" >
						<?php
							for($i=0;$i <= $sites->num_rows();$i++){
								$site = $sites->row();
								$site_name = $site->name;
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
		</table>
		<button type="submit" class="btn btn-default btn-lg" id="btn_add">
			<span class="glyphicon glyphicon-ok"></span> Add Case
		</button>
		<a href="<?php echo base_url();?>dashboard">
		<button type="Button" class="btn btn-danger btn-lg" id="btn_cancel">
			<span class="glyphicon glyphicon-remove"></span> Cancel
		</button>
		</a>
	</form>
	

</div>
		
