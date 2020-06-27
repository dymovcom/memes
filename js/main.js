
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
				const
					imgLeft = document.querySelector('#leftImg'),
					imgRight = document.querySelector('#rightImg');
				memes = json;
				
				imgLeft.src = 'img/memes/' + json.left.name;
				imgRight.src = 'img/memes/' + json.right.name;
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
			// getMemes();
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