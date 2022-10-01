-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)
INSERT INTO 
	clientes(nome, lealdade) 
VALUES
	('Georgia', 0);

-- 2)
INSERT INTO
	pedidos(status, cliente_id)
VALUES 
	('Recebido', (SELECT id FROM clientes WHERE nome ILIKE 'Geor%'));

-- 3)
INSERT INTO 
	produtos_pedidos (pedido_id, produto_id)
VALUES 
	((SELECT id FROM pedidos WHERE cliente_id = (SELECT id FROM clientes WHERE nome = 'Georgia')),
	(SELECT id FROM produtos WHERE nome ILIKE 'big%')),
	((SELECT id FROM pedidos WHERE cliente_id = (SELECT id FROM clientes WHERE nome = 'Georgia')),
	(SELECT id FROM produtos WHERE nome ILIKE 'VAR%')),
	((SELECT id FROM pedidos WHERE cliente_id = (SELECT id FROM clientes WHERE nome = 'Georgia')),
	(SELECT id FROM produtos WHERE nome ILIKE 'FrIT%')),
	((SELECT id FROM pedidos WHERE cliente_id = (SELECT id FROM clientes WHERE nome = 'Georgia')),
	(SELECT id FROM produtos WHERE nome ILIKE 'Coc%')),
	((SELECT id FROM pedidos WHERE cliente_id = (SELECT id FROM clientes WHERE nome = 'Georgia')),
	(SELECT id FROM produtos WHERE nome ILIKE 'COC%'));
	
-- Leitura

-- 1)
SELECT c.id id_cliente, c.nome, c.lealdade, 
p.id id_pedido, p.status, p.cliente_id, 
po.id id_produto, po.nome, po.tipo, po.preço, po.pts_de_lealdade 
FROM clientes c 
JOIN pedidos p ON c.id = p.cliente_id 
JOIN produtos_pedidos pp ON pp.pedido_id  = p.cliente_id 
JOIN produtos po ON po.id = pp.produto_id 
WHERE c.nome = 'Georgia';

-- Atualização

-- 1)
UPDATE 
	clientes 
SET lealdade = (
	SELECT SUM(po.pts_de_lealdade) 
	FROM clientes c 
	JOIN pedidos p ON c.id = p.cliente_id 
	JOIN produtos_pedidos pp ON pp.pedido_id  = p.cliente_id 
	JOIN produtos po ON po.id = pp.produto_id 
	WHERE c.nome = 'Georgia'
)
WHERE nome = 'Georgia';

-- Deleção

-- 1)
DELETE FROM clientes WHERE nome = 'Marcelo';
