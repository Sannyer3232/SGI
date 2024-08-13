let toggle = document.querySelector('.toggle');
    let navigation = document.querySelector('.navigation');
    let main = document.querySelector('.main');

function toggleMenu(){
    toggle.classList.toggle('active');
    navigation.classList.toggle('active');
    main.classList.toggle('active');
}

let list = document.querySelectorAll('.navigation li');
function activeLink(){
    list.forEach((item) => 
    item.classList.remove('hovered'));
    this.classList.add('hovered');
}


