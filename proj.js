const buttons = document.querySelectorAll("[data-carousel-button]");
const fechar = document.getElementById("fechaBtn");

// Mostrando apenas o primeiro livro
const firstSlide = document.querySelector("#destaques [data-slides] li:first-child");
firstSlide.dataset.active = true;

buttons.forEach(button => {
  button.addEventListener("click", () => {
    const offset = button.dataset.carouselButton === "next" ? 1 : -1;
    const slides = button.closest("[data-carousel]").querySelector("[data-slides]");

    const activeSlide = slides.querySelector("[data-active]");

    let newIndex = [...slides.children].indexOf(activeSlide) + offset;
    if (newIndex < 0) newIndex = slides.children.length - 1;
    if (newIndex >= slides.children.length) newIndex = 0;

    slides.children[newIndex].dataset.active = true;
    delete activeSlide.dataset.active;
    // Pega o link do livro em destaque
    const livroDestaqueLink = slides.children[newIndex].querySelector(".imagemLivro a");

    console.log(livroDestaqueLink)

    let livroDestaqueID = slides.children[newIndex].querySelector(".imagemLivro a").getAttribute("href").split("=")[1];
    livroDestaqueLink.setAttribute("href", "livro.php?id="+livroDestaqueID+"");

  });
});

// POP UP
const btnLogin = document.getElementById('login');
const modal = document.querySelector('dialog');

btnLogin.onclick = function() {
    modal.showModal();
};

fechar.onclick = function() {
    modal.close();
};

