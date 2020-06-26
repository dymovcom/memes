<?php
$host = 'localhost';
$dbname = 'memesdb';
$user = 'root';
$pass = '';
$db = new PDO("mysql:host=$host;dbname=$dbname", $user, $pass);

$meme1 = array('name' => '', 'vin' => false);
$meme2 = array('name' => '', 'vin' => false);

$sql = "SELECT * FROM memes";
$result = $db->query($sql);
$memes = $result->fetchAll(PDO::FETCH_ASSOC);
$count = count($memes);

do {
	$meme1['name'] = $memes[rand(0, $count - 1)]['name'];
	$meme2['name'] = $memes[rand(0, $count - 1)]['name'];
} while ($meme1['name'] == $meme2['name']);

echo json_encode(array('left' => $meme1, 'right' => $meme2), JSON_UNESCAPED_UNICODE);

// echo "<pre>";
// var_dump(GetMemes());
// echo "</pre>";
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

