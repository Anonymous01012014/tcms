<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class TsdpCommand extends CI_Controller {
	public function index(){
		//echo execInBackground("whoami");
		exec(__DIR__ ."\TSDP\TSDP.exe AUTO --in ". __DIR__ ."\TSDP\BinFiles\\test_10.BIN --out ". __DIR__ ."\TSDP\b.txt --settings ". __DIR__ ."\TSDP\SettingsFiles\CGSET.INI --numLanes 2 --classification --twoWay --sensorSpacing 48 2> error.txt");
		echo "<h1>analyze completed</h1>";
		//echo __DIR__ ."\TSDP\TSDP.exe AUTO --in ". __DIR__ ."\TSDP\BinFiles\\test_10.BIN --out ". __DIR__ ."\TSDP\b.txt --settings ". __DIR__ ."\TSDP\SettingsFiles\CGSET.INI --numLanes 2 --classification --twoWay --sensorSpacing 48 2> error.txt" ;
	}
}
?>
