USE vetcare_bd;


-- =====================================================
-- CONSULTA 1: Listar animais e seus tutores
-- Contexto: Identificar os responsáveis por cada animal.
-- =====================================================

SELECT
    a.id_animais,
    a.nome AS animal,
    a.especie,
    a.raca,
    t.nome AS tutor
FROM animais a
INNER JOIN tutores t
    ON a.id_tutor = t.id_tutor
ORDER BY a.nome;


-- =====================================================
-- CONSULTA 2: Buscar animais de uma espécie específica
-- Contexto: Listar todos os gatos cadastrados.
-- =====================================================

SELECT
    id_animais,
    nome,
    especie,
    raca
FROM animais
WHERE especie = 'Gato';


-- =====================================================
-- CONSULTA 3: Buscar tutores pelo nome
-- Contexto: Localizar tutores cujos nomes começam com A.
-- =====================================================

SELECT
    id_tutor,
    nome,
    telefone,
    email
FROM tutores
WHERE nome LIKE 'A%';


-- =====================================================
-- CONSULTA 4: Consultas realizadas em um período
-- Contexto: Consultar atendimentos entre 20 e 28/10/2026.
-- =====================================================

SELECT
    id_consulta,
    id_animais,
    data_hora,
    status_consulta
FROM consultas
WHERE data_hora >= '2026-10-20 00:00:00'
  AND data_hora < '2026-10-29 00:00:00'
ORDER BY data_hora;


-- =====================================================
-- CONSULTA 5: Serviços por faixa de preço
-- Contexto: Encontrar serviços entre R$ 50 e R$ 120.
-- =====================================================

SELECT
    id_servico,
    nome,
    preco
FROM servicos
WHERE preco BETWEEN 50 AND 120
ORDER BY preco;


-- =====================================================
-- CONSULTA 6: Consultas com seus veterinários
-- Contexto: Identificar o profissional de cada atendimento.
-- =====================================================

SELECT
    c.id_consulta,
    a.nome AS animal,
    v.nome AS veterinario,
    c.data_hora,
    c.status_consulta
FROM consultas c
INNER JOIN animais a
    ON c.id_animais = a.id_animais
INNER JOIN veterinarios v
    ON c.id_veterinario = v.id_veterinario
ORDER BY c.data_hora;


-- =====================================================
-- CONSULTA 7: Veterinários e especialidades
-- Contexto: Consultar a especialidade de cada profissional.
-- =====================================================

SELECT
    v.nome AS veterinario,
    e.nome AS especialidade
FROM veterinarios v
INNER JOIN especialidades e
    ON v.id_especialidade = e.id_especialidade
ORDER BY v.nome;


-- =====================================================
-- CONSULTA 8: Serviços associados a cada consulta
-- Contexto: Identificar os serviços registrados nos atendimentos.
-- =====================================================

SELECT
    c.id_consulta,
    a.nome AS animal,
    s.nome AS servico,
    cs.quantidade,
    cs.valor_unitario,
    cs.quantidade * cs.valor_unitario AS total_item
FROM consultas c
INNER JOIN animais a
    ON c.id_animais = a.id_animais
INNER JOIN consultas_servicos cs
    ON c.id_consulta = cs.id_consulta
INNER JOIN servicos s
    ON cs.id_servico = s.id_servico
ORDER BY c.id_consulta;


-- =====================================================
-- CONSULTA 9: Buscar serviços pelo nome
-- Contexto: Encontrar serviços que contêm a palavra consulta.
-- =====================================================

SELECT
    id_servico,
    nome,
    preco
FROM servicos
WHERE nome LIKE '%consulta%';


-- =====================================================
-- CONSULTA 10: Quantidade de consultas por veterinário
-- Contexto: Verificar o número de atendimentos de cada profissional.
-- =====================================================

SELECT
    v.nome AS veterinario,
    COUNT(c.id_consulta) AS total_consultas
FROM veterinarios v
LEFT JOIN consultas c
    ON v.id_veterinario = c.id_veterinario
GROUP BY v.id_veterinario, v.nome
ORDER BY total_consultas DESC, v.nome;


-- =====================================================
-- CONSULTA 11: Calcular o valor de cada item
-- Contexto: Multiplicar quantidade pelo valor unitário.
-- =====================================================

SELECT
    id_consulta,
    id_servico,
    quantidade,
    valor_unitario,
    quantidade * valor_unitario AS total_item
FROM consultas_servicos
ORDER BY id_consulta;


-- =====================================================
-- CONSULTA 12: Calcular o total por consulta
-- Contexto: Somar os serviços registrados em cada atendimento.
-- =====================================================

SELECT
    c.id_consulta,
    a.nome AS animal,
    SUM(cs.quantidade * cs.valor_unitario) AS total_consulta
FROM consultas c
INNER JOIN animais a
    ON c.id_animais = a.id_animais
INNER JOIN consultas_servicos cs
    ON c.id_consulta = cs.id_consulta
GROUP BY c.id_consulta, a.nome
ORDER BY total_consulta DESC;


-- =====================================================
-- CONSULTA 13: Calcular o total dos serviços registrados
-- Contexto: Somar todos os itens da tabela de associação.
-- =====================================================

SELECT
    SUM(quantidade * valor_unitario) AS total_servicos
FROM consultas_servicos;


-- =====================================================
-- CONSULTA 14: Serviços acima do preço médio
-- Contexto: Identificar serviços com preço superior à média.
-- =====================================================

SELECT
    nome,
    preco
FROM servicos
WHERE preco > (
    SELECT AVG(preco)
    FROM servicos
)
ORDER BY preco DESC;


-- =====================================================
-- CONSULTA 15: Quantidade de animais por espécie
-- Contexto: Contabilizar os animais de cada espécie.
-- =====================================================

SELECT
    especie,
    COUNT(*) AS quantidade_animais
FROM animais
GROUP BY especie
ORDER BY quantidade_animais DESC;
