document.addEventListener('DOMContentLoaded', function () {
    const slides = document.querySelectorAll('.slide');
    const leftArrow = document.getElementById('left');
    const rightArrow = document.getElementById('right');
    const modalTitullo = document.querySelector('.modal-titulo');
    let currentIndex = 0;
    const modalSubtitulo = document.getElementById('modal-subtitulo');

    // Check if elements are found before proceeding
    if (leftArrow && rightArrow && modalTitullo && modalSubtitulo) {
        function updateArrows() {
            if (currentIndex === 0) {
                leftArrow.classList.add('hidden');
            } else {
                leftArrow.classList.remove('hidden');
            }

            if (currentIndex === slides.length - 1) {
                rightArrow.classList.add('hidden');
            } else {
                rightArrow.classList.remove('hidden');
            }

            switch (currentIndex) {
                case 0:
                    modalTitullo.textContent = "Acessando a área de Eventos";
                    break;
                case 1:
                    modalTitullo.textContent = "Cadastrando um Evento";
                    break;
                case 2:
                    modalTitullo.textContent = "Pesquisando Membros";
                    break;
                case 3:
                    modalTitullo.textContent = "Cadastrando Dízimo";
                    break;
                case 4:
                    modalTitullo.textContent = "Consultando e Emitindo Relatório de Ofertas";
                    break;
                case 5:
                    modalTitullo.textContent = "Mais Ajuda!!!";
                    break;
            }

            if(currentIndex !== 0){
                modalSubtitulo.classList.add('fechar');
            } else {
                modalSubtitulo.classList.remove('fechar');
            }
        }

        rightArrow.addEventListener('click', function () {
            if (currentIndex < slides.length - 1) {
                currentIndex++;
                document.querySelector('.slides').style.marginLeft = `-${currentIndex * 100}%`;
            }
            updateArrows();
        });

        leftArrow.addEventListener('click', function () {
            if (currentIndex > 0) {
                currentIndex--;
                document.querySelector('.slides').style.marginLeft = `-${currentIndex * 100}%`;
            }
            updateArrows();
        });

        updateArrows(); // Initial call to set arrow visibility
    } else {
        console.error("One or more required elements are missing.");
    }
});

function abrirModalAjuda() {
    const modal = document.getElementById('janela-modal-ajuda');
    if (modal) {
        modal.classList.add('abrir');
        modal.addEventListener('click', (e) => {
            if (e.target.id === 'fechar-ajuda' || e.target.id === 'janela-modal-ajuda') {
                modal.classList.remove('abrir');
            }
        });
    } else {
        console.error("Modal element not found.");
    }
}

document.addEventListener('DOMContentLoaded', () => {
    const cardMensagem = document.getElementById('card-mensagem-ajuda');
    if (cardMensagem) {
        cardMensagem.addEventListener('click', (e) => {
            if (e.target.id === 'btn-nao' || e.target.id === 'fechar-mensagem-ajuda') {
                cardMensagem.classList.add('fechar');
            }
        });
    } else {
        console.error("Card mensagem ajuda element not found.");
    }
});
document.addEventListener('DOMContentLoaded', () => {
    const formulario = document.getElementById('verificacao-form');
    
    if (formulario) {
        formulario.addEventListener('submit', function(event) {
            event.preventDefault(); // Impede o envio padrão do formulário

            const resultado = document.getElementById('info__title');
            const infoCard = document.getElementById('info');
            const infoClose = document.querySelector('.info__close'); // Seletor para o botão de fechar

            // Abre o card de informações
            if (infoCard) {
                infoCard.classList.add('abrir');
                // Adiciona o event listener para o botão de fechar, se existir
                if (infoClose) {
                    infoClose.addEventListener('click', function() {
                        infoCard.classList.remove('abrir');
                    });
                }
            } else {
                console.error("Elemento do card de informações não encontrado.");
            }

            const palavraCorreta = 'Benção'; // Substitua pela palavra correta
            const resposta = document.getElementById('resposta').value.trim().toLowerCase();

            if (resposta === palavraCorreta.toLowerCase()) {
                resultado.textContent = 'Parabéns! Você digitou a palavra correta.';
            } else {
                resultado.textContent = 'Palavra incorreta! Tente novamente.';
            }
        });
    } else {
        console.error("Formulário de verificação não encontrado.");
    }
});

