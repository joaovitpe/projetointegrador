<?php

	// ip do banco de dados, usuario, senha, nome_do_banco
	$conn = mysqli_connect("localhost", "root", "", "projetointegrador");

	if ($conn == false)
		die("Não foi possível conectar com o banco de dados"); 
?>