<div id="container" class="col-md-8 col-md-offset-2">
	<h1 class="title">Add Case</h1>
	<hr />
	<div id="status_message" style="display: none;">
		
	</div>
	<form method="post" action="<?php echo base_url();?>cases/saveData" >
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
						?>
						<option value="<?php echo $site_id; ?>"><?php echo $site_name; ?></option>
						<?php
							}
						?>
					</select>
				</td>
			</tr>
			
			<tr>
				<td>
					<label for="site">Binary File:</label>
					
				</td>
				<td>
					<input type="file" class="form-control" name="binary_file" id="binary_file" required/>
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
		$( 'input[type="file"]' ).prettyFile();
		$( 'input[type="file"]' ).next('div').children(':nth-child(2)').prop("required",true);
		$('input[type=file]').change(function(e){
		  var file = $(this).val();
		  var file_parts = file.split('.');
		  var extension = file_parts[file_parts.length - 1];
		  if(extension !== "BIN" && extension !== "Bin"){
				$(this).val("");
				$(this).next('div').children(':nth-child(2)').val("");
				$('#status_message').html('<div class="alert alert-danger alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true" onclick="hideMessage();">&times;</button>You should select only binary files!</div>');
				$('#status_message').slideDown();
			}
		});
	});
	
	function hideMessage(){
			$('#status_message').hide();
	}
</script>
