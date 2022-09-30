-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT p.id, p.status, p.cliente_id, po.id, po.nome, po.tipo, po.preço, po.pts_de_lealdade  
FROM produtos_pedidos pp
JOIN pedidos p ON p.id = pp.pedido_id 
JOIN produtos po ON po.id = pp.produto_id;

-- 2)
SELECT p.id FROM produtos_pedidos pp 
JOIN pedidos p ON p.id = pp.pedido_id 
JOIN produtos po ON po.id = pp.produto_id 
WHERE po.nome = 'Fritas';

-- 3)
SELECT c.nome gostam_de_fritas FROM produtos_pedidos pp 
JOIN pedidos p ON p.id = pp.pedido_id 
JOIN produtos po ON po.id = pp.produto_id 
JOIN clientes c ON p.cliente_id = c.id 
WHERE po.nome = 'Fritas';

-- 4)
SELECT SUM(po.preço) FROM produtos_pedidos pp 
JOIN pedidos p ON p.id = pp.pedido_id 
JOIN produtos po ON po.id = pp.produto_id 
JOIN clientes c ON p.cliente_id = c.id 
WHERE c.nome = 'Laura';

-- 5)
SELECT po.nome, COUNT(po.nome) FROM produtos_pedidos pp 
JOIN pedidos p ON p.id = pp.pedido_id 
JOIN produtos po ON po.id = pp.produto_id 
JOIN clientes c ON p.cliente_id = c.id 
GROUP BY po.nome;