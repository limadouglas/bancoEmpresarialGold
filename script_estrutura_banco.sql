-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema EmpresarialGoldDiagrama
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema EmpresarialGoldDiagrama
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `EmpresarialGoldDiagrama` DEFAULT CHARACTER SET utf8 ;
USE `EmpresarialGoldDiagrama` ;

-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`municipios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`municipios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(7) NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `uf` CHAR(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`localizacoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`localizacoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `endereco` VARCHAR(80) NOT NULL,
  `bairro` VARCHAR(50) NOT NULL,
  `numero` SMALLINT NOT NULL,
  `cep` CHAR(9) NOT NULL,
  `complemento` VARCHAR(30) NOT NULL,
  `municipios_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_TblLocalizacao_TblMunicipio1_idx` (`municipios_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  CONSTRAINT `fk_localizacoes_municipios`
    FOREIGN KEY (`municipios_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`municipios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`naturezas_juridicas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`naturezas_juridicas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(5) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`empresas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`empresas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cnpj` CHAR(14) NOT NULL,
  `razao_social` VARCHAR(60) NOT NULL,
  `nome_fantasia` VARCHAR(60) NOT NULL,
  `razao_anterior` VARCHAR(60) NULL,
  `data_fundacao` DATE NOT NULL,
  `data_encerramento` DATE NULL,
  `data_razao_anterior` DATE NULL,
  `localizacoes_id` INT NOT NULL,
  `naturezas_juridicas_id` INT NOT NULL,
  `empresas_matriz_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_TblEmpresa_TblLocalizacao1_idx` (`localizacoes_id` ASC),
  INDEX `fk_TblEmpresa_TblNaturezaJuridica1_idx` (`naturezas_juridicas_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `cnpj_UNIQUE` (`cnpj` ASC),
  INDEX `fk_empresas_empresas1_idx` (`empresas_matriz_id` ASC),
  CONSTRAINT `fk_empresas_localizacoes`
    FOREIGN KEY (`localizacoes_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`localizacoes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empresas_naturezas_juridicas`
    FOREIGN KEY (`naturezas_juridicas_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`naturezas_juridicas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empresas_empresas`
    FOREIGN KEY (`empresas_matriz_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`estado_civil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`estado_civil` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `estado_civil` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `estado_civil_UNIQUE` (`estado_civil` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`sexo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`sexo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sexo` CHAR(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `sexo_UNIQUE` (`sexo` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`nacionalidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`nacionalidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nacionalidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nacionalidade_UNIQUE` (`nacionalidade` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`pessoas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`pessoas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cpf_cnpj` CHAR(14) NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `capital` DECIMAL(60,2) NOT NULL DEFAULT 0,
  `pessoa_juridica` TINYINT NOT NULL DEFAULT 0,
  `estado_civil_id` INT NOT NULL,
  `sexo_id` INT NOT NULL,
  `nacionalidade_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_pessoas_estado_civil1_idx` (`estado_civil_id` ASC),
  INDEX `fk_pessoas_sexo1_idx` (`sexo_id` ASC),
  INDEX `fk_pessoas_nacionalidade1_idx` (`nacionalidade_id` ASC),
  UNIQUE INDEX `cpf_cnpj_UNIQUE` (`cpf_cnpj` ASC),
  CONSTRAINT `fk_pessoas_estado_civil`
    FOREIGN KEY (`estado_civil_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`estado_civil` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pessoas_sexo`
    FOREIGN KEY (`sexo_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`sexo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pessoas_nacionalidade`
    FOREIGN KEY (`nacionalidade_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`nacionalidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`socios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`socios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_entrada` DATE NOT NULL,
  `participacao` DECIMAL(5,2) NOT NULL,
  `empresas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_socios_empresas1_idx` (`empresas_id` ASC),
  CONSTRAINT `fk_socios_empresas1`
    FOREIGN KEY (`empresas_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`cargos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`cargos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(40) NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`administradores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`administradores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_entrada` DATE NOT NULL,
  `cargos_id` INT NOT NULL,
  `empresas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_TblAdministrador_TblCargo1_idx` (`cargos_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_administradores_empresas1_idx` (`empresas_id` ASC),
  CONSTRAINT `fk_administradores_cargos`
    FOREIGN KEY (`cargos_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`cargos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_administradores_empresas`
    FOREIGN KEY (`empresas_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`consultas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`consultas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_consulta` DATE NOT NULL,
  `empresa_consultado_id` INT NOT NULL,
  `empresa_consulente_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_CNPJConsulente_idx` (`empresa_consulente_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_consulta_empresa_consultada_idx` (`empresa_consultado_id` ASC),
  CONSTRAINT `fk_consulta_empresa_consultada`
    FOREIGN KEY (`empresa_consultado_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_consulta_empresa_consulente`
    FOREIGN KEY (`empresa_consulente_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`cheques_situacoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`cheques_situacoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(2) NOT NULL,
  `descricao` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`bancos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`bancos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(3) NOT NULL,
  `num_agencia` CHAR(5) NOT NULL,
  `empresas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_bancos_empresas1_idx` (`empresas_id` ASC),
  CONSTRAINT `fk_bancos_empresas1`
    FOREIGN KEY (`empresas_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`cheques`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`cheques` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `num_cheque` CHAR(6) NOT NULL,
  `data_cheque` DATE NOT NULL,
  `valor` DECIMAL(14,2) NOT NULL,
  `num_conta` CHAR(10) NOT NULL,
  `empresas_id` INT NOT NULL,
  `cheques_situacoes_id` INT NULL,
  `bancos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_Empresa_idx` (`empresas_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_cheques_cheques_situacoes1_idx` (`cheques_situacoes_id` ASC),
  INDEX `fk_cheques_bancos1_idx` (`bancos_id` ASC),
  CONSTRAINT `fk_cheques_empresas`
    FOREIGN KEY (`empresas_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cheques_cheques_situacoes`
    FOREIGN KEY (`cheques_situacoes_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`cheques_situacoes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cheques_bancos`
    FOREIGN KEY (`bancos_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`bancos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`protestos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`protestos` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `data_protesto` DATE NOT NULL,
  `data_vencimento` DATE NOT NULL,
  `num_cartorio` INT NOT NULL,
  `valor` DECIMAL(14,2) NOT NULL,
  `empresas_id` INT NOT NULL,
  `municipios_id` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `FK_Empresa_idx` (`empresas_id` ASC),
  INDEX `fk_TblProtesto_TblMunicipio1_idx` (`municipios_id` ASC),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC),
  CONSTRAINT `fk_protestos_empresas`
    FOREIGN KEY (`empresas_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_protestos_municipios`
    FOREIGN KEY (`municipios_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`municipios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`pendencias_resticoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`pendencias_resticoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_inicio` DATE NOT NULL,
  `valor` DECIMAL(14,2) NOT NULL,
  `pendencia` TINYINT NOT NULL DEFAULT 0,
  `empresa_id_devedor` INT NOT NULL,
  `empresa_id_credor` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_CNPJEmpresa_idx` (`empresa_id_devedor` ASC),
  INDEX `FK_TblEmpresaTblPenRestCredorCNPJ_idx` (`empresa_id_credor` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  CONSTRAINT `fk_pendencias_empresas_devedor`
    FOREIGN KEY (`empresa_id_devedor`)
    REFERENCES `EmpresarialGoldDiagrama`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pendencias_empresas_credor`
    FOREIGN KEY (`empresa_id_credor`)
    REFERENCES `EmpresarialGoldDiagrama`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`ocorrencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`ocorrencias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ocorrencia` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `ocorrencia_UNIQUE` (`ocorrencia` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`recuperacoes_falencias_acoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`recuperacoes_falencias_acoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_ocorrencia` DATE NOT NULL,
  `vara` VARCHAR(30) NOT NULL,
  `municipios_id` INT NOT NULL,
  `empresa_id` INT NOT NULL,
  `ocorrencias_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_TblRecuperacaoFalencia_TblMunicipio1_idx` (`municipios_id` ASC),
  INDEX `fk_TblRecuperacaoFalenciaAcao_TblEmpresa1_idx` (`empresa_id` ASC),
  INDEX `fk_TblRecuperacaoFalenciaAcao_TblTipoOcorrencia1_idx` (`ocorrencias_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  CONSTRAINT `fk_recuperacoes_municipios`
    FOREIGN KEY (`municipios_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`municipios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recuperacoes_empresas`
    FOREIGN KEY (`empresa_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_recuperacoes_ocorrencias`
    FOREIGN KEY (`ocorrencias_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`ocorrencias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`fornecedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`fornecedores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `empresas_id` INT NOT NULL,
  `empresas_fornecedor_id` INT NOT NULL,
  `data_entrada` DATE NOT NULL,
  `data_fim` DATE NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_fornecedor_empresa_fornecedor_idx` (`empresas_fornecedor_id` ASC),
  INDEX `fk_empresas_fornecedores_empresa_idx` (`empresas_id` ASC),
  CONSTRAINT `fk_empresas_fornecedores_empresa`
    FOREIGN KEY (`empresas_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empresa_fornecedores_fornecedor`
    FOREIGN KEY (`empresas_fornecedor_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`participacoes_empresas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`participacoes_empresas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_entrada` DATE NOT NULL,
  `porc_capital` DECIMAL(5,2) NOT NULL,
  `empresas_id_participada` INT NOT NULL,
  INDEX `FK_Empresa_Participada_idx` (`empresas_id_participada` ASC),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  CONSTRAINT `fk_participacoes_empresas_empresa`
    FOREIGN KEY (`empresas_id_participada`)
    REFERENCES `EmpresarialGoldDiagrama`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`compras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`compras` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_compra` DATE NOT NULL,
  `total` DECIMAL(14,2) NOT NULL,
  `valor_entrada` DECIMAL(14,2) NULL DEFAULT 0,
  `qtde_parcelas` SMALLINT NULL,
  `descricao` VARCHAR(60) NULL,
  `empresas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_compras_empresas1_idx` (`empresas_id` ASC),
  CONSTRAINT `fk_compras_empresas`
    FOREIGN KEY (`empresas_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`cnae`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`cnae` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(10) NOT NULL,
  `descricao` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`TblSituacaoSintegra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`TblSituacaoSintegra` (
  `IDSitSintegra` INT NOT NULL,
  `descricao` VARCHAR(45) NOT NULL DEFAULT 'Habilitado',
  PRIMARY KEY (`IDSitSintegra`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`cnae_empresas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`cnae_empresas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `empresas_id` INT NOT NULL,
  `cnae_id` INT NOT NULL,
  `primario` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_TblEmpresa_has_TblCNAE_TblEmpresa1_idx` (`empresas_id` ASC),
  INDEX `fk_cnae_empresa_cnae_idx` (`cnae_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  CONSTRAINT `fk_cnae_empresas_empresas`
    FOREIGN KEY (`empresas_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cnae_empresas_cnae`
    FOREIGN KEY (`cnae_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`cnae` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`telefones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`telefones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ddd` CHAR(2) NOT NULL,
  `numero` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`nire`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`nire` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `num_nire` CHAR(11) NOT NULL,
  `municipios_id` INT NOT NULL,
  `empresas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_nire_empresa_idx` (`empresas_id` ASC),
  INDEX `fk_nire_municipio_idx` (`municipios_id` ASC),
  CONSTRAINT `fk_nire_municipio`
    FOREIGN KEY (`municipios_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`municipios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_nire_empresa`
    FOREIGN KEY (`empresas_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`inscricoes_estaduais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`inscricoes_estaduais` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `num_inscricao` CHAR(14) NOT NULL,
  `municipios_id` INT NOT NULL,
  `empresas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_TblInscricaoEstadual_TblMunicipio1_idx` (`municipios_id` ASC),
  INDEX `fk_TblInscricaoEstadual_TblEmpresa1_idx` (`empresas_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  CONSTRAINT `fk_inscricoes_estaduaisl_municipios`
    FOREIGN KEY (`municipios_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`municipios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inscricoes_estaduais_empresas`
    FOREIGN KEY (`empresas_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`telefones_pessoas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`telefones_pessoas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pessoas_id` INT NOT NULL,
  `telefones_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_telefone_pessoa_pessoa_idx` (`pessoas_id` ASC),
  INDEX `fk_telefone_pessoa_telefone_idx` (`telefones_id` ASC),
  CONSTRAINT `fk_telefones_pessoas_pessoas`
    FOREIGN KEY (`pessoas_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`pessoas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_telefone_pessoas_telefones`
    FOREIGN KEY (`telefones_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`telefones` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`telefones_empresas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`telefones_empresas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `empresas_id` INT NOT NULL,
  `telefones_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_telefones_empresas_empresas_idx` (`empresas_id` ASC),
  INDEX `fk_telefones_empresas_telefones_idx` (`telefones_id` ASC),
  CONSTRAINT `fk_telefones_empresas_empresas`
    FOREIGN KEY (`empresas_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_telefones_empresas_telefones`
    FOREIGN KEY (`telefones_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`telefones` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`localizacoes_pessoas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`localizacoes_pessoas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `localizacoes_id` INT NOT NULL,
  `pessoas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_localizacoes_pessoas_pessoas_idx` (`pessoas_id` ASC),
  CONSTRAINT `fk_localizacoes_pessoas_localizacao`
    FOREIGN KEY (`localizacoes_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`localizacoes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_localizacoes_pessoas_pessoas`
    FOREIGN KEY (`pessoas_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`pessoas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`situacoes_cnpj`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`situacoes_cnpj` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `situacao` VARCHAR(20) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `situacao_UNIQUE` (`situacao` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`situacoes_sintegra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`situacoes_sintegra` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `situacao` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `descricao_UNIQUE` (`situacao` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`situacoes_cnpj`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`situacoes_cnpj` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `situacao` VARCHAR(20) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `situacao_UNIQUE` (`situacao` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`consultas_cnpj`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`consultas_cnpj` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_consulta` DATE NOT NULL,
  `data_alteracao` DATE NULL,
  `empresas_id` INT NOT NULL,
  `situacoes_cnpj_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_consulta_cnpj_empresa1_idx` (`empresas_id` ASC),
  INDEX `fk_consultas_cnpj_situacao_cnpj1_idx` (`situacoes_cnpj_id` ASC),
  CONSTRAINT `fk_consulta_cnpj_empresa`
    FOREIGN KEY (`empresas_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_consultas_cnpj_situacao_cnpj`
    FOREIGN KEY (`situacoes_cnpj_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`situacoes_cnpj` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`consultas_sintegra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`consultas_sintegra` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_consulta` DATE NOT NULL,
  `data_alteracao` DATE NULL,
  `empresas_id` INT NOT NULL,
  `situacoes_sintegra_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_consulta_sintegra_situacao_sintegra1_idx` (`situacoes_sintegra_id` ASC),
  INDEX `fk_consulta_sintegra_empresa1_idx` (`empresas_id` ASC),
  CONSTRAINT `fk_consulta_sintegra_situacao_sintegra`
    FOREIGN KEY (`situacoes_sintegra_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`situacoes_sintegra` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_consulta_sintegra_empresa`
    FOREIGN KEY (`empresas_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`produtos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(20) NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  `preco` DECIMAL(14,2) NOT NULL,
  `fornecedores_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_produtos_fornecedores1_idx` (`fornecedores_id` ASC),
  CONSTRAINT `fk_produtos_fornecedores1`
    FOREIGN KEY (`fornecedores_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`fornecedores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`parcelas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`parcelas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `valor` DECIMAL(14,2) NOT NULL,
  `juros` DECIMAL(14,2) NOT NULL,
  `data_vencimento` DATE NOT NULL,
  `data_pagamento` DATE NULL,
  `num_parcela` SMALLINT NOT NULL,
  `compras_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_parcelas_compras1_idx` (`compras_id` ASC),
  CONSTRAINT `fk_parcelas_compras`
    FOREIGN KEY (`compras_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`compras` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`compras_has_produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`compras_has_produtos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `compras_id` INT NOT NULL,
  `produtos_id` INT NOT NULL,
  `quantidade` SMALLINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  INDEX `fk_compras_has_produtos_produtos1_idx` (`produtos_id` ASC),
  INDEX `fk_compras_has_produtos_compras1_idx` (`compras_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  CONSTRAINT `fk_compras_has_produtos_compras1`
    FOREIGN KEY (`compras_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`compras` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compras_has_produtos_produtos1`
    FOREIGN KEY (`produtos_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`produtos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`administradores_pj`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`administradores_pj` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `administradores_id` INT NOT NULL,
  `empresas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_administrador_pj_administradores1_idx` (`administradores_id` ASC),
  INDEX `fk_administradores_pj_empresas1_idx` (`empresas_id` ASC),
  CONSTRAINT `fk_administrador_pj_administradores`
    FOREIGN KEY (`administradores_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`administradores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_administradores_pj_empresas`
    FOREIGN KEY (`empresas_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`administradores_pf`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`administradores_pf` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `administradores_id` INT NOT NULL,
  `pessoas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_administrador_pf_administradores1_idx` (`administradores_id` ASC),
  INDEX `fk_administrador_pf_pessoas1_idx` (`pessoas_id` ASC),
  CONSTRAINT `fk_administrador_pf_administradores`
    FOREIGN KEY (`administradores_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`administradores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_administrador_pf_pessoas`
    FOREIGN KEY (`pessoas_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`pessoas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`socios_pf`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`socios_pf` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pessoas_id` INT NOT NULL,
  `socios_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_socio_pf_pessoas1_idx` (`pessoas_id` ASC),
  INDEX `fk_socio_pf_socios1_idx` (`socios_id` ASC),
  CONSTRAINT `fk_socios_pf_pessoas`
    FOREIGN KEY (`pessoas_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`pessoas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_socios_pf_socios`
    FOREIGN KEY (`socios_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`socios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`socios_pj`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`socios_pj` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `socios_id` INT NOT NULL,
  `empresas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_socio_pj_socios1_idx` (`socios_id` ASC),
  INDEX `fk_socios_pj_empresas1_idx` (`empresas_id` ASC),
  CONSTRAINT `fk_socios_pj_socios`
    FOREIGN KEY (`socios_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`socios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_socios_pj_empresas1`
    FOREIGN KEY (`empresas_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`tipos_logs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`tipos_logs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `log` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `log_UNIQUE` (`log` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`logs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`logs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_log` DATE NOT NULL,
  `tipos_logs_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_logs_tipos_logs1_idx` (`tipos_logs_id` ASC),
  CONSTRAINT `fk_logs_tipos_logs1`
    FOREIGN KEY (`tipos_logs_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`tipos_logs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`participacoes_pf`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`participacoes_pf` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `participacoes_empresas_id` INT NOT NULL,
  `pessoas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_participacao_pf_participacoes_empresas1_idx` (`participacoes_empresas_id` ASC),
  INDEX `fk_participacao_pf_pessoas1_idx` (`pessoas_id` ASC),
  CONSTRAINT `fk_participacoes_pf_participacoes_empresas`
    FOREIGN KEY (`participacoes_empresas_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`participacoes_empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_participacoes_pf_pessoas`
    FOREIGN KEY (`pessoas_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`pessoas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`participacoes_pj`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`participacoes_pj` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `participacoes_empresas_id` INT NOT NULL,
  `empresas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_participacao_pj_participacoes_empresas1_idx` (`participacoes_empresas_id` ASC),
  INDEX `fk_participacao_pj_empresas1_idx` (`empresas_id` ASC),
  CONSTRAINT `fk_participacoes_pj_participacoes_empresas`
    FOREIGN KEY (`participacoes_empresas_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`participacoes_empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_participacoes_pj_empresas`
    FOREIGN KEY (`empresas_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`tipos_inadimplencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`tipos_inadimplencias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` CHAR(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `tipo_UNIQUE` (`tipo` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`inadimplencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`inadimplencias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_inadimplencia` DATE NOT NULL,
  `empresas_id` INT NOT NULL,
  `tipos_inadimplencias_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_inadimplencia_empresas1_idx` (`empresas_id` ASC),
  INDEX `fk_inadimplencia_tipo_inadimplencia1_idx` (`tipos_inadimplencias_id` ASC),
  CONSTRAINT `fk_inadimplencias_empresas`
    FOREIGN KEY (`empresas_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inadimplencias_tipo_inadimplencias`
    FOREIGN KEY (`tipos_inadimplencias_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`tipos_inadimplencias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`inadimplencias_pj`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`inadimplencias_pj` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `inadimplencias_id` INT NOT NULL,
  `empresas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_inadimplencia_pj_inadimplencia1_idx` (`inadimplencias_id` ASC),
  INDEX `fk_inadimplencia_pj_empresas1_idx` (`empresas_id` ASC),
  CONSTRAINT `fk_inadimplencias_pj_inadimplencias`
    FOREIGN KEY (`inadimplencias_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`inadimplencias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inadimplencias_pj_empresas`
    FOREIGN KEY (`empresas_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`inadimplencias_pf`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`inadimplencias_pf` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `inadimplencias_id` INT NOT NULL,
  `pessoas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_inadimplencia_pf_inadimplencia1_idx` (`inadimplencias_id` ASC),
  INDEX `fk_inadimplencia_pf_pessoas1_idx` (`pessoas_id` ASC),
  CONSTRAINT `fk_inadimplencias_pf_inadimplencias`
    FOREIGN KEY (`inadimplencias_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`inadimplencias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inadimplencias_pf_pessoas`
    FOREIGN KEY (`pessoas_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`pessoas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmpresarialGoldDiagrama`.`juntas_comerciais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmpresarialGoldDiagrama`.`juntas_comerciais` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_alteracao` DATE NOT NULL,
  `capital_social` DECIMAL(14,2) NOT NULL,
  `empresas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_junta_empresas1_idx` (`empresas_id` ASC),
  CONSTRAINT `fk_juntas_comerciais_empresas`
    FOREIGN KEY (`empresas_id`)
    REFERENCES `EmpresarialGoldDiagrama`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
