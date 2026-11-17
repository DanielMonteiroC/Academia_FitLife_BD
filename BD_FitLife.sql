DROP SCHEMA IF EXISTS academia_fitlife;
CREATE SCHEMA IF NOT EXISTS academia_fitlife;
USE academia_fitlife;

CREATE TABLE IF NOT EXISTS aluno (
	id_aluno INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	cpf VARCHAR(14) NOT NULL UNIQUE,
	data_nascimento DATE NOT NULL,
	genero ENUM('M', 'F', 'O') NOT NULL,
	telefone VARCHAR(15),
	endereco VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS plano (
	id_plano INT PRIMARY KEY AUTO_INCREMENT,
	nome_plano VARCHAR(100) NOT NULL UNIQUE,
	valor_mensalidade DECIMAL(10,2) NOT NULL,
	duracao_meses INT NOT NULL,
	CONSTRAINT ck_plano_valor CHECK (valor_mensalidade > 0),
	CONSTRAINT ck_plano_duracao CHECK (duracao_meses > 0)
);

CREATE TABLE IF NOT EXISTS instrutor (
	id_instrutor INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	cref VARCHAR(20) NOT NULL UNIQUE,
	telefone VARCHAR(15),
	especialidade VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS matricula (
	id_matricula INT PRIMARY KEY AUTO_INCREMENT,
	id_aluno INT NOT NULL,
	id_plano INT NOT NULL,
	data_inicio DATE NOT NULL,
	data_fim DATE NOT NULL,
	status ENUM('Ativa', 'Inadimplente', 'Vencida', 'Cancelada')
		NOT NULL,
	CONSTRAINT fk_matricula_aluno FOREIGN KEY (id_aluno)
		REFERENCES aluno(id_aluno),
	CONSTRAINT fk_matricula_plano FOREIGN KEY (id_plano)
		REFERENCES plano(id_plano),
	CONSTRAINT ck_matricula_datas CHECK (data_fim > data_inicio)
);

CREATE TABLE IF NOT EXISTS ficha_treino (
	id_ficha INT PRIMARY KEY AUTO_INCREMENT,
	id_aluno INT NOT NULL,
	id_instrutor INT NOT NULL,
	data_criacao DATE NOT NULL,
	objetivo VARCHAR(50) NOT NULL,
	tipo_treino VARCHAR(50) NOT NULL,
	descricao_exercicios VARCHAR(500),
	CONSTRAINT fk_ficha_aluno FOREIGN KEY (id_aluno)
		REFERENCES aluno(id_aluno),
	CONSTRAINT fk_ficha_instrutor FOREIGN KEY (id_instrutor)
		REFERENCES instrutor(id_instrutor)
);

INSERT INTO aluno (id_aluno, nome, cpf, data_nascimento, genero, telefone, endereco) VALUES
	(1, 'Ana Beatriz Souza', '158.813.998-36', '1998-03-14', 'F', '(21) 98345-9975', 'Rua das Acácias, 812 - Itaipuaçu, Maricá/RJ'),
	(2, 'Bruno Henrique Lima', '797.309.114-21', '1990-07-22', 'M', '(21) 96047-9032', 'Av. Roberto Silveira, 470 - Centro, Maricá/RJ'),
	(3, 'Carla Mendes Rocha', '536.455.681-95', '1985-11-05', 'F', '(21) 98283-9815', 'Rua Abreu Rangel, 101 - Inoã, Maricá/RJ'),
	(4, 'Diego Alves Pereira', '447.294.055-17', '2001-01-30', 'M', '(21) 96371-7533', 'Rua Domício da Gama, 442 - São José do Imbassaí, Maricá/RJ'),
	(5, 'Eduarda Ferreira Costa', '987.168.976-78', '1995-09-18', 'F', '(21) 99458-7880', 'Av. Carlos Marighella, 274 - Flamengo, Maricá/RJ'),
	(6, 'Felipe Santos Oliveira', '978.809.320-88', '1988-04-02', 'M', '(21) 98746-2680', 'Rua dos Pescadores, 918 - Ponta Negra, Maricá/RJ'),
	(7, 'Gabriela Nunes Martins', '967.273.177-28', '2003-06-11', 'F', '(21) 98292-7587', 'Rua Ribeiro de Almeida, 267 - Araçatiba, Maricá/RJ'),
	(8, 'Henrique Barbosa Dias', '488.766.344-00', '1979-12-25', 'M', '(21) 96613-8507', 'Rua das Gaivotas, 43 - Barra de Maricá, Maricá/RJ'),
	(9, 'Isabela Cardoso Ramos', '875.347.787-46', '1992-02-08', 'F', '(21) 98719-1550', 'Av. Maysa, 581 - Jardim Atlântico, Maricá/RJ'),
	(10, 'João Pedro Carvalho', '457.178.472-76', '2000-10-19', 'M', '(21) 98981-8850', 'Rua Álvares de Castro, 872 - Cordeirinho, Maricá/RJ'),
	(11, 'Larissa Moreira Teixeira', '147.513.627-00', '1997-05-27', 'F', '(21) 96000-8392', 'Rua 12, 104 - Itaipuaçu, Maricá/RJ'),
	(12, 'Marcos Vinícius Araújo', '981.933.190-38', '1983-08-13', 'M', '(21) 97099-6853', 'Rua Jandira Gonçalves, 989 - Centro, Maricá/RJ'),
	(13, 'Natália Ribeiro Gomes', '205.997.283-67', '1989-03-01', 'F', '(21) 96537-9269', 'Rua do Sossego, 612 - Inoã, Maricá/RJ'),
	(14, 'Otávio Castro Freitas', '416.229.486-36', '1960-09-09', 'M', '(21) 96608-9520', 'Av. Ver. Barroso de Castro, 837 - Centro, Maricá/RJ'),
	(15, 'Patrícia Lopes Vieira', '360.161.055-10', '1958-01-17', 'F', '(21) 98090-8799', 'Rua Clímaco Pereira, 36 - Flamengo, Maricá/RJ'),
	(16, 'Rafael Monteiro Pinto', '547.517.799-92', '2004-11-23', 'M', '(21) 98421-9513', 'Rua Caetano Lourenço, 167 - Itaipuaçu, Maricá/RJ'),
	(17, 'Sabrina Duarte Correia', '369.579.318-36', '1994-07-04', 'F', '(21) 96800-3840', 'Rua Tupinambás, 44 - São José do Imbassaí, Maricá/RJ'),
	(18, 'Thiago Batista Moura', '080.737.028-53', '1999-12-12', 'M', '(21) 99615-9468', 'Rua Monsenhor Sayão, 814 - Ponta Negra, Maricá/RJ'),
	(19, 'Vanessa Pires Cunha', '222.646.861-06', '1987-10-30', 'F', '(21) 96766-6637', 'Av. Central, 322 - Araçatiba, Maricá/RJ'),
	(20, 'Alex Fontes Rezende', '247.764.725-68', '2002-04-15', 'O', '(21) 97821-2967', 'Rua das Orquídeas, 503 - Barra de Maricá, Maricá/RJ');

INSERT INTO plano (id_plano, nome_plano, valor_mensalidade, duracao_meses) VALUES
	(1, 'Mensal', 119.90, 1),
	(2, 'Trimestral', 109.90, 3),
	(3, 'Semestral', 99.90, 6),
	(4, 'Anual', 89.90, 12),
	(5, 'FitPlus Mensal', 179.90, 1),
	(6, 'FitPlus Semestral', 159.90, 6),
	(7, 'FitPlus Anual', 139.90, 12),
	(8, 'Estudante Semestral', 79.90, 6),
	(9, 'Melhor Idade Trimestral', 74.90, 3),
	(10, 'Personal Premium', 349.90, 1);

INSERT INTO instrutor (id_instrutor, nome, cref, telefone, especialidade) VALUES
	(1, 'Ricardo Almeida Torres', '012345-G/RJ', '(21) 98159-9596', 'Musculação'),
	(2, 'Fernanda Costa Lima', '023456-G/RJ', '(21) 99263-5486', 'Emagrecimento'),
	(3, 'Lucas Martins Rocha', '034567-G/RJ', '(21) 99342-2549', 'Hipertrofia'),
	(4, 'Juliana Prado Silveira', '045678-G/RJ', '(21) 99472-4511', 'Yoga e Pilates'),
	(5, 'André Luiz Fonseca', '056789-G/RJ', '(21) 96947-1080', 'Spinning'),
	(6, 'Camila Rezende Moura', '067890-G/RJ', '(21) 99906-2525', 'Dança'),
	(7, 'Rodrigo Teixeira Neves', '078901-G/RJ', '(21) 99598-8440', 'Treinamento Funcional'),
	(8, 'Beatriz Antunes Reis', '089012-G/RJ', '(21) 98644-6413', 'Reabilitação e Mobilidade'),
	(9, 'Paulo César Machado', '090123-G/RJ', '(21) 97671-9930', 'Treinamento para Idosos'),
	(10, 'Mariana Queiroz Lopes', '101234-G/RJ', '(21) 99208-3989', 'Personal Trainer');

INSERT INTO matricula (id_matricula, id_aluno, id_plano, data_inicio, data_fim, status) VALUES
	(1, 1, 4, '2025-01-06', '2026-01-05', 'Vencida'),
	(2, 12, 4, '2025-01-20', '2026-01-19', 'Vencida'),
	(3, 3, 6, '2025-02-10', '2025-08-09', 'Vencida'),
	(4, 2, 1, '2025-03-03', '2025-04-02', 'Vencida'),
	(5, 9, 7, '2025-03-20', '2026-03-19', 'Vencida'),
	(6, 2, 2, '2025-04-03', '2025-07-02', 'Vencida'),
	(7, 6, 4, '2025-05-12', '2026-05-11', 'Vencida'),
	(8, 17, 7, '2025-06-02', '2026-06-01', 'Vencida'),
	(9, 2, 3, '2025-07-03', '2026-01-02', 'Vencida'),
	(10, 4, 8, '2025-08-01', '2026-01-31', 'Vencida'),
	(11, 3, 6, '2025-08-10', '2026-02-09', 'Vencida'),
	(12, 8, 2, '2025-09-01', '2025-11-30', 'Vencida'),
	(13, 11, 3, '2025-10-06', '2026-04-05', 'Vencida'),
	(14, 14, 9, '2025-11-03', '2026-02-02', 'Vencida'),
	(15, 18, 1, '2025-11-24', '2025-12-23', 'Vencida'),
	(16, 8, 3, '2025-12-01', '2026-05-31', 'Vencida'),
	(17, 18, 2, '2025-12-24', '2026-03-23', 'Vencida'),
	(18, 1, 7, '2026-01-06', '2027-01-05', 'Ativa'),
	(19, 7, 1, '2026-01-15', '2026-02-14', 'Vencida'),
	(20, 12, 2, '2026-01-20', '2026-04-19', 'Cancelada'),
	(21, 4, 8, '2026-02-01', '2026-07-31', 'Vencida'),
	(22, 14, 9, '2026-02-03', '2026-05-02', 'Vencida'),
	(23, 3, 7, '2026-02-10', '2027-02-09', 'Ativa'),
	(24, 7, 5, '2026-02-15', '2026-03-14', 'Vencida'),
	(25, 16, 8, '2026-02-23', '2026-08-22', 'Vencida'),
	(26, 15, 9, '2026-03-02', '2026-06-01', 'Vencida'),
	(27, 7, 5, '2026-03-15', '2026-04-14', 'Cancelada'),
	(28, 9, 7, '2026-03-20', '2027-03-19', 'Ativa'),
	(29, 18, 3, '2026-03-24', '2026-09-23', 'Vencida'),
	(30, 11, 6, '2026-04-06', '2026-10-05', 'Vencida'),
	(31, 19, 5, '2026-04-18', '2026-05-17', 'Vencida'),
	(32, 14, 9, '2026-05-03', '2026-08-02', 'Vencida'),
	(33, 5, 1, '2026-05-04', '2026-06-03', 'Vencida'),
	(34, 6, 4, '2026-05-12', '2027-05-11', 'Inadimplente'),
	(35, 19, 6, '2026-05-18', '2026-11-17', 'Ativa'),
	(36, 8, 4, '2026-06-01', '2027-05-31', 'Ativa'),
	(37, 20, 1, '2026-06-01', '2026-06-30', 'Vencida'),
	(38, 15, 9, '2026-06-02', '2026-09-01', 'Vencida'),
	(39, 17, 10, '2026-06-02', '2026-07-01', 'Cancelada'),
	(40, 2, 3, '2026-06-15', '2026-12-14', 'Inadimplente'),
	(41, 20, 4, '2026-07-01', '2027-06-30', 'Inadimplente'),
	(42, 13, 1, '2026-07-17', '2026-08-16', 'Vencida'),
	(43, 14, 9, '2026-08-03', '2026-11-02', 'Vencida'),
	(44, 5, 10, '2026-08-04', '2026-09-03', 'Vencida'),
	(45, 10, 1, '2026-08-10', '2026-09-09', 'Vencida'),
	(46, 13, 2, '2026-08-17', '2026-11-16', 'Inadimplente'),
	(47, 16, 8, '2026-08-23', '2027-02-22', 'Ativa'),
	(48, 15, 9, '2026-09-02', '2026-12-01', 'Ativa'),
	(49, 5, 10, '2026-09-04', '2026-10-03', 'Vencida'),
	(50, 10, 1, '2026-09-10', '2026-10-09', 'Vencida'),
	(51, 5, 10, '2026-10-04', '2026-11-03', 'Vencida'),
	(52, 11, 6, '2026-10-06', '2027-04-05', 'Ativa'),
	(53, 10, 1, '2026-10-10', '2026-11-09', 'Vencida'),
	(54, 12, 5, '2026-10-20', '2026-11-19', 'Ativa'),
	(55, 14, 9, '2026-11-03', '2027-02-02', 'Ativa'),
	(56, 5, 10, '2026-11-04', '2026-12-03', 'Ativa');

INSERT INTO ficha_treino (id_ficha, id_aluno, id_instrutor, data_criacao, objetivo, tipo_treino, descricao_exercicios) VALUES
	(1, 1, 3, '2025-01-08', 'Hipertrofia', 'ABC', 'A: supino 4x10, tríceps 3x12 | B: puxada 4x10, rosca 3x12 | C: agachamento 4x10, leg press 3x12'),
	(2, 12, 1, '2025-01-22', 'Hipertrofia', 'ABC', 'A: supino 4x10, tríceps 3x12 | B: puxada 4x10, rosca 3x12 | C: agachamento 4x10, leg press 3x12'),
	(3, 3, 2, '2025-02-12', 'Emagrecimento', 'Circuito', 'Circuito 4 voltas: polichinelo 45s, agachamento 15x, flexão 12x, burpee 10x + bike 15 min'),
	(4, 2, 1, '2025-03-05', 'Condicionamento', 'Full Body', 'Agachamento goblet, supino com halteres, remada curvada e desenvolvimento 3x12 + esteira 20 min'),
	(5, 9, 4, '2025-03-23', 'Flexibilidade', 'Yoga', 'Hatha Yoga 2x/semana: saudação ao sol, posturas de equilíbrio, respiração (pranayama)'),
	(6, 6, 1, '2025-05-14', 'Hipertrofia', 'ABC', 'A: supino 4x10, tríceps 3x12 | B: puxada 4x10, rosca 3x12 | C: agachamento 4x10, leg press 3x12'),
	(7, 17, 4, '2025-06-04', 'Flexibilidade', 'Yoga', 'Hatha Yoga 2x/semana: saudação ao sol, posturas de equilíbrio, respiração (pranayama)'),
	(8, 12, 8, '2025-07-21', 'Reabilitação', 'Reabilitação', 'Core e estabilizadores: ponte 3x12, bird dog 3x10, elástico 3x15, sem carga axial'),
	(9, 4, 3, '2025-08-04', 'Hipertrofia', 'ABC', 'A: supino 4x10, tríceps 3x12 | B: puxada 4x10, rosca 3x12 | C: agachamento 4x10, leg press 3x12'),
	(10, 1, 3, '2025-08-05', 'Hipertrofia', 'ABCD', 'A: peito/tríceps | B: costas/bíceps | C: quadríceps (agachamento 5x8) | D: ombro/posterior (stiff 4x10)'),
	(11, 2, 3, '2025-09-02', 'Hipertrofia', 'ABC', 'A: supino 4x10, tríceps 3x12 | B: puxada 4x10, rosca 3x12 | C: agachamento 4x10, leg press 3x12'),
	(12, 8, 8, '2025-09-03', 'Reabilitação', 'Reabilitação', 'Core e estabilizadores: ponte 3x12, bird dog 3x10, elástico 3x15, sem carga axial'),
	(13, 3, 7, '2025-10-01', 'Condicionamento', 'Funcional', 'Kettlebell swing 4x15, TRX remada 3x12, farmer walk 4x30m, medicine ball slam 3x12'),
	(14, 11, 2, '2025-10-08', 'Emagrecimento', 'Full Body', 'Agachamento goblet, supino com halteres, remada curvada e desenvolvimento 3x12 + esteira 20 min'),
	(15, 9, 2, '2025-10-14', 'Emagrecimento', 'Circuito', 'Circuito 4 voltas: polichinelo 45s, agachamento 15x, flexão 12x, burpee 10x + bike 15 min'),
	(16, 14, 9, '2025-11-05', 'Condicionamento', 'Funcional', 'Kettlebell swing 4x15, TRX remada 3x12, farmer walk 4x30m, medicine ball slam 3x12'),
	(17, 18, 1, '2025-11-26', 'Hipertrofia', 'ABC', 'A: supino 4x10, tríceps 3x12 | B: puxada 4x10, rosca 3x12 | C: agachamento 4x10, leg press 3x12'),
	(18, 6, 7, '2025-12-03', 'Condicionamento', 'Funcional', 'Kettlebell swing 4x15, TRX remada 3x12, farmer walk 4x30m, medicine ball slam 3x12'),
	(19, 17, 2, '2025-12-10', 'Emagrecimento', 'Circuito', 'Circuito 4 voltas: polichinelo 45s, agachamento 15x, flexão 12x, burpee 10x + bike 15 min'),
	(20, 8, 8, '2026-01-06', 'Reabilitação', 'Fortalecimento', 'Extensora e flexora 3x12 (carga leve), elevação pélvica 3x15, bike 15 min'),
	(21, 7, 6, '2026-01-16', 'Condicionamento', 'Dança', 'Dança (ritmos) 2x/semana + musculação leve: leg press 3x15, puxada 3x15'),
	(22, 4, 3, '2026-02-03', 'Hipertrofia', 'ABCD', 'A: peito/tríceps | B: costas/bíceps | C: quadríceps (agachamento 5x8) | D: ombro/posterior (stiff 4x10)'),
	(23, 7, 5, '2026-02-16', 'Resistência', 'Spinning', 'Spinning 3x/semana (45 min): intervalado de subida e sprint + alongamento'),
	(24, 16, 3, '2026-02-25', 'Hipertrofia', 'ABC', 'A: supino 4x10, tríceps 3x12 | B: puxada 4x10, rosca 3x12 | C: agachamento 4x10, leg press 3x12'),
	(25, 14, 9, '2026-03-04', 'Flexibilidade', 'Mobilidade', 'Mobilidade de ombro e quadril, equilíbrio unipodal, caminhada 20 min'),
	(26, 15, 9, '2026-03-04', 'Condicionamento', 'Mobilidade', 'Mobilidade de ombro e quadril, equilíbrio unipodal, caminhada 20 min'),
	(27, 18, 1, '2026-03-25', 'Hipertrofia', 'ABCD', 'A: peito/tríceps | B: costas/bíceps | C: quadríceps (agachamento 5x8) | D: ombro/posterior (stiff 4x10)'),
	(28, 9, 4, '2026-04-01', 'Flexibilidade', 'Pilates', 'Pilates solo 2x/semana: hundred, roll up, ponte, fortalecimento de core'),
	(29, 11, 5, '2026-04-08', 'Resistência', 'Spinning', 'Spinning 3x/semana (45 min): intervalado de subida e sprint + alongamento'),
	(30, 19, 6, '2026-04-20', 'Condicionamento', 'Dança', 'Dança (ritmos) 2x/semana + musculação leve: leg press 3x15, puxada 3x15'),
	(31, 5, 2, '2026-05-06', 'Emagrecimento', 'Full Body', 'Agachamento goblet, supino com halteres, remada curvada e desenvolvimento 3x12 + esteira 20 min'),
	(32, 6, 1, '2026-05-13', 'Hipertrofia', 'ABCD', 'A: peito/tríceps | B: costas/bíceps | C: quadríceps (agachamento 5x8) | D: ombro/posterior (stiff 4x10)'),
	(33, 19, 2, '2026-05-20', 'Emagrecimento', 'Circuito', 'Circuito 4 voltas: polichinelo 45s, agachamento 15x, flexão 12x, burpee 10x + bike 15 min'),
	(34, 20, 7, '2026-06-02', 'Condicionamento', 'Funcional', 'Kettlebell swing 4x15, TRX remada 3x12, farmer walk 4x30m, medicine ball slam 3x12'),
	(35, 8, 1, '2026-06-03', 'Condicionamento', 'Full Body', 'Agachamento goblet, supino com halteres, remada curvada e desenvolvimento 3x12 + esteira 20 min'),
	(36, 17, 10, '2026-06-03', 'Condicionamento', 'Personal', 'Sessões individuais 3x/semana, treino periodizado, reavaliação de carga a cada 15 dias'),
	(37, 2, 1, '2026-06-17', 'Hipertrofia', 'ABC', 'A: supino 4x10, tríceps 3x12 | B: puxada 4x10, rosca 3x12 | C: agachamento 4x10, leg press 3x12'),
	(38, 20, 3, '2026-07-02', 'Hipertrofia', 'ABC', 'A: supino 4x10, tríceps 3x12 | B: puxada 4x10, rosca 3x12 | C: agachamento 4x10, leg press 3x12'),
	(39, 13, 2, '2026-07-20', 'Emagrecimento', 'Full Body', 'Agachamento goblet, supino com halteres, remada curvada e desenvolvimento 3x12 + esteira 20 min'),
	(40, 5, 10, '2026-08-05', 'Condicionamento', 'Personal', 'Sessões individuais 3x/semana, treino periodizado, reavaliação de carga a cada 15 dias'),
	(41, 14, 8, '2026-08-05', 'Reabilitação', 'Fortalecimento', 'Extensora e flexora 3x12 (carga leve), elevação pélvica 3x15, bike 15 min'),
	(42, 10, 3, '2026-08-11', 'Hipertrofia', 'ABC', 'A: supino 4x10, tríceps 3x12 | B: puxada 4x10, rosca 3x12 | C: agachamento 4x10, leg press 3x12'),
	(43, 3, 2, '2026-08-20', 'Emagrecimento', 'HIIT', '10 tiros de 30s na esteira (85% FC máx) com 60s de recuperação + prancha 3x30s'),
	(44, 16, 3, '2026-08-25', 'Hipertrofia', 'ABCD', 'A: peito/tríceps | B: costas/bíceps | C: quadríceps (agachamento 5x8) | D: ombro/posterior (stiff 4x10)'),
	(45, 15, 4, '2026-09-03', 'Flexibilidade', 'Yoga', 'Hatha Yoga 2x/semana: saudação ao sol, posturas de equilíbrio, respiração (pranayama)'),
	(46, 1, 1, '2026-09-14', 'Hipertrofia', 'ABCD', 'A: peito/tríceps | B: costas/bíceps | C: quadríceps (agachamento 5x8) | D: ombro/posterior (stiff 4x10)'),
	(47, 13, 2, '2026-09-21', 'Emagrecimento', 'HIIT', '10 tiros de 30s na esteira (85% FC máx) com 60s de recuperação + prancha 3x30s'),
	(48, 5, 10, '2026-10-06', 'Emagrecimento', 'Personal', 'Sessões individuais 3x/semana, treino periodizado, reavaliação de carga a cada 15 dias'),
	(49, 11, 2, '2026-10-07', 'Emagrecimento', 'Circuito', 'Circuito 4 voltas: polichinelo 45s, agachamento 15x, flexão 12x, burpee 10x + bike 15 min'),
	(50, 12, 7, '2026-10-21', 'Condicionamento', 'Funcional', 'Kettlebell swing 4x15, TRX remada 3x12, farmer walk 4x30m, medicine ball slam 3x12');

-- Conferência da quantidade de registros por tabela
SELECT 'aluno' AS tabela, COUNT(*) AS registros FROM aluno
UNION ALL SELECT 'plano', COUNT(*) FROM plano
UNION ALL SELECT 'instrutor', COUNT(*) FROM instrutor
UNION ALL SELECT 'matricula', COUNT(*) FROM matricula
UNION ALL SELECT 'ficha_treino', COUNT(*) FROM ficha_treino;

/*Quais alunos têm contrato vigente hoje, em qual plano, quando vence e qual a situação de pagamento (para liberar ou barrar a catraca)?*/
SELECT a.nome AS aluno,
	a.cpf,
	p.nome_plano AS plano,
	p.valor_mensalidade AS mensalidade,
	m.data_fim AS vencimento,
	DATEDIFF(m.data_fim, '2026-11-12') AS dias_para_vencer,
	m.status
FROM aluno a
INNER JOIN matricula m ON m.id_aluno = a.id_aluno
INNER JOIN plano p ON p.id_plano = m.id_plano
WHERE '2026-11-12' BETWEEN m.data_inicio AND m.data_fim
	AND m.status IN ('Ativa', 'Inadimplente')
ORDER BY m.status DESC, dias_para_vencer ASC;

/*Quais planos venderam pelo menos 5 matrículas (sem contar as canceladas) e quanto cada um gerou de receita contratada e ticket médio?*/
SELECT p.nome_plano AS plano,
	COUNT(m.id_matricula) AS qtd_matriculas,
	SUM(p.valor_mensalidade * p.duracao_meses) AS receita_contratada,
	ROUND(AVG(p.valor_mensalidade * p.duracao_meses), 2) AS ticket_medio
FROM plano p
INNER JOIN matricula m ON m.id_plano = p.id_plano
WHERE m.status <> 'Cancelada'
GROUP BY p.id_plano, p.nome_plano
HAVING COUNT(m.id_matricula) >= 5
ORDER BY receita_contratada DESC;

/*Quais alunos estão hoje sem contrato regular, qual foi o último plano e há quantas matrículas eles são clientes da academia?*/
WITH ultima_matricula AS (
	SELECT id_aluno,
		MAX(data_inicio) AS data_ultima,
		COUNT(*) AS qtd_matriculas
	FROM matricula
	GROUP BY id_aluno
),
situacao_atual AS (
	SELECT m.id_aluno,
		p.nome_plano,
		m.data_fim,
		m.status,
		u.qtd_matriculas
	FROM matricula m
	INNER JOIN ultima_matricula u ON u.id_aluno = m.id_aluno
		AND u.data_ultima = m.data_inicio
	INNER JOIN plano p ON p.id_plano = m.id_plano
)
SELECT a.nome AS aluno,
	a.telefone,
	s.nome_plano AS ultimo_plano,
	s.data_fim AS fim_contrato,
	s.status AS situacao_atual,
	s.qtd_matriculas
FROM situacao_atual s
INNER JOIN aluno a ON a.id_aluno = s.id_aluno
WHERE s.status IN ('Inadimplente', 'Vencida', 'Cancelada')
ORDER BY s.status, s.qtd_matriculas DESC, a.nome;

/*Para cada contrato vigente, qual é a ficha de treino mais recente, quem a prescreveu e há quantos dias ela não é atualizada?*/
WITH fichas_ordenadas AS (
	SELECT f.id_aluno,
		f.id_instrutor,
		f.data_criacao,
		f.objetivo,
		f.tipo_treino,
		ROW_NUMBER() OVER (PARTITION BY f.id_aluno
			ORDER BY f.data_criacao DESC) AS ordem_recente,
		COUNT(*) OVER (PARTITION BY f.id_aluno) AS total_fichas
	FROM ficha_treino f
)
SELECT a.nome AS aluno,
	i.nome AS instrutor,
	fo.objetivo,
	fo.tipo_treino,
	fo.data_criacao AS ultima_ficha,
	DATEDIFF('2026-11-12', fo.data_criacao) AS dias_sem_atualizar,
	fo.total_fichas
FROM fichas_ordenadas fo
INNER JOIN aluno a ON a.id_aluno = fo.id_aluno
INNER JOIN instrutor i ON i.id_instrutor = fo.id_instrutor
WHERE fo.ordem_recente = 1
	AND fo.id_aluno IN (SELECT id_aluno
		FROM matricula
		WHERE status IN ('Ativa', 'Inadimplente')
			AND '2026-11-12' BETWEEN data_inicio AND data_fim)
ORDER BY dias_sem_atualizar DESC;

/*TESTES DE INTEGRIDADE (devem ser RECUSADOS)*/
-- INSERT INTO matricula VALUES (57, 99, 1, '2026-11-12', '2026-12-11', 'Ativa');
-- INSERT INTO matricula VALUES (57, 1, 15, '2026-11-12', '2026-12-11', 'Ativa');
-- INSERT INTO plano VALUES (11, 'Plano Teste', -10.00, 1);
-- DELETE FROM aluno WHERE id_aluno = 1;
