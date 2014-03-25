<div id="container" class="col-md-8 col-md-offset-2">
	<h1 class="title">Close Case</h1>
	<hr />
	<div id="status_message" style="display: none;">
		
	</div>
	<?php echo form_open_multipart(base_url().'cases/saveBinaryFile/close/'.$case_id);?>
		<table>
			<tr>
				<td>
					<label for="site">Binary File:</label>
					
				</td>
				<td>
					<input type="file" class="form-control" name="binary_file" id="binary_file" required />
				</td>					
			</tr>	
			
			<tr>
				<td colspan="2">
					<button type="submit" class="btn btn-info" id="btn_add">
						<span class="glyphicon glyphicon-ok"></span> Close Case
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
		$( 'input[type="file"]' ).prettyFile();
		$( 'input[type="file"]' ).next('div').children(':nth-child(2)').prop("required",true);
		$('input[type=file]').change(function(e){
		  var file = $(this).val();
		  var file_parts = file.split('.');
		  var extension = file_parts[file_parts.length - 1];
		  if(extension.toUpperCase() !== "BIN"){
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
