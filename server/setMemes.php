<?php
$host = 'localhost';
$dbname = 'memesdb';
$user = 'root';
$pass = 'root';
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

UpdateMeme($memes['left'], $db);
echo var_dump($memes['left']);

UpdateMeme($memes['right'], $db);
echo var_dump($memes['right']);
