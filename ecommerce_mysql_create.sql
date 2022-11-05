CREATE TABLE `Cliente` (
	`IdCliente` INT NOT NULL AUTO_INCREMENT,
	`Cl_type` BINARY NOT NULL UNIQUE,
	`Cl_name` VARCHAR(255) NOT NULL AUTO_INCREMENT,
	`Cl_address` VARCHAR(255) NOT NULL AUTO_INCREMENT,
	`Cl_email` VARCHAR(255) NOT NULL AUTO_INCREMENT,
	`Cl_phone` VARCHAR(255) NOT NULL AUTO_INCREMENT,
	`Cl_CPF/CNPJ` INT NOT NULL UNIQUE,
	PRIMARY KEY (`IdCliente`)
);

CREATE TABLE `Pedido` (
	`IdPedido` INT NOT NULL AUTO_INCREMENT,
	`IdClient` INT NOT NULL UNIQUE,
	`Pd_status` BOOLEAN NOT NULL AUTO_INCREMENT,
	`Pd_product` VARCHAR(255) NOT NULL,
	`Pd_delivery` FLOAT NOT NULL UNIQUE,
	PRIMARY KEY (`IdPedido`)
);

CREATE TABLE `Produto` (
	`IdProduct` INT NOT NULL AUTO_INCREMENT,
	`Pd_vendor` BINARY NOT NULL,
	`Pd_name` VARCHAR(255) NOT NULL AUTO_INCREMENT,
	`Pd_value` FLOAT NOT NULL AUTO_INCREMENT,
	`Pd_category` VARCHAR(255) NOT NULL AUTO_INCREMENT,
	`Pd_quantity` INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`IdProduct`)
);

CREATE TABLE `Vendedor` (
	`IdVendor` INT NOT NULL AUTO_INCREMENT,
	`V_name` VARCHAR(255) NOT NULL AUTO_INCREMENT,
	`V_address` VARCHAR(255) NOT NULL AUTO_INCREMENT,
	`V_CNBJ` VARCHAR(255) NOT NULL UNIQUE,
	PRIMARY KEY (`IdVendor`)
);

CREATE TABLE `Solicitude_Pedido` (
	`Pedido` BINARY NOT NULL,
	`Cliente` BINARY NOT NULL,
	`Payment_method` BINARY NOT NULL,
	PRIMARY KEY (`Pedido`)
);

CREATE TABLE `Tipo Cliente` (
	`IdCliente` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`type_client` BINARY NOT NULL UNIQUE,
	`Cl_CPF/CNPJ` VARCHAR(255) NOT NULL UNIQUE,
	PRIMARY KEY (`IdCliente`)
);

CREATE TABLE `Relação Produto/pedido` (
	`IdPedido` BINARY NOT NULL,
	`IdProduto` INT NOT NULL,
	`Quantity` INT NOT NULL UNIQUE,
	PRIMARY KEY (`IdPedido`)
);

ALTER TABLE `Cliente` ADD CONSTRAINT `Cliente_fk0` FOREIGN KEY (`Cl_type`) REFERENCES `Tipo Cliente`(`type_client`);

ALTER TABLE `Cliente` ADD CONSTRAINT `Cliente_fk1` FOREIGN KEY (`Cl_CPF/CNPJ`) REFERENCES `Tipo Cliente`(`Cl_CPF/CNPJ`);

ALTER TABLE `Pedido` ADD CONSTRAINT `Pedido_fk0` FOREIGN KEY (`IdClient`) REFERENCES `Cliente`(`IdCliente`);

ALTER TABLE `Pedido` ADD CONSTRAINT `Pedido_fk1` FOREIGN KEY (`Pd_product`) REFERENCES `Relação Produto/pedido`(`IdProduto`);

ALTER TABLE `Produto` ADD CONSTRAINT `Produto_fk0` FOREIGN KEY (`Pd_vendor`) REFERENCES `Vendedor`(`IdVendor`);

ALTER TABLE `Solicitude_Pedido` ADD CONSTRAINT `Solicitude_Pedido_fk0` FOREIGN KEY (`Pedido`) REFERENCES `Pedido`(`IdPedido`);

ALTER TABLE `Solicitude_Pedido` ADD CONSTRAINT `Solicitude_Pedido_fk1` FOREIGN KEY (`Cliente`) REFERENCES `Cliente`(`IdCliente`);

ALTER TABLE `Tipo Cliente` ADD CONSTRAINT `Tipo Cliente_fk0` FOREIGN KEY (`IdCliente`) REFERENCES `Cliente`(`IdCliente`);

ALTER TABLE `Relação Produto/pedido` ADD CONSTRAINT `Relação Produto/pedido_fk0` FOREIGN KEY (`IdPedido`) REFERENCES `Pedido`(`IdPedido`);

ALTER TABLE `Relação Produto/pedido` ADD CONSTRAINT `Relação Produto/pedido_fk1` FOREIGN KEY (`IdProduto`) REFERENCES `Produto`(`IdProduct`);








