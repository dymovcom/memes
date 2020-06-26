<?php
$host = 'localhost';
$dbname = 'memesdb';
$user = 'root';
$pass = '';
$db = new PDO("mysql:host=$host;dbname=$dbname", $user, $pass);

$memes = json_decode(file_get_contents("php://input"), true);
function UpdateMeme($arr, $db)
{

	$arr_left = $arr['left'];
	$arr_right = $arr['right'];

	
	$id_left = $arr_left['id'];
	$id_right = $arr_right['id'];

	$click_left = $arr_left['click'];
	$click_right = $arr_right['click'];

	$elo_left = $arr_left['elo'];
	$elo_right = $arr_right['elo'];

	if ($arr_left['vin'] === true) {
		$elo_left = getRatingElo($elo_left, $elo_right, 1, 0);
		$elo_right = getRatingElo($elo_right, $elo_left, -1, 0);
	} elseif ($arr_right['vin'] === true) {
		$elo_left = getRatingElo($elo_left, $elo_right, -1, 0);
		$elo_right = getRatingElo($elo_right, $elo_left, 1, 0);
	}

	$click_left++;
	$click_right++;
	
	$sql = "UPDATE memes SET click = $click_left, elo = $elo_left WHERE id = $id_left";
	$result = $db->prepare($sql);
	$result->execute();

	$sql = "UPDATE memes SET click = $click_right, elo = $elo_right WHERE id = $id_right";
	// echo "<pre>";
	// var_dump($sql);
	// echo "</pre>";
	$result = $db->prepare($sql);
	$result->execute();
}

function getRatingElo($ratingA, $ratingB, $result, $noob){
	$Ea = 1 / (1 + pow(10, ($ratingB - $ratingA) / 400));
	if ($ratingA >= 2400) $K = 10;
	if ($ratingA < 2400) $K = 20;
	if ($noob == 1) $K = 40;

	if ($result == 1) $Sa = 1;
	if ($result == 0) $Sa = 0.5;
	if ($result == -1) $Sa = 0;

	$resultRatingA = $ratingA + $K * ($Sa - $Ea);

	return round($resultRatingA);
}

UpdateMeme($memes, $db);

// UpdateMeme($memes['left'], $db);
// echo var_dump($memes['left']);

// UpdateMeme($memes['right'], $db);
// echo var_dump($memes['right']);
