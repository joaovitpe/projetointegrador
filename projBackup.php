<?php

    $conn = mysqli_connect("localhost", "root", "", "projetointegrador");
    $livroHistoria = "SELECT * FROM livros WHERE categoria LIKE '%História%'";
    $mostrarHistoria = $conn->query($livroHistoria);

    $livrosDestaques = "SELECT * FROM livros WHERE nota > 4";
    $mostrarDestaques = $conn->query($livrosDestaques);

?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Projeto Integrador</title>
    <!--importar icones-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="proj.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Baskervville&family=Lexend+Zetta:wght@300&family=Martel+Sans:wght@600&display=swap');
    </style>

    <script src="proj.js" defer></script>
</head>
<body>
    <header>
        <button type="button" id="menu"><img draggable="false" src="menuButton.png"></button>
        <div id="pesquisar">
            <input type="text" id="textoP" placeholder="PESQUISAR">
            <button type="button" id="botaoP"><img draggable="false" id="imgP" src="pesquisaButton.png"></button>
        </div>
        <button type="button" id="login"> <img draggable="false" src="contaButton.png"></button>
    </header>
    <dialog>
        <div class="containerLogin">
            <a id="fechaBtn"><i class="fa-solid fa-xmark"></i></a>
            <p id="loginText">LOGIN</p>
            <div id="loginInput">
                <input type="text" placeholder="Nome de usuário:" name="nome" required>
                <input type="password" placeholder="Senha:" name="senha" required>
                <a href="">Esqueceu sua senha?</a>
            </div>
            <button type="submit">Fazer Login</button>
            <div class="loginBar">
                <div id="loginBarContent">
                    <img draggable="false" src="">
                    <p>BEM VINDO(A) <br> de Volta</p>
                </div>
            </div>
            <p>Ainda não tem uma conta?<a href="">Cadastre-se</a></p>
        </div>
    </dialog>
    <div id="destaques" data-carousel>
    <span id="elipseFodase"></span>
    <div id="destaquesT">
        <h1 id="tituloD">DESTAQUES</h1>
        <img src="traco.png">
    </div> 
    <div class="botoes">
        <button id="botaoE" data-carousel-button="prev"><img draggable="false" src="botaoE.png"></button>
        <button id="botaoD" data-carousel-button="next"><img draggable="false" src="botaoD.png"></button>
    </div> 
    <ul data-slides>
        <?php
        $contadorDestaques = 0;
        while ($livros = mysqli_fetch_assoc($mostrarDestaques)):
            if ($contadorDestaques < 4): // Alteração aqui para exibir um livro por vez
        ?>
            <li id="livroDestaque">
                <div class="rating">
                    <span class="star"></span>
                    <span class="star"></span>
                    <span class="star"></span>
                    <span class="star"></span>
                    <span class="star"></span>
                    <span id="nota"><?= $livros['nota'];?></span>
                </div>
                <div class="imagemLivro">
                <a href="livro.php?id=<?= $livros['id']; ?>">
                    <img src="<?= $livros['foto']; ?>">
                </a>
                </div>
                <h2><?=$livros['nome'];?></h2>
                <p id="categoria">Categorias: <a href=""><?= $livros['categoria'];?></a></p>
                <p id="sinopse"><?= $livros['sinopse'];?></p>
            </li>
        <?php
            endif;
            $contadorDestaques++;
        endwhile;
        ?>
    </ul>
</div>

    <div class="categoriaSlide">
    <div id="categoriaTitulo">
        <img src="traco.png">
        <h3 id="tituloD">Livros de História</h3>
    </div>
    <div class="botoes">
        <button id="botaoE"><img draggable="false" src="botaoE.png"></button>
        <button id="botaoD"><img draggable="false" src="botaoD.png"></button>
    </div>  
    <ul class="livros">
        <?php
        $contador = 0;
        while ($livros = mysqli_fetch_assoc($mostrarHistoria)):
            if ($contador < 6): ?>
            <li class="card">
                <div class="imagem">
                    <a href="livro.php?id=<?= $livros['id']; ?>"><img draggable="false" src="<?= $livros['foto'];?>"></a>
                </div>
                <span class="nota"><?= $livros['nota'];?></span>
            </li>
        <?php
            endif;
            $contador++;
        endwhile;
        ?>
    </ul>  
</div>

    <footer>
        <p>Somos uma rede social criada especialmente para quem ama ler. Junte-se a nós e compartilhe experiências literárias.</p>
    </footer>

</body>
</html>