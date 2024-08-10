// Obtém os parâmetros da URL
const urlParams = new URLSearchParams(window.location.search);
const videoId = urlParams.get('nomevideo');

// Define a fonte de vídeo com base no parâmetro
const videoSrc = {
    1: './assets/videos/membros.mp4',
    2: './assets/videos/tarefas.mp4',
    3: './assets/videos/contas_a_pagar.mp4',
    4: './assets/videos/patrimonio.mp4'
};

// Cria o elemento de vídeo e define a fonte correspondente
if (videoId && videoSrc[videoId]) {
    const videoElement = document.createElement('video');
    videoElement.setAttribute('controls', 'controls');
    videoElement.setAttribute('width', '700');
    videoElement.src = videoSrc[videoId];

    document.getElementById('video-container').appendChild(videoElement);
} else {
    document.getElementById('video-container').innerHTML = '<p>Vídeo não encontrado.</p>';
}
