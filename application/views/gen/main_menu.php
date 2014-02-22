<?php
	//if there is no acrive menu variable so leave it empty
	if(!isset($active_menu))
	{
		$active_menu =  "";
	}
?>


<div id="main-menu" class="row">
	<ul class="col-md-6 col-md-offset-2">
		<li><a href="<?php echo base_url();?>dashboard" class="<?php if($active_menu == "dashboard") echo 'active';?>">Dashboard</a></li>
		<li><a href="<?php echo base_url();?>site/add"  class="<?php if($active_menu == "add_site") echo 'active';?>">Add Site</a></li>
		<li><a href="<?php echo base_url();?>cases/add" class="<?php if($active_menu == "add_case") echo 'active';?>">Add Case</a></li>
		<li><a href="#" class="<?php if($active_menu == "about") echo 'active';?>">About</a></li>
		<li><a href="#" class="<?php if($active_menu == "help") echo 'active';?>">Help</a></li>
	</ul>
	

	<ul class="col-md-3">
		<li>Hello, <a href="#" class="active"><?php echo $user_data['first_name'];?></a></li>	
		<li><a href="login_user/signout" class="">Sign out</a></li>					
	</ul>
	
</div>	
