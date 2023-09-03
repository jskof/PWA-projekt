<?php

	# Connect to MySQL database
	$MySQL = mysqli_connect("localhost","root","","baza") or die('Error connecting to MySQL server.');

	if ($MySQL->connect_error) {
		die("Connection failed: " . $MySQL->connect_error);
	}
	?>