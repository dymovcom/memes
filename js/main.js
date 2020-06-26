
document.addEventListener('DOMContentLoaded', () => {
	const
		memesImage = document.querySelectorAll('p'),
		left = document.querySelector('#left'),
		right = document.querySelector('#right');
	let memes = {};

	function getMemes() {
		fetch('server/getMemes.php')
			.then(response => response.json())
			.then(json => {
				memes = json;
				left.textContent = json.left.name;
				right.textContent = json.right.name;
			});
	}

	function setMemes(obj) {
		fetch('server/setMemes.php', {
			method: 'POST',
			body: JSON.stringify(obj),
			headers: {
				"Content-type": "application/json; charset=UTF-8"
			}
		})
			.then(response => response.text())
			.then(data => console.log(data));
		getMemes();
	}

	memesImage.forEach(item => {
		item.addEventListener('click', () => {
			if (item.id === 'left') {
				memes.left.vin = true;
			} else if (item.id === 'right') {
				memes.right.vin = true;
			}
			console.log(memes);
			setMemes(memes);
		});
	});

	getMemes();
});