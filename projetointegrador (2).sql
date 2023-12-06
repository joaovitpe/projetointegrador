-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05/12/2023 às 22:54
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projetointegrador`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `autores`
--

CREATE TABLE `autores` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `editoras_id` int(11) NOT NULL,
  `biografia` text NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `autores`
--

INSERT INTO `autores` (`id`, `nome`, `editoras_id`, `biografia`, `foto`) VALUES
(1, 'Yuval Noah Harari', 1, 'Professor israelense de História e autor do best-seller internacional Sapiens: Uma breve história da humanidade, Homo Deus: Uma Breve História do Amanhã e 21 Lições para o Século 21. Seu último lançamento é Notas sobre a Pandemia: E breves lições para o mundo pós-coronavírus', 'https://cdl-static.s3-sa-east-1.amazonaws.com/colaboradores/05208_gg.jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `editoras`
--

CREATE TABLE `editoras` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `biografia` varchar(500) NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `editoras`
--

INSERT INTO `editoras` (`id`, `nome`, `biografia`, `foto`) VALUES
(1, 'Companhia das Letras', 'A Companhia das Letras é a maior editora localizada do Brasil, fundada em 1986, com sede em São Paulo.', 'https://media.licdn.com/dms/image/D4D0BAQEY_kgFD1tcxg/company-logo_200_200/0/1683915289418/companhia_das_letras_logo?e=2147483647&v=beta&t=rWaKLFjZCqErf1dewO04ekqTOZgjKc6e0eyHhWRIeIM');

-- --------------------------------------------------------

--
-- Estrutura para tabela `livros`
--

CREATE TABLE `livros` (
  `id` int(11) NOT NULL,
  `nome` varchar(500) NOT NULL,
  `foto` text NOT NULL,
  `editoras_id` int(11) NOT NULL,
  `autores_id` int(11) NOT NULL,
  `categoria` varchar(45) NOT NULL,
  `nota` float NOT NULL,
  `sinopse` text NOT NULL,
  `paginas` int(4) NOT NULL,
  `ano` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `livros`
--

INSERT INTO `livros` (`id`, `nome`, `foto`, `editoras_id`, `autores_id`, `categoria`, `nota`, `sinopse`, `paginas`, `ano`) VALUES
(1, 'Sapiens: Uma breve história da humanidade', 'https://m.media-amazon.com/images/I/71-ghLb8qML._AC_UF1000,1000_QL80_.jpg', 1, 1, 'História', 4.8, 'O planeta Terra tem cerca de 4,5 bilhões de anos. Numa fração ínfima desse tempo, uma espécie entre incontáveis outras o dominou: nós, humanos. Somos os animais mais evoluídos e mais destrutivos que jamais viveram.\nSapiens é a obra-prima de Yuval Noah Harari e o consagrou como um dos pensadores mais brilhantes da atualidade. Num feito surpreendente, que já fez deste livro um clássico contemporâneo, o historiador israelense aplica uma fascinante narrativa histórica a todas as instâncias do percurso humano sobre a Terra. Da Idade da Pedra ao Vale do Silício, temos aqui uma visão ampla e crítica da jornada em que deixamos de ser meros símios para nos tornarmos os governantes do mundo.\nHarari se vale de uma abordagem multidisciplinar que preenche as lacunas entre história, biologia, filosofia e economia, e, com uma perspectiva macro e micro, analisa não apenas os grandes acontecimentos, mas também as mudanças mais sutis notadas pelos indivíduos.', 472, '2011'),
(2, 'Homo Deus: Uma Breve História do Amanhã', 'https://m.media-amazon.com/images/I/41bUl4cVKsL._SY445_SX342_.jpg', 1, 1, 'História', 4.7, 'Neste Homo Deus: uma breve história do amanhã, Yuval Noah Harari, autor do estrondoso best-seller Sapiens: uma breve história da humanidade, volta a combinar ciência, história e filosofia, desta vez para entender quem somos e descobrir para onde vamos. Sempre com um olhar no passado e nas nossas origens, Harari investiga o futuro da humanidade em busca de uma resposta tão difícil quanto essencial: depois de séculos de guerras, fome e pobreza, qual será nosso destino na Terra? A partir de uma visão absolutamente original de nossa história, ele combina pesquisas de ponta e os mais recentes avanços científicos à sua conhecida capacidade de observar o passado de uma maneira inteiramente nova. Assim, descobrir os próximos passos da evolução humana será também redescobrir quem fomos e quais caminhos tomamos para chegar até aqui.\r\n', 448, '2015'),
(3, 'Notas sobre a Pandemia: E breves lições para o mundo pós-coronavírus (artigos e entrevistas)', 'https://m.media-amazon.com/images/I/41+FnvItCVL._SY445_SX342_.jpg', 1, 1, 'Política', 4.5, 'Nesta coletânea inédita de artigos e entrevistas, Harari debate o impacto e as consequências da pandemia de covid-19.\r\n\r\nO historiador israelense Yuval Noah Harari examina os dilemas da encruzilhada histórica provocada pela pandemia do novo coronavírus nos artigos e entrevistas reunidos nesta coletânea inédita. Publicados originalmente em veículos como a revista Time e os jornais Financial Times e The Guardian, eles exploram temas como a disputa ideológica entre isolacionismo nacionalista e cooperação global, o risco da ascensão de estados totalitários na esteira das novas tecnologias de monitoramento em massa e os possíveis impactos do vírus na concepção contemporânea da morte.\r\nHarari desenvolve seus argumentos com a clareza de visão e de estilo que o consagrou, entrelaçando os caminhos e descaminhos da humanidade entre passado, presente e futuro. A boa notícia, ele ressalta, é que a maior parte do planeta concorda em concentrar os esforços nos avanços científicos em busca da cura e de uma vacina para o covid-19 – porém isso acontecerá apenas se a cooperação entre as nações for a prioridade dos líderes atuais.', 69, '2020');

-- --------------------------------------------------------

--
-- Estrutura para tabela `resenha`
--

CREATE TABLE `resenha` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `livros_id` int(11) NOT NULL,
  `data` date NOT NULL,
  `avaliacao` float NOT NULL,
  `resenha` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `email` varchar(75) NOT NULL,
  `senha` varchar(30) NOT NULL,
  `biografia` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `editoras_id` (`editoras_id`);

--
-- Índices de tabela `editoras`
--
ALTER TABLE `editoras`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `livros`
--
ALTER TABLE `livros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `editoras_id` (`editoras_id`),
  ADD KEY `autores_id` (`autores_id`);

--
-- Índices de tabela `resenha`
--
ALTER TABLE `resenha`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `livros_id` (`livros_id`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `autores`
--
ALTER TABLE `autores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `editoras`
--
ALTER TABLE `editoras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `livros`
--
ALTER TABLE `livros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `resenha`
--
ALTER TABLE `resenha`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `autores`
--
ALTER TABLE `autores`
  ADD CONSTRAINT `fk_editoras` FOREIGN KEY (`editoras_id`) REFERENCES `editoras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `livros`
--
ALTER TABLE `livros`
  ADD CONSTRAINT `fk_autores` FOREIGN KEY (`autores_id`) REFERENCES `autores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_livros` FOREIGN KEY (`editoras_id`) REFERENCES `editoras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `resenha`
--
ALTER TABLE `resenha`
  ADD CONSTRAINT `fk_livro` FOREIGN KEY (`livros_id`) REFERENCES `livros` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
