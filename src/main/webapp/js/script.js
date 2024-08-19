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

let btn = document.querySelector(".fa-bars");
let container = document.querySelector(".container");

btn.addEventListener("click", ()=>{
    container.classList.toggle("close");
});

let arrows = document.querySelectorAll(".arrow");
for(var i = 0; i < arrows.length ; i++) {
    arrows[i].addEventListener("click", (e)=>{
        let arrowParent = e.target.parentElement.parentElement;

        arrowParent.classList.toggle("show")
    })
}
