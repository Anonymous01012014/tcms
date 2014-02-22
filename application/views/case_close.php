<div id="container" class="col-md-8 col-md-offset-2">
	<h1 class="title">Close Case</h1>
	<hr />
	<?php echo form_open_multipart(base_url().'cases/saveBinaryFile/'.$case_id);?>
		<table id="addFormTable">
			<tr>
				<td>
					<label for="site">Binary File:</label>
					
				</td>
				<td>
					<input type="file" class="form-control" name="binary_file" id="binary_file" />
				</td>
			</tr>			
		</table>
		<button type="submit" class="btn btn-default btn-lg" id="btn_add">
			<span class="glyphicon glyphicon-ok"></span> Close
		</button>
		
		<button type="Button" class="btn btn-danger btn-lg" id="btn_cancel" onclick="location.assign('<?php echo base_url();?>dashboard')";>
			<span class="glyphicon glyphicon-remove"></span> Cancel
		</button>
		
	</form>
	

</div>
<script>	
$( document ).ready( function( $ ) {
    $( 'input[type="file"]' ).prettyFile();
});
</script>
