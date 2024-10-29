DROP SCHEMA IF EXISTS `easy-store`; -- Remove o esquema se ele já existir

CREATE SCHEMA IF NOT EXISTS `easy-store` DEFAULT CHARACTER SET utf8; -- Cria o esquema se ele não existir
USE `easy-store`; -- Define o esquema para uso

-- Cria a tabela Funcionario
CREATE TABLE IF NOT EXISTS `easy-store`.`Funcionario` (
  `idFuncionario` INT NOT NULL AUTO_INCREMENT, -- Identificador único do funcionário
  `nomeFuncionario` VARCHAR(45) NOT NULL, -- Nome do funcionário
  `senhaFuncionario` VARCHAR(45) NOT NULL, -- Senha do funcionário
  `cargoFuncionario` ENUM("Gerente", "Manutenção", "Almoxarife") NOT NULL, -- Cargo do funcionário
  PRIMARY KEY (`idFuncionario`) -- Chave primária
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci; -- Define o charset e collation para a tabela

-- Cria a tabela Produtos
CREATE TABLE IF NOT EXISTS `easy-store`.`Produtos` (
  `idProduto` INT NOT NULL, -- Identificador único do produto
  `nomeProduto` VARCHAR(45) NOT NULL, -- Nome do produto
  `quantidadeProduto` INT NOT NULL, -- Quantidade do produto
  PRIMARY KEY (`idProduto`) -- Chave primária
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Cria a tabela Fornecedor
CREATE TABLE IF NOT EXISTS `easy-store`.`Fornecedor` (
  `idFornecedor` INT NOT NULL, -- Identificador único do fornecedor
  `nomeFornecedor` VARCHAR(45) NULL, -- Nome do fornecedor
  PRIMARY KEY (`idFornecedor`) -- Chave primária
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Cria a tabela Registro
CREATE TABLE IF NOT EXISTS `easy-store`.`Registro` (
  `idFuncionario` INT NOT NULL, -- Identificador do funcionário
  `idProduto` INT NOT NULL, -- Identificador do produto
  `idRegisto` INT NOT NULL AUTO_INCREMENT, -- Identificador único do registro
  `quantidadeRegistro` INT NOT NULL, -- Quantidade registrada
  `tipoRegistro` ENUM("entrada", "saida", "avaria") NOT NULL, -- Tipo de registro
  `dataValidade` DATE NULL, -- Data de validade do produto
  `loteProduto` INT NOT NULL, -- Lote do produto
  `Fornecedor_idFornecedor` INT NOT NULL, -- Identificador do fornecedor
  PRIMARY KEY (`idRegisto`), -- Chave primária
  FOREIGN KEY (`idFuncionario`)
    REFERENCES `easy-store`.`Funcionario` (`idFuncionario`) -- Chave estrangeira para Funcionario
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (`idProduto`)
    REFERENCES `easy-store`.`Produtos` (`idProduto`) -- Chave estrangeira para Produtos
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (`Fornecedor_idFornecedor`)
    REFERENCES `easy-store`.`Fornecedor` (`idFornecedor`) -- Chave estrangeira para Fornecedor
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;