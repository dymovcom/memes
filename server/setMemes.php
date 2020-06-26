<?php
$host = 'localhost';
$dbname = 'memesdb';
$user = 'root';
$pass = '';
$db = new PDO("mysql:host=$host;dbname=$dbname", $user, $pass);

$memes = json_decode(file_get_contents("php://input"), true);
function UpdateMeme($arr, $db)
{
	$sql = "SELECT * FROM memes WHERE name = '$arr[name]'";
	$result = $db->query($sql);
	$meme = $result->fetch(PDO::FETCH_ASSOC);
	$id = $meme['id'];
	$click = $meme['click'];
	echo var_dump($click);
	$click++;
	$sql = "UPDATE memes SET click = $click WHERE id = $id";
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



UpdateMeme($memes['left'], $db);
echo var_dump($memes['left']);

UpdateMeme($memes['right'], $db);
echo var_dump($memes['right']);
