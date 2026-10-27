use vetcare_bd;

-- ALTER TABLE consultas_servicos
-- ADD CONSTRAINT uk_consulta_servico
-- UNIQUE (id_consulta, id_servico);

-- 1. ANIMAIS
INSERT INTO animais
(id_animais, id_tutor, nome, especie, raca, data_nascimento)
VALUES
(1, 1, 'Bob', 'Cachorro', 'Golden Retriever', '2021-03-15'),
(2, 1, 'Mel', 'Gato', 'Persa', '2022-07-10'),
(3, 2, 'Thor', 'Cachorro', 'Labrador', '2020-11-20'),
(4, 3, 'Mimi', 'Gato', 'Siamês', '2023-01-05'),
(5, 4, 'Nina', 'Cachorro', 'Poodle', '2022-05-18');


-- 2. VETERINARIOS
INSERT INTO veterinarios
(id_veterinario, id_especialidade, nome, crmv, telefone)
VALUES
(1, 1, 'Roberto Almeida', 'SP12345', '11911112222'),
(2, 2, 'Fernanda Rocha', 'SP23456', '11922223333'),
(3, 3, 'Paulo Mendes', 'SP34567', '11933334444'),
(4, 4, 'Camila Ferreira', 'SP45678', '11944445555'),
(5, 5, 'Lucas Martins', 'SP56789', '11955556666');


-- 3. CONSULTAS
INSERT INTO consultas
(id_consulta, id_animais, id_veterinario, data_hora,
 status_consulta, observacoes)
VALUES
(1, 1, 1, '2026-10-20 09:00:00',
 'Realizada', 'Consulta de rotina do Bob'),
(2, 2, 2, '2026-10-21 10:30:00',
 'Realizada', 'Avaliação dermatológica da Mel'),
(3, 3, 3, '2026-10-27 14:00:00',
 'Agendada', 'Avaliação cardíaca do Thor'),
(4, 4, 1, '2026-10-28 11:00:00',
 'Agendada', 'Consulta de rotina da Mimi'),
(5, 5, 4, '2026-10-29 15:30:00',
 'Agendada', 'Avaliação ortopédica da Nina');


-- 4. CONSULTAS_SERVICOS
INSERT INTO consultas_servicos
(id_consultas_servicos, id_consulta, id_servico,
 quantidade, valor_unitario)
VALUES
(1, 1, 1, 1, 100.00),
(2, 1, 2, 1, 80.00),
(3, 2, 3, 1, 60.00),
(4, 3, 4, 1, 150.00),
(5, 4, 5, 1, 40.00);

-- 5. ESPECIALIDADES
INSERT INTO especialidades (id_especialidade, nome) VALUES
(1, 'Clínica Geral'),
(2, 'Dermatologia'),
(3, 'Cardiologia'),
(4, 'Ortopedia'),
(5, 'Oftalmologia');

-- 6. SERVICOS
INSERT INTO servicos (id_servico, nome, preco) VALUES
(1, 'Consulta veterinária', 100.00),
(2, 'Vacinação', 80.00),
(3, 'Exame de sangue', 60.00),
(4, 'Ultrassonografia', 150.00),
(5, 'Curativo', 40.00);

-- 7. ENDERECOS
INSERT INTO enderecos
(id_endereco, logradouro, numero, complemento,
 bairro, cidade, estado, cep)
VALUES
(1, 'Rua das Flores', '120', 'Casa', 'Centro',
 'São Paulo', 'SP', '01001-000'),
(2, 'Avenida Brasil', '250', 'Apartamento 12', 'Jardim América',
 'São Paulo', 'SP', '01430-000'),
(3, 'Rua das Palmeiras', '45', 'Casa', 'Vila Nova',
 'Campinas', 'SP', '13010-000'),
(4, 'Rua do Sol', '88', 'Casa', 'Centro',
 'Santos', 'SP', '11010-000'),
(5, 'Avenida Central', '500', 'Apartamento 31', 'Jardim Europa',
 'Guarulhos', 'SP', '07010-000');


-- 8. TUTORES
INSERT INTO tutores
(id_tutor, id_endereco, nome, telefone, email)
VALUES
(1, 1, 'Ana Silva', '11987654321', 'ana@email.com'),
(2, 2, 'Carlos Souza', '11976543210', 'carlos@email.com'),
(3, 3, 'Mariana Lima', '19987654321', 'mariana@email.com'),
(4, 4, 'Pedro Santos', '13976543210', 'pedro@email.com'),
(5, 5, 'Juliana Costa', '11965432109', 'juliana@email.com');
