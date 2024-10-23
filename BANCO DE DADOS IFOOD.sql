CREATE TABLE Restaurante 
(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR (50),
cnpj VARCHAR (18),
telefone VARCHAR (15),
endereço VARCHAR (100)
);

CREATE TABLE Categoria
(
id INT AUTO_INCREMENT PRIMARY KEY,
nome_categoria VARCHAR (50)
);

CREATE TABLE Produto 
(
id_produto INT AUTO_INCREMENT PRIMARY KEY,
nome_produto VARCHAR (50),
preço DOUBLE,
descrição VARCHAR (255),
id_categoria INT,
id_restaurante INT,
FOREIGN KEY (id_categoria) REFERENCES Categoria(id),
FOREIGN KEY (id_restaurante) REFERENCES Restaurante(id)
);

CREATE TABLE Endereco
(
id INT AUTO_INCREMENT PRIMARY KEY,
rua VARCHAR (50),
número INT,
bairro VARCHAR (50),
cidade VARCHAR (50),
cep VARCHAR (10)
);

CREATE TABLE Promocao 
(
id INT AUTO_INCREMENT PRIMARY KEY,
nome_promocao VARCHAR (50),
desconto DOUBLE,
data_inicio DATE,
data_fim DATE
);

CREATE TABLE Avaliacao 
(
id INT AUTO_INCREMENT PRIMARY KEY,
nota INT,
comentário VARCHAR (100),
id_pedido INT,
FOREIGN KEY (id_pedido) REFERENCES Pedido(id)
);

CREATE TABLE Acompanhamento
(
id INT AUTO_INCREMENT PRIMARY KEY,
nome_acompanhamento VARCHAR (50),
id_produto INT,
FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

CREATE TABLE Pedido
(
id_pedido INT AUTO_INCREMENT PRIMARY KEY,
id_restaurante INT,
id_endereco INT,
forma_pagament ENUM ('dinheiro', 'cartão de crédito', 'cartão de débito', 'pix'),
status_entrega ENUM ('pendente', 'em transporte', 'entregue', 'cancelada'),
FOREIGN KEY (id_restaurante) REFERENCES Restaurante(id),
FOREIGN KEY (id_endereco) REFERENCES Endereco(id)
);

CREATE TABLE HistoricoDePagamento
(
id INT AUTO_INCREMENT PRIMARY KEY,
data_pagamento DATE,
valor DOUBLE,
id_pedido INT,
FOREIGN KEY (id_pedido) REFERENCES Pedido(id)
);

CREATE TABLE HistoricoDeEntrega
(
id INT AUTO_INCREMENT PRIMARY KEY,
data_entrega DATE,
status_entrega INT,
FOREIGN KEY (status_entrega) REFERENCES StatusDeEntrega(id)
);

CREATE TABLE ProdutoNoCarrinho
(
id INT AUTO_INCREMENT PRIMARY KEY,
id_produto INT,
quantidade INT,
observação VARCHAR (50),
FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

CREATE TABLE ProdutoAcompanhamentoNoCarrinho
(
id INT AUTO_INCREMENT PRIMARY KEY,
id_produto_car INT,
id_acompanhamento INT,
FOREIGN KEY (id_produto_car) REFERENCES ProdutoNoCarrinho(id),
FOREIGN KEY (id_acompanhamento) REFERENCES Acompanhamento(id)
);

CREATE TABLE RestauranteFormaDePagamento
(
id INT AUTO_INCREMENT PRIMARY KEY,
id_restaurante INT,
id_forma_pagamento INT,
FOREIGN KEY (id_restaurante) REFERENCES Restaurante(id),
FOREIGN KEY (id_forma_pagamento) REFERENCES FormaDePagamento(id)
);