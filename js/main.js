
document.addEventListener('DOMContentLoaded', () => {
	const
		memesImage = document.querySelectorAll('.meme'),
		left = document.querySelector('#left'),
		right = document.querySelector('#right'),
		formLoadedFile = document.querySelector('#formLoadedFile');
	let memes = {};

	function getMemes() {
		fetch('server/getMemes.php')
			.then(response => response.json())
			.then(json => {
				memes = json;

				const
					imgLeft = document.createElement('img'),
					imgRight = document.createElement('img');
				
					// left.textContent = json.left.name;
					// right.textContent = json.right.name;
				imgLeft.src = 'img/memes/' + json.left.name;
				imgRight.src = 'img/memes/' + json.right.name;

				left.append(imgLeft);
				right.append(imgRight);
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
		
		document.querySelectorAll('.meme img').forEach(item => {
			item.remove();
		});
		getMemes();
	}

	formLoadedFile.addEventListener('submit', (e) => {
		e.preventDefault();

		fetch('server/fileLoad.php', {
			method: 'POST',
			body: new FormData(formLoadedFile)
		}).then(response => response.text())
			.then(data => console.log(data))
			.finally(formLoadedFile.reset());
	});

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