<div id="container" class="col-md-8 col-md-offset-2">
	<h1 class="title">Close Case</h1>
	<hr />
	<?php echo form_open_multipart(base_url().'cases/saveBinaryFile/'.$case_id);?>
		<table>
			<tr>
				<td>
					<label for="site">Binary File:</label>
					
				</td>
				<td>
					<input type="file" class="form-control" name="binary_file" id="binary_file" />
				</td>					
			</tr>	
			
			<tr>
				<td colspan="2">
					<button type="submit" class="btn btn-info" id="btn_add">
						<span class="glyphicon glyphicon-ok"></span> Close
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
$( document ).ready( function( $ ) {
    $( 'input[type="file"]' ).prettyFile();
});
</script>
