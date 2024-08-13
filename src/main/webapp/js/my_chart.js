var ctx = document.getElementById('myChart').getContext('2d');
var earning = document.getElementById('earning').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'doughnut',
        data: {
            labels: ['Pago', 'Pendente', 'Atrasada'],
            datasets: [{
                label: 'Contas',
                data: [12, 19, 30],
                backgroundColor: [
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(255, 99, 132, 1)'
                ],
        }]
    },
    options: {
        responsive: true,
    }
});

var myChart = new Chart(earning, {
    type: 'bar',
    data: {
        labels: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 
                 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
        datasets: [
            {
                label: 'Dízimos',
                data: [12, 19, 23, 33, 12, 16, 18, 25, 27, 30, 34, 25],
                backgroundColor: 'rgba(54, 162, 235, 1)',
            },
            {
                label: 'Ofertas',
                data: [15, 21, 20, 30, 10, 14, 22, 28, 24, 32, 29, 27],
                backgroundColor: 'rgba(255, 206, 86, 1)',
            }
        ]
    },
    options: {
        responsive: true,
        scales: {
            x: {
                beginAtZero: true,
            },
            y: {
                beginAtZero: true
            }
        }
    }
});