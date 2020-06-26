<?php
$host = 'localhost';
$dbname = 'memesdb';
$user = 'root';
$pass = '';
$db = new PDO("mysql:host=$host;dbname=$dbname", $user, $pass);

$meme1 = array('name' => '', 'elo' => 0, 'click' => 0, 'vin' => false);
$meme2 = array('name' => '', 'elo' => 0, 'click' => 0, 'vin' => false);

$sql = "SELECT * FROM memes";
$result = $db->query($sql);
$memes = $result->fetchAll(PDO::FETCH_ASSOC);
$count = count($memes);

// echo "<pre>";
// var_dump($memes);
// echo "</pre>";
do {
	$r1 = rand(0, $count - 1);
	$r2 = rand(0, $count - 1);
} while ($r1 == $r2);


$meme1['name'] 	= $memes[$r1]['name'];
$meme1['elo'] 	= $memes[$r1]['elo'];
$meme1['click'] = $memes[$r1]['click'];
$meme2['name'] 	= $memes[$r2]['name'];
$meme2['elo'] 	= $memes[$r2]['elo'];
$meme2['click'] = $memes[$r2]['click'];

echo json_encode(array('left' => $meme1, 'right' => $meme2), JSON_UNESCAPED_UNICODE);


// GetMemes();











// $sql = "SELECT * FROM memes";
// $result = $db->query($sql);
// $articles = $result->fetchAll(PDO::FETCH_ASSOC);
// foreach ($articles as $article) {
// 	echo "{$article['id']} | {$article['name']} | {$article['elo']} | {$article['addDate']} | {$article['author']} <hr />";
// }
// $sql = "INSERT INTO memes (name, elo, addDate, author) VALUES ('321.png', 123, '2020-06-25', 1)";
// $stmt = $db->prepare($sql);
// $stmt->execute();
// 1. Получить 2 случайные картинки и передать их на фронт
// 2. Получить картинки обратно, узнать какая победила
// 3. Обновить данные о картинках в БД
// 4. Повторить

