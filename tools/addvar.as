#!/usr/bin/php 
<?php
/* The simplest script ever to populate the vars of each yaml file by the key
# suggested usage ./script test.yaml  test.new.yaml 
# (c)2021 loadbalancer.org - written by Andrew Smalley
# There is no checking at all in this file, understand before use please 
*/

if(isset($argv) && !is_file($argv['1']))  {
  exit("You should specify a file that exists, $1\n");
}
$file = fopen($argv['1'],"r");
while(! feof($file))
  {
  	$lines=fgets($file);
  	$line= str_replace("-","",str_replace(" ","",explode(":",trim($lines))));
  	switch($line['0']) {
  		case "":
  			break;
  		case "lbcli":
  		case "action":
      case "function":
  			echo $lines;
  			break; 
  		default:
  			echo "   ".$line['0'].": \"{{ ".$line['0']." }}\"\n";
	  		break;
  	}
  }

fclose($file);