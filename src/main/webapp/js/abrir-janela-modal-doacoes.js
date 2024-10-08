function abrirModalAlertaDoacoes(id) {
    const modal = document.getElementById('janela-modal-alerta');
    modal.classList.add('abrir');
    const confirmaExlcusao = document.getElementById('confirma-exclusao');
    
    // Verificação para depuração
    console.log("ID: " + id);
    
    confirmaExlcusao.href = 'deletedoacao?iddoacao=' + id;

    modal.addEventListener('click', (e) => {
        if (e.target.id == 'fechar' || e.target.id == 'janela-modal-alerta' || e.target.id == 'btn-fechar-alerta') {
            modal.classList.remove('abrir');
        }
    });
}

document.getElementById('fechar').addEventListener('click', () => {
    document.getElementById('janela-modal-alerta').classList.remove('abrir');
});

document.getElementById('fechar-alerta').addEventListener('click', () => {
    document.getElementById('janela-modal-alerta').classList.remove('abrir');
});
