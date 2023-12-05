<?php
$conn = mysqli_connect("localhost", "root", "", "projetointegrador");
//Pega o ID do livro e faz uma URL com ele
if (isset($_GET['id'])) {
    $idLivro = $_GET['id'];

    $consultaLivro = "SELECT * FROM livros WHERE id = $idLivro";
    $resultadoLivro = $conn->query($consultaLivro);
    //Caso tenha mais de uma linha gera o seguinte código:
    if ($resultadoLivro->num_rows > 0) {
        //tranforma numa array a consulta
        $livro = $resultadoLivro->fetch_assoc();
        //Adicionando a editora
        $id_editora = $livro['editoras_id'];
        $consultaEditora = "SELECT * FROM editoras WHERE id = $id_editora";

        $resultadoEditora = $conn->query($consultaEditora);
        $editora = $resultadoEditora->fetch_assoc();

        //Adicionando o autor
        $id_autor = $livro['autores_id'];
        $consultaAutor = "SELECT * FROM autores WHERE id = $id_autor";
        
        $resultadoAutor = $conn->query($consultaAutor);
        $autor = $resultadoAutor->fetch_assoc();
    }
}
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="livro.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Baskervville&family=Inter:wght@300&family=Lexend+Zetta:wght@300&display=swap');
    </style> 
    <title>Página do Livro</title>
</head>
<body>
    <header>
        <button type="button" id="menu"><img src="menuButton.png"></button>
        <div id="pesquisar">
            <input type="text" id="textoP" placeholder="PESQUISAR">
            <button type="button" id="botaoP"><img id="imgP" src="pesquisaButton.png"></button>
        </div>
        <button type="button" id="login"><img src="contaButton.png"></button>
    </header>
    <main>
        <div id="infoLivro">
            <div id="imagem">
                <img src="<?=$livro['foto']; ?>" alt="">
            </div>
            <div id="informacoes">
                <div id="resumo">
                    <p><?=$livro['sinopse'] ?></p>
                </div>
                <div id="dados">
                    <h3>Título: <?=$livro['nome'] ?></h3>
                    <h3>Editora: <?=$editora['nome'] ?></h3>
                    <h3>Autor(a): <?=$autor['nome'] ?></h3>
                    <h3>Categoria: <?=$livro['categoria'] ?></h3>
                    <h3>Lançamento: <?=$livro['ano']?></h3>
                    <h3>Páginas: <?=$livro['paginas']?></h3>
                </div>
                
            </div>


        </div>
    </main>
</body>
</html>