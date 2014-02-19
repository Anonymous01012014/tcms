<div id="container" class="col-md-8 col-md-offset-2">
	<h1 class="title">Site information: <?php echo $site[0]["name"];?></h1>
	<hr />
	
	
	<script>
		var site = <?php echo $site[0]["name"];?>;
		var lat = <?php echo $site[0]["latitude"];?>;
		var long = <?php echo $site[0]["longitude"];?>;
		google.maps.event.addDomListener(window, 'load', initialize);
	</script>
	
	
	<div id="googleMap" style="width:500px;height:380px;"></div>
</div>

