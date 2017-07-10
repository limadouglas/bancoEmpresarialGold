
-- insert ocorrencias
INSERT INTO ocorrencias (ocorrencia) VALUES ('ACAO EXECUTIVA');
INSERT INTO ocorrencias (ocorrencia) VALUES ('ACAO EXECUTIVA MUNICIPAL');
INSERT INTO ocorrencias (ocorrencia) VALUES ('ACAO EXECUTIVA FEDERAL');
INSERT INTO ocorrencias (ocorrencia) VALUES ('ACAO DE BUSCA E APREENSAO');
INSERT INTO ocorrencias (ocorrencia) VALUES ('ACAO MONITORIA');
INSERT INTO ocorrencias (ocorrencia) VALUES ('ACAO EXECUTIVA ESTADUAL');
INSERT INTO ocorrencias (ocorrencia) VALUES ('ACAO DE DESPEJO');
INSERT INTO ocorrencias (ocorrencia) VALUES ('ACAO DEPOSITO');
-- SELECT * FROM ocorrencias order by id;



-- insert naturezas_juridicas
INSERT INTO naturezas_juridicas (codigo, descricao) VALUES ('201-1', 'Empresa Pública');
INSERT INTO naturezas_juridicas (codigo, descricao) VALUES ('203-8', 'Sociedade de Economia Mista');
INSERT INTO naturezas_juridicas (codigo, descricao) VALUES ('204-6', 'Sociedade Anônima Aberta');
INSERT INTO naturezas_juridicas (codigo, descricao) VALUES ('205-4', 'Sociedade Anônima Fechada');
INSERT INTO naturezas_juridicas (codigo, descricao) VALUES ('206-2', 'Sociedade Empresária Limitada');
INSERT INTO naturezas_juridicas (codigo, descricao) VALUES ('207-0', 'Sociedade Empresária em Nome Coletivo');
INSERT INTO naturezas_juridicas (codigo, descricao) VALUES ('208-9', 'Sociedade Empresária em Comandita Simples');
-- SELECT * FROM naturezas_juridicas;



-- insert localizacoes
INSERT INTO localizacoes (endereco, bairro, numero, cep, complemento, municipios_id)
					 VALUES('rua empresa 1', 'bairro empresa 1', 123, '1440-000', 'A', 5269);
INSERT INTO localizacoes (endereco, bairro, numero, CEP, complemento, municipios_id)
					 VALUES('rua empresa 2', 'bairro empresa 2', 456, '1740-000', 'A', 5237);
INSERT INTO localizacoes (endereco, bairro, numero, CEP, complemento, municipios_id)
					 VALUES('rua empresa 3', 'bairro empresa 3', 965, '1640-000', 'X', 5204);
INSERT INTO localizacoes (endereco, bairro, numero, CEP, complemento, municipios_id)
					 VALUES('rua empresa 4', 'bairro empresa 4', 153, '1841-500', 'B', 5136);
INSERT INTO localizacoes (endereco, bairro, numero, CEP, complemento, municipios_id)
					 VALUES('rua empresa 5', 'bairro empresa 5', 346, '1740-005', 'Z', 3595);
                     
INSERT INTO localizacoes (endereco, bairro, numero, CEP, complemento, municipios_id)
					 VALUES('rua filial empresa 3', 'bairro filial 3', 965, '1640-190', 'X', 5570);
INSERT INTO localizacoes (endereco, bairro, numero, CEP, complemento, municipios_id)
					 VALUES('rua filial empresa 3', 'bairro fiilal 3', 565, '1940-110', 'X',  5567);
INSERT INTO localizacoes (endereco, bairro, numero, CEP, complemento, municipios_id)
					 VALUES('rua filial empresa 4', 'bairro filial 3', 953, '1861-500', 'B', 5562);
INSERT INTO localizacoes (endereco, bairro, numero, CEP, complemento, municipios_id)
					 VALUES('rua filial empresa 4', 'bairro filial 4', 103, '1851-560', 'B', 5539);
INSERT INTO localizacoes (endereco, bairro, numero, CEP, complemento, municipios_id)
					 VALUES('rua filial empresa 5', 'bairro filial 5', 245, '5689-555', 'F', 1871);
                  
INSERT INTO localizacoes (endereco, bairro, numero, CEP, complemento, municipios_id)
					 VALUES('rua pessoa 1', 'bairro pessoa 1', 456, '5162-565', 'D', 5539);
INSERT INTO localizacoes (endereco, bairro, numero, CEP, complemento, municipios_id)
					 VALUES('rua pessoa 2', 'bairro pessoa 2', 789, '1781-594', 'J', 5539);
INSERT INTO localizacoes (endereco, bairro, numero, CEP, complemento, municipios_id)
					 VALUES('rua pessoa 3', 'bairro pessoa 3', 951, '1411-256', 'L', 5539);
INSERT INTO localizacoes (endereco, bairro, numero, CEP, complemento, municipios_id)
					 VALUES('rua pessoa 4', 'bairro pessoa 4', 6532, '2312-568', 'C', 77);
INSERT INTO localizacoes (endereco, bairro, numero, CEP, complemento, municipios_id)
					 VALUES('rua pessoa 5', 'bairro pessoa 5', 213, '5978-778', 'L', 76);
INSERT INTO localizacoes (endereco, bairro, numero, CEP, complemento, municipios_id)
					 VALUES('rua pessoa 6', 'bairro pessoa 6', 324, '6578-335', 'P', 5539);
INSERT INTO localizacoes (endereco, bairro, numero, CEP, complemento, municipios_id)
					 VALUES('rua pessoa 7', 'bairro pessoa 7', 435, '6555-220', 'H', 11);
INSERT INTO localizacoes (endereco, bairro, numero, CEP, complemento, municipios_id)
					 VALUES('rua pessoa 8', 'bairro pessoa 8', 165, '4586-468', 'W', 5);
INSERT INTO localizacoes (endereco, bairro, numero, CEP, complemento, municipios_id)
					 VALUES('rua pessoa 9', 'bairro pessoa 9', 658, '4685-546', 'Z', 8);
                     
INSERT INTO localizacoes (endereco, bairro, numero, CEP, complemento, municipios_id)
					 VALUES('rua banco 1', 'bairro banco 1', 635, '1771-510', 'A', 80);
INSERT INTO localizacoes (endereco, bairro, numero, CEP, complemento, municipios_id)
					 VALUES('rua banco 2', 'bairro banco 2', 657, '1881-760', 'B', 90);
INSERT INTO localizacoes (endereco, bairro, numero, CEP, complemento, municipios_id)
					 VALUES('rua banco 3', 'bairro banco 3', 468, '1991-660', 'C', 100);
-- SELECT * FROM localizacoes;



-- insert de empresas.
INSERT INTO `EmpresarialGoldDiagrama`.`empresas` (`cnpj`, `razao_social`, `nome_fantasia`, `razao_anterior`, `data_fundacao`, `data_encerramento`, `localizacoes_id`, `naturezas_juridicas_id`, `empresas_matriz_id`) 
											VALUES ('11111111111111', 'empresa 1', 'emp 1', 'razao anterior 1', '1999-12-02', NULL, 1, 2, 1);
INSERT INTO `EmpresarialGoldDiagrama`.`empresas` (`cnpj`, `razao_social`, `nome_fantasia`, `razao_anterior`, `data_fundacao`, `data_encerramento`, `localizacoes_id`, `naturezas_juridicas_id`, `empresas_matriz_id`) 
											VALUES ('22222222222222', 'empresa 2',  'emp 2', 'razao anterior 2', '1974-08-15', NULL, 2, 2, 2);
INSERT INTO `EmpresarialGoldDiagrama`.`empresas` (`cnpj`, `razao_social`, `nome_fantasia`, `razao_anterior`, `data_fundacao`, `data_encerramento`, `localizacoes_id`, `naturezas_juridicas_id`, `empresas_matriz_id`) 
											VALUES ('33333333333333', 'empresa 3', 'emp 3', NULL, '1980-09-30', NULL, 3, 5, 3);
INSERT INTO `EmpresarialGoldDiagrama`.`empresas` (`cnpj`, `razao_social`, `nome_fantasia`, `razao_anterior`, `data_fundacao`, `data_encerramento`, `localizacoes_id`, `naturezas_juridicas_id`, `empresas_matriz_id`) 
											VALUES ('44444444444444', 'empresa 4',  'emp 4', NULL, '1988-05-05', NULL, 4, 6, 4);
INSERT INTO `EmpresarialGoldDiagrama`.`empresas` (`cnpj`, `razao_social`, `nome_fantasia`, `razao_anterior`, `data_fundacao`, `data_encerramento`, `localizacoes_id`, `naturezas_juridicas_id`, `empresas_matriz_id`) 
											VALUES ('55555555555555', 'empresa 5', 'emp 5', 'razao anterior 5', '1982-06-28', NULL, 5, 7, 5);
INSERT INTO `EmpresarialGoldDiagrama`.`empresas` (`cnpj`, `razao_social`, `nome_fantasia`, `razao_anterior`, `data_fundacao`, `data_encerramento`, `localizacoes_id`, `naturezas_juridicas_id`, `empresas_matriz_id`) 
											VALUES ('66666666666666', 'empresa 6', 'emp 6', NULL, '2000-06-28', NULL, 5, 7, 1);
INSERT INTO `EmpresarialGoldDiagrama`.`empresas` (`cnpj`, `razao_social`, `nome_fantasia`, `razao_anterior`, `data_fundacao`, `data_encerramento`, `localizacoes_id`, `naturezas_juridicas_id`, `empresas_matriz_id`) 
											VALUES ('77777777777777', 'empresa 7', 'emp 7 ', 'razao anterior 7', '1982-06-28', NULL, 5, 7, 2);
INSERT INTO `EmpresarialGoldDiagrama`.`empresas` (`cnpj`, `razao_social`, `nome_fantasia`, `razao_anterior`, `data_fundacao`, `data_encerramento`, `localizacoes_id`, `naturezas_juridicas_id`, `empresas_matriz_id`) 
											VALUES ('88888888888888', 'empresa 8', 'emp 8', 'razao anterior 8', '1982-06-28', NULL, 5, 7, 3);
INSERT INTO `EmpresarialGoldDiagrama`.`empresas` (`cnpj`, `razao_social`, `nome_fantasia`, `razao_anterior`, `data_fundacao`, `data_encerramento`, `localizacoes_id`, `naturezas_juridicas_id`, `empresas_matriz_id`) 
											VALUES ('99999999999999', 'empresa 9', 'emp 9', 'razao anterior 9', '1982-06-28', NULL, 5, 7, 4);
INSERT INTO `EmpresarialGoldDiagrama`.`empresas` (`cnpj`, `razao_social`, `nome_fantasia`, `razao_anterior`, `data_fundacao`, `data_encerramento`, `localizacoes_id`, `naturezas_juridicas_id`, `empresas_matriz_id`) 
											VALUES ('11111199999999', 'Banco empresa 1', 'ban 1', 'razao anterior banco 1', '1980-06-30', NULL, 20, 4, 1);
INSERT INTO `EmpresarialGoldDiagrama`.`empresas` (`cnpj`, `razao_social`, `nome_fantasia`, `razao_anterior`, `data_fundacao`, `data_encerramento`, `localizacoes_id`, `naturezas_juridicas_id`, `empresas_matriz_id`) 
											VALUES ('22222299999999', 'Banco empresa 2', 'ban 2', 'razao anterior banco 2', '1976-08-13', NULL, 21, 3, 2);
INSERT INTO `EmpresarialGoldDiagrama`.`empresas` (`cnpj`, `razao_social`, `nome_fantasia`, `razao_anterior`, `data_fundacao`, `data_encerramento`, `localizacoes_id`, `naturezas_juridicas_id`, `empresas_matriz_id`) 
											VALUES ('33333399999999', 'Banco empresa 3', 'ban 3', 'razao anterior banco 3', '1950-07-22', NULL, 22, 2, 3);
-- SELECT * FROM empresas;



-- insert cnae_empresas
INSERT INTO cnae_empresas (empresas_id, cnae_id, primario) 
				   VALUES (1, 1, 1), (2, 2, 1), (3, 3, 1), (4, 4, 1), (5, 5, 1), (1, 11, 0), (2, 12, 0), (3, 13, 0), (4, 14, 0), (5, 15, 0), (5, 16, 0) ;



-- insert junta_comercial
INSERT INTO juntas_comerciais (data_alteracao, capital_social, empresas_id) VALUES ('2011-01-01', 90000, 1); 
INSERT INTO juntas_comerciais (data_alteracao, capital_social, empresas_id) VALUES ('2012-02-02', 90000, 2); 
INSERT INTO juntas_comerciais (data_alteracao, capital_social, empresas_id) VALUES ('2013-03-03', 90000, 3); 
INSERT INTO juntas_comerciais (data_alteracao, capital_social, empresas_id) VALUES ('2014-04-04', 90000, 4); 
INSERT INTO juntas_comerciais (data_alteracao, capital_social, empresas_id) VALUES ('2015-05-05', 90000, 5); 
-- SELECT * FROM juntas_comerciais;



-- insert protestos
INSERT INTO protestos (data_protesto, data_vencimento, num_cartorio, valor, empresas_id, municipios_id) VALUES ('2012-12-12', '2013-01-12', 1, 10000, 5, 5269);
INSERT INTO protestos (data_protesto, data_vencimento, num_cartorio, valor, empresas_id, municipios_id) VALUES ('2011-11-11', '2011-12-11', 2, 20000, 5, 5237);
INSERT INTO protestos (data_protesto, data_vencimento, num_cartorio, valor, empresas_id, municipios_id) VALUES ('2013-03-23', '2013-04-23', 3, 15000, 1, 5204);
INSERT INTO protestos (data_protesto, data_vencimento, num_cartorio, valor, empresas_id, municipios_id) VALUES ('2014-04-04', '2014-05-04', 4, 2000, 2, 5136);
-- SELECT * FROM protestos



-- insert nire
INSERT INTO nire (num_nire, municipios_id, empresas_id) VALUES('00000111111', 5269, 1);
INSERT INTO nire (num_nire, municipios_id, empresas_id) VALUES('00000222222', 5237, 2);
INSERT INTO nire (num_nire, municipios_id, empresas_id) VALUES('00000333333', 5204, 3);
INSERT INTO nire (num_nire, municipios_id, empresas_id) VALUES('00000444444', 5136, 4);
INSERT INTO nire (num_nire, municipios_id, empresas_id) VALUES('00000555555', 3595, 5);
-- SELECT * FROM nire;



-- insert inscricoes_estaduais
INSERT INTO inscricoes_estaduais (num_inscricao, municipios_id, empresas_id) VALUES('00000001111111', 5269, 1);
INSERT INTO inscricoes_estaduais (num_inscricao, municipios_id, empresas_id) VALUES('00000002222222', 5237, 2);
INSERT INTO inscricoes_estaduais (num_inscricao, municipios_id, empresas_id) VALUES('00000003333333', 5204, 3);
INSERT INTO inscricoes_estaduais (num_inscricao, municipios_id, empresas_id) VALUES('00000004444444', 5136, 4);
INSERT INTO inscricoes_estaduais (num_inscricao, municipios_id, empresas_id) VALUES('00000005555555', 3595, 5);
-- SELECT * FROM inscricoes_estaduais;



-- INSERT cheques_situacoes
INSERT INTO cheques_situacoes (codigo, descricao) VALUES ('11', 'FALTA FUNDOS - PRIMEIRA APRESENTAÇÃO');
INSERT INTO cheques_situacoes (codigo, descricao) VALUES ('12', 'FALTA FUNDOS - SEGUNDA APRESENTAÇÃO');
INSERT INTO cheques_situacoes (codigo, descricao) VALUES ('13', 'CONTA ENCERRADA');
INSERT INTO cheques_situacoes (codigo, descricao) VALUES ('14', 'PRÁTICA ESPÚRIA (ILEGAL)');
INSERT INTO cheques_situacoes (codigo, descricao) VALUES ('20', 'CANCELAMENTO DE FOLHA DE CHEQUE EM BRANCO, SOLICITADO PELO CLIENTE');
INSERT INTO cheques_situacoes (codigo, descricao) VALUES ('21', 'CHEQUE SUSTADO PELO EMITENTE OU PORTADOR');
INSERT INTO cheques_situacoes (codigo, descricao) VALUES ('22', 'DIVERGÊNCIA OU INSUFICIÊNCIA DE ASSINATURA');
INSERT INTO cheques_situacoes (codigo, descricao) VALUES ('23', 'CHEQUE DE ÓRGÃO DA ADMINISTRAÇÃO PÚBLICA EM DESACORDO COM DL 200');
INSERT INTO cheques_situacoes (codigo, descricao) VALUES ('24', 'BLOQUEIO JUDICIAL OU DETERMINAÇÃO DO BANCO CENTRAL');
INSERT INTO cheques_situacoes (codigo, descricao) VALUES ('25', 'CANCELAMENTO DE TALÃO DE CHEQUES PELO BANCO SACADO');
-- SELECT * FROM cheques_situacoes;



-- insert bancos
INSERT INTO bancos (codigo, num_agencia, empresas_id) VALUES ('123', '11111', 10);
INSERT INTO bancos (codigo, num_agencia, empresas_id) VALUES ('456', '22222', 11);
INSERT INTO bancos (codigo, num_agencia, empresas_id) VALUES ('789', '33333', 12);
-- SELECT * FROM bancos;



-- insert de cheques.
INSERT INTO `EmpresarialGoldDiagrama`.`cheques` (`num_cheque`, `data_cheque`, `valor`, `num_conta`, `empresas_id`, `cheques_situacoes_id`, `bancos_id`) 
										 VALUES ('000011', '2009-01-01', 15000, '0111111', 2, 1, 1);
INSERT INTO `EmpresarialGoldDiagrama`.`cheques` (`num_cheque`, `data_cheque`, `valor`, `num_conta`, `empresas_id`, `cheques_situacoes_id`, `bancos_id`) 
										 VALUES ('000022', '2012-02-02', 20000, '0222222', 3, 1, 2);
INSERT INTO `EmpresarialGoldDiagrama`.`cheques` (`num_cheque`, `data_cheque`, `valor`, `num_conta`, `empresas_id`, `cheques_situacoes_id`, `bancos_id`) 
										 VALUES ('000033', '2013-03-03', 1500.55 , '0333333', 4, NULL, 3);
-- SELECT * FROM cheques;



-- insert de protesto.
INSERT INTO `EmpresarialGoldDiagrama`.`protestos` (`data_protesto`, `data_vencimento`, `num_cartorio`, `valor`, `empresas_id`, `municipios_id`) 
											 VALUES ('2002-12-01', '2002-12-30', 1, 1500, 1, 1);
INSERT INTO `EmpresarialGoldDiagrama`.`protestos` (`data_protesto`, `data_vencimento`, `num_cartorio`, `valor`, `empresas_id`, `municipios_id`) 
											 VALUES ('2005-06-06', '2006-12-06', 5, 3600, 3, 653);
INSERT INTO `EmpresarialGoldDiagrama`.`protestos` ( `data_protesto`, `data_vencimento`, `num_cartorio`, `valor`, `empresas_id`, `municipios_id`) 
											 VALUES ('2013-03-03', '2014-03-03', 3, 300000, 5, 4298);
INSERT INTO `EmpresarialGoldDiagrama`.`protestos` (`data_protesto`, `data_vencimento`, `num_cartorio`, `valor`, `empresas_id`, `municipios_id`) 
											 VALUES ('2014-04-04', '2015-04-04', 6, 500, 4, 1167);
-- SELECT * FROM protestos;



-- insert cnae_empresas
INSERT INTO cnae_empresas (empresas_id, cnae_id, primario) 
	VALUES (1, 419, 1);
INSERT INTO cnae_empresas (empresas_id, cnae_id, primario) 
	VALUES (2, 744, 1);
INSERT INTO cnae_empresas (empresas_id, cnae_id, primario) 
	VALUES (3, 1154, 1);
INSERT INTO cnae_empresas (empresas_id, cnae_id, primario) 
	VALUES (3, 1068, 1);
INSERT INTO cnae_empresas (empresas_id, cnae_id, primario) 
	VALUES (5, 1141, 1);
-- secundarios
INSERT INTO cnae_empresas (empresas_id, cnae_id, primario) 
	VALUES (1, 418, 0);
INSERT INTO cnae_empresas (empresas_id, cnae_id, primario) 
	VALUES (1, 420, 0);
INSERT INTO cnae_empresas (empresas_id, cnae_id, primario) 
	VALUES (1, 422, 0);
    
INSERT INTO cnae_empresas (empresas_id, cnae_id, primario) 
	VALUES (2, 508, 0);
INSERT INTO cnae_empresas (empresas_id, cnae_id, primario) 
	VALUES (2, 678, 0);
    
INSERT INTO cnae_empresas (empresas_id, cnae_id, primario) 
	VALUES (3, 302, 0);
INSERT INTO cnae_empresas (empresas_id, cnae_id, primario) 
	VALUES (3, 302, 0);
INSERT INTO cnae_empresas (empresas_id, cnae_id, primario) 
	VALUES (3, 300, 0);
INSERT INTO cnae_empresas (empresas_id, cnae_id, primario) 
	VALUES (3, 984, 0);

INSERT INTO cnae_empresas (empresas_id, cnae_id, primario) 
	VALUES (3, 1072, 0);
INSERT INTO cnae_empresas (empresas_id, cnae_id, primario) 
	VALUES (3, 1074, 0);
-- SELECT * FROM cnae_empresas;



-- insert pendencias_resticoes
INSERT INTO pendencias_resticoes (empresa_id_devedor, data_inicio, valor, pendencia, empresa_id_credor)
									  VALUES (4, '2016-01-05', 6000, 0, 5);
INSERT INTO pendencias_resticoes (empresa_id_devedor, data_inicio, valor, pendencia, empresa_id_credor)
									  VALUES (2, '2017-01-05', 70500, 0, 5);
INSERT INTO pendencias_resticoes (empresa_id_devedor, data_inicio, valor, pendencia, empresa_id_credor)
									  VALUES (3, '2017-01-05', 70500, 1, 1);
INSERT INTO pendencias_resticoes (empresa_id_devedor, data_inicio, valor, pendencia, empresa_id_credor)
									  VALUES (5, '2017-01-05', 70500, 1, 2);
-- SELECT * FROM pendencias_resticoes;



-- insert estado_civil
INSERT INTO estado_civil (estado_civil) VALUES ('SOLTEIRO (A)');
INSERT INTO estado_civil (estado_civil) VALUES ('CASADO (A)');
INSERT INTO estado_civil (estado_civil) VALUES ('VIUVO (A)');
-- SELECT * FROM estado_civil;



-- insert nacionalidade
INSERT INTO nacionalidade (nacionalidade) VALUES('BRASILEIRA');
INSERT INTO nacionalidade (nacionalidade) VALUES('AMERICANA');
INSERT INTO nacionalidade (nacionalidade) VALUES('ITALIANA');
-- SELECT * FROM nacionalidade;



-- insert sexo
INSERT INTO sexo (sexo) VALUES ('M');
INSERT INTO sexo (sexo) VALUES ('F');
INSERT INTO sexo (sexo) VALUES ('I');
-- SELECT * FROM sexo;



-- insert pessoas
INSERT INTO pessoas (cpf_cnpj, nome,  data_nascimento, capital, pessoa_juridica, estado_civil_id, sexo_id, nacionalidade_id) 
			   VALUES ('12123123123412', 'Marcos Eugenio', '1990-05-05', 699000,  1, 1, 1, 1);
INSERT INTO pessoas (cpf_cnpj, nome,  data_nascimento, capital, pessoa_juridica, estado_civil_id, sexo_id, nacionalidade_id) 
			   VALUES ('99999999999999', 'Brenda Marques','1987-07-01',  789000, 1, 2, 2, 1);
INSERT INTO pessoas (cpf_cnpj, nome,  data_nascimento, capital, pessoa_juridica, estado_civil_id, sexo_id, nacionalidade_id) 
			   VALUES ('88888999888898', 'Cintia Moreira', '1977-07-23',  919900, 1, 3, 2, 2);
INSERT INTO pessoas (cpf_cnpj, nome,  data_nascimento, capital, pessoa_juridica, estado_civil_id, sexo_id, nacionalidade_id) 
			   VALUES ('66666235265919','Simone Generoso', '1995-11-15',  501, 1, 1, 2, 3);
INSERT INTO pessoas (cpf_cnpj, nome,  data_nascimento, capital, pessoa_juridica, estado_civil_id, sexo_id, nacionalidade_id) 
			   VALUES ('33399999399', 'Carlos Fransisco', '1999-10-15', 66000, 0, 2, 1, 1);
INSERT INTO pessoas (cpf_cnpj, nome,  data_nascimento, capital, pessoa_juridica, estado_civil_id, sexo_id, nacionalidade_id) 
			   VALUES ('99977798899', 'Jose Moreno Santos', '1983-11-013', 899000, 0, 2, 1, 2);
INSERT INTO pessoas (cpf_cnpj, nome,  data_nascimento, capital, pessoa_juridica, estado_civil_id, sexo_id, nacionalidade_id) 
			   VALUES ('77799922299', 'Kevin Machado', '1977-02-02', 56000, 0, 3, 1, 1);
INSERT INTO pessoas (cpf_cnpj, nome,  data_nascimento, capital, pessoa_juridica, estado_civil_id, sexo_id, nacionalidade_id) 
			   VALUES ('99900099999', 'Jefferson Santos', '1979-09-09', 89000, 0, 2, 1, 1);
INSERT INTO pessoas (cpf_cnpj, nome,  data_nascimento, capital, pessoa_juridica, estado_civil_id, sexo_id, nacionalidade_id) 
			   VALUES ('99999999999','Bruna Ferreira', '1990-04-04', 10090000, 0, 1, 3, 2);               
-- SELECT * FROM pessoas;



-- insert participacoes_empresas
INSERT INTO participacoes_empresas (data_entrada, porc_capital, empresas_id_participada)
							 VALUES('2002-02-02', 50, 3);
INSERT INTO participacoes_empresas (data_entrada, porc_capital, empresas_id_participada)
							 VALUES('2000-02-02', 25, 2);
INSERT INTO participacoes_empresas (data_entrada, porc_capital, empresas_id_participada)
							 VALUES('2000-02-02', 10.5, 5);
INSERT INTO participacoes_empresas (data_entrada, porc_capital, empresas_id_participada)
							 VALUES('2012-12-29', 29.8, 1);
-- SELECT * FROM participacoes_empresas;



-- insert participacoes_pf
INSERT INTO participacoes_pf (participacoes_empresas_id, pessoas_id) VALUES (1, 1);
INSERT INTO participacoes_pf (participacoes_empresas_id, pessoas_id) VALUES (2, 2);
-- SELECT * FROM participacoes_pf



-- insert participacoes_pj
INSERT INTO participacoes_pj (participacoes_empresas_id, empresas_id) VALUES (3, 1);
INSERT INTO participacoes_pj (participacoes_empresas_id, empresas_id) VALUES (4, 4);
-- SELECT * FROM participacoes_pj


                    
-- insert recuperacoes_falencias_acoes
INSERT INTO recuperacoes_falencias_acoes (data_ocorrencia, vara, municipios_id, empresa_id, ocorrencias_id)
							 VALUES('2000-02-02', '1°Vara', 3736, 2, 1);
INSERT INTO recuperacoes_falencias_acoes (data_ocorrencia, vara, municipios_id, empresa_id, ocorrencias_id)
							 VALUES('2010-03-03', '1°Vara', 5237, 5, 3);						
INSERT INTO recuperacoes_falencias_acoes (data_ocorrencia, vara, municipios_id, empresa_id, ocorrencias_id)
							 VALUES('2013-12-18', '5°Vara', 3736, 4, 3);
INSERT INTO recuperacoes_falencias_acoes (data_ocorrencia, vara, municipios_id, empresa_id, ocorrencias_id)
							 VALUES('2015-06-25', '2°Vara', 5539, 5, 3);
INSERT INTO recuperacoes_falencias_acoes (data_ocorrencia, vara, municipios_id, empresa_id, ocorrencias_id)
							 VALUES('2017-01-20', '9°Vara', 3736, 1, 3);
-- SELECT * FROM recuperacoes_falencias_acoes;




-- insert fornecedores
INSERT INTO fornecedores (empresas_id, empresas_fornecedor_id, data_entrada, data_fim) 
					VALUES(1, 3, '2010-12-01', NULL);
INSERT INTO fornecedores (empresas_id, empresas_fornecedor_id, data_entrada, data_fim) 
					VALUES(5, 4, '2015-08-30', NULL);
INSERT INTO fornecedores (empresas_id, empresas_fornecedor_id, data_entrada, data_fim) 
					VALUES(2, 4, '2017-06-20', NULL);
INSERT INTO fornecedores (empresas_id, empresas_fornecedor_id, data_entrada, data_fim) 
					VALUES(4, 5, '2017-06-20', NULL);
INSERT INTO fornecedores (empresas_id, empresas_fornecedor_id, data_entrada, data_fim) 
					VALUES(4, 5, '2017-06-20', '2017-12-20');
INSERT INTO fornecedores (empresas_id, empresas_fornecedor_id, data_entrada, data_fim) 
					VALUES(2, 3, '2017-06-20', '2017-07-20');
-- SELECT * FROM fornecedores;



-- insert into produtos
INSERT INTO produtos (nome, descricao, preco, fornecedores_id) 
				VALUES ('TRANSISTOR', 'CAIXA COM 1000 COMPONENTES', 50.5, 1);
INSERT INTO produtos (nome, descricao, preco, fornecedores_id) 
				VALUES ('FITA ADESIVA', 'CAIXA COM 100 UNIDADES', 100.0, 2);
INSERT INTO produtos (nome, descricao, preco, fornecedores_id) 
				VALUES ('COLA PLASTICA', 'CAIXA COM 50 UNIDADES', 150.0, 3);
INSERT INTO produtos (nome, descricao, preco, fornecedores_id) 
				VALUES ('PALLET', 'PALLET DE MADEIRA', 30.8, 4);
INSERT INTO produtos (nome, descricao, preco, fornecedores_id) 
				VALUES ('CLIPS', 'CAIXA COM 500 UNIDADES', 70.8, 5);
-- SELECT * FROM produtos;



-- insert compras
INSERT INTO compras (data_compra, total, valor_entrada, qtde_parcelas , empresas_id)
				VALUES('2015-05-05', 1000, 10, 2, 1);

INSERT INTO compras (data_compra, total, valor_entrada, qtde_parcelas, empresas_id)
				VALUES('2016-05-05', 2000, 15.2, 3, 2);
                
INSERT INTO compras (data_compra, total, valor_entrada, qtde_parcelas, empresas_id)
				VALUES('2017-03-05', 5000, 5000, 0, 3);

INSERT INTO compras (data_compra, total, valor_entrada, qtde_parcelas, empresas_id)
				VALUES('2012-03-01', 6000, 0, 4, 4);

INSERT INTO compras (data_compra, total, valor_entrada, qtde_parcelas, empresas_id)
				VALUES('2016-04-09', 500, 500, 0, 5);
-- select * from compras;



-- insert compras_has_produtos
INSERT INTO compras_has_produtos (compras_id, produtos_id, quantidade) VALUES (1, 1, 3);
INSERT INTO compras_has_produtos (compras_id, produtos_id, quantidade) VALUES (1, 2, 4);
INSERT INTO compras_has_produtos (compras_id, produtos_id, quantidade) VALUES (1, 3, 1);

INSERT INTO compras_has_produtos (compras_id, produtos_id, quantidade) VALUES (2, 1, 3);
INSERT INTO compras_has_produtos (compras_id, produtos_id, quantidade) VALUES (2, 2, 4);
INSERT INTO compras_has_produtos (compras_id, produtos_id, quantidade) VALUES (2, 4, 1);

INSERT INTO compras_has_produtos (compras_id, produtos_id, quantidade) VALUES (3, 4, 3);

INSERT INTO compras_has_produtos (compras_id, produtos_id, quantidade) VALUES (4, 1, 4);

INSERT INTO compras_has_produtos (compras_id, produtos_id, quantidade) VALUES (5, 2, 8);
INSERT INTO compras_has_produtos (compras_id, produtos_id, quantidade) VALUES (5, 1, 2);
-- SELECT * FROM compras_has_produtos;



-- insert parcelas
INSERT INTO parcelas (valor, juros, data_vencimento, data_pagamento, num_parcela, compras_id) VALUES (490, 0, '2015-06-05', '2015-06-01', 1, 1);
INSERT INTO parcelas (valor, juros, data_vencimento, data_pagamento, num_parcela, compras_id) VALUES (500, 0, '2015-07-05', '2015-07-02', 2, 1);

INSERT INTO parcelas (valor, juros, data_vencimento, data_pagamento, num_parcela, compras_id) VALUES (666.66, 0, '2016-06-05', '2016-06-01', 1, 2);
INSERT INTO parcelas (valor, juros, data_vencimento, data_pagamento, num_parcela, compras_id) VALUES (666.66, 10.5, '2016-07-05', '2016-07-06', 2, 2);
INSERT INTO parcelas (valor, juros, data_vencimento, data_pagamento, num_parcela, compras_id) VALUES (666.66, 0, '2016-08-05', '2016-08-02', 3, 2);

INSERT INTO parcelas (valor, juros, data_vencimento, data_pagamento, num_parcela, compras_id) VALUES (1500, 0, '2012-04-05', '2015-04-03', 1, 4);
INSERT INTO parcelas (valor, juros, data_vencimento, data_pagamento, num_parcela, compras_id) VALUES (1500, 0, '2012-05-05', '2015-05-02', 2, 4);
INSERT INTO parcelas (valor, juros, data_vencimento, data_pagamento, num_parcela, compras_id) VALUES (1500, 200.75, '2012-06-05', '2012-06-20', 1, 4);
INSERT INTO parcelas (valor, juros, data_vencimento, data_pagamento, num_parcela, compras_id) VALUES (1500, 100.85, '2012-07-05', '2012-07-10', 2, 4);
-- SELECT * FROM parcelas;



-- insert consulta
INSERT INTO consultas (data_consulta, empresa_consultado_id, empresa_consulente_id)
				  VALUES('2005-01-01', 4, 5);
INSERT INTO consultas (data_consulta, empresa_consultado_id, empresa_consulente_id)
				  VALUES('2010-01-01', 3, 5);
INSERT INTO consultas (data_consulta, empresa_consultado_id, empresa_consulente_id)
				  VALUES('2015-01-01', 3, 5);
INSERT INTO consultas (data_consulta, empresa_consultado_id, empresa_consulente_id)
				  VALUES('2012-02-02', 4, 1);
INSERT INTO consultas (data_consulta, empresa_consultado_id, empresa_consulente_id)
				  VALUES('2009-09-01', 1, 4);
INSERT INTO consultas (data_consulta, empresa_consultado_id, empresa_consulente_id)
				  VALUES('2013-03-01', 1, 2); 
-- select * from consultas;



-- insert situacoes_cnpj
INSERT INTO situacoes_cnpj (situacao) VALUES ('ATIVA');
INSERT INTO situacoes_cnpj (situacao) VALUES ('SUSPENSA');
INSERT INTO situacoes_cnpj (situacao) VALUES ('INAPTA');
INSERT INTO situacoes_cnpj (situacao) VALUES ('BAIXADA');
INSERT INTO situacoes_cnpj (situacao) VALUES ('NULA');
-- SELECT * FROM situacoes_cnpj



-- insert consultas_cnpj
INSERT INTO consultas_cnpj (data_consulta, data_alteracao, empresas_id, situacoes_cnpj_id) VALUES ('2017-06-05', '2017-06-25', 1, 1);
INSERT INTO consultas_cnpj (data_consulta, data_alteracao, empresas_id, situacoes_cnpj_id) VALUES ('2017-07-05', NULL , 1, 1);

INSERT INTO consultas_cnpj (data_consulta, data_alteracao, empresas_id, situacoes_cnpj_id) VALUES ('2015-06-05', '2015-06-12', 2, 4);
INSERT INTO consultas_cnpj (data_consulta, data_alteracao, empresas_id, situacoes_cnpj_id) VALUES ('2016-11-15', NULL , 2, 1);
INSERT INTO consultas_cnpj (data_consulta, data_alteracao, empresas_id, situacoes_cnpj_id) VALUES ('2017-06-05', NULL , 2, 1);

INSERT INTO consultas_cnpj (data_consulta, data_alteracao, empresas_id, situacoes_cnpj_id) VALUES ('2014-08-16', NULL, 3, 1);
INSERT INTO consultas_cnpj (data_consulta, data_alteracao, empresas_id, situacoes_cnpj_id) VALUES ('2016-04-23', NULL , 3, 1);
INSERT INTO consultas_cnpj (data_consulta, data_alteracao, empresas_id, situacoes_cnpj_id) VALUES ('2017-05-12', '2017-05-07' , 3, 3);

INSERT INTO consultas_cnpj (data_consulta, data_alteracao, empresas_id, situacoes_cnpj_id) VALUES ('2009-06-05', NULL, 4, 1);
INSERT INTO consultas_cnpj (data_consulta, data_alteracao, empresas_id, situacoes_cnpj_id) VALUES ('2014-07-29', NULL , 4, 1);
INSERT INTO consultas_cnpj (data_consulta, data_alteracao, empresas_id, situacoes_cnpj_id) VALUES ('2016-06-05', '2015-12-03' , 4, 2);

INSERT INTO consultas_cnpj (data_consulta, data_alteracao, empresas_id, situacoes_cnpj_id) VALUES ('2005-06-05', NULL, 5, 1);
INSERT INTO consultas_cnpj (data_consulta, data_alteracao, empresas_id, situacoes_cnpj_id) VALUES ('2010-01-26', NULL , 5, 1);
INSERT INTO consultas_cnpj (data_consulta, data_alteracao, empresas_id, situacoes_cnpj_id) VALUES ('2016-08-05', '2016-03-13' , 5, 1);
-- SELECT * FROM consultas_cnpj



-- insert situacoes_sintegra
INSERT INTO situacoes_sintegra (situacao) VALUES ('HABILITADO');
INSERT INTO situacoes_sintegra (situacao) VALUES ('NÃO HABILITADO');
INSERT INTO situacoes_sintegra (situacao) VALUES ('NENHUMA OCORRÊNCIA');
-- SELECT * FROM situacoes_sintegra;



-- insert consultas_sintegra
INSERT INTO consultas_sintegra (data_consulta, data_alteracao, empresas_id, situacoes_sintegra_id) VALUES ('2015-05-05', NULL, 1, 1);
INSERT INTO consultas_sintegra (data_consulta, data_alteracao, empresas_id, situacoes_sintegra_id) VALUES ('2016-06-06', NULL, 1, 1);
INSERT INTO consultas_sintegra (data_consulta, data_alteracao, empresas_id, situacoes_sintegra_id) VALUES ('2017-07-07', '2017-04-04', 1, 2);

INSERT INTO consultas_sintegra (data_consulta, data_alteracao, empresas_id, situacoes_sintegra_id) VALUES ('2015-08-08', NULL, 2, 1);
INSERT INTO consultas_sintegra (data_consulta, data_alteracao, empresas_id, situacoes_sintegra_id) VALUES ('2016-09-09', NULL, 2, 1);
INSERT INTO consultas_sintegra (data_consulta, data_alteracao, empresas_id, situacoes_sintegra_id) VALUES ('2017-10-10', '2017-05-04', 2, 2);

INSERT INTO consultas_sintegra (data_consulta, data_alteracao, empresas_id, situacoes_sintegra_id) VALUES ('2015-01-01', NULL, 3, 1);
INSERT INTO consultas_sintegra (data_consulta, data_alteracao, empresas_id, situacoes_sintegra_id) VALUES ('2016-02-02', NULL, 3, 1);
INSERT INTO consultas_sintegra (data_consulta, data_alteracao, empresas_id, situacoes_sintegra_id) VALUES ('2017-03-03', '2017-02-02', 3, 3);

INSERT INTO consultas_sintegra (data_consulta, data_alteracao, empresas_id, situacoes_sintegra_id) VALUES ('2004-05-25', NULL, 4, 1);
INSERT INTO consultas_sintegra (data_consulta, data_alteracao, empresas_id, situacoes_sintegra_id) VALUES ('2015-06-16', NULL, 4, 1);
INSERT INTO consultas_sintegra (data_consulta, data_alteracao, empresas_id, situacoes_sintegra_id) VALUES ('2017-07-18', '2017-04-04', 4, 1);

INSERT INTO consultas_sintegra (data_consulta, data_alteracao, empresas_id, situacoes_sintegra_id) VALUES ('2010-06-18', NULL, 5, 1);
INSERT INTO consultas_sintegra (data_consulta, data_alteracao, empresas_id, situacoes_sintegra_id) VALUES ('2015-12-12', NULL, 5, 1);
INSERT INTO consultas_sintegra (data_consulta, data_alteracao, empresas_id, situacoes_sintegra_id) VALUES ('2017-07-24', '2017-04-04', 5, 1);
-- SELECT * FROM consutas_sintegra;



-- insert socios
INSERT INTO socios (data_entrada, participacao, empresas_id) 
			VALUES ('2010-10-02', 20, 1);
INSERT INTO socios (data_entrada, participacao, empresas_id) 
			VALUES ('2015-11-02', 10, 2);
INSERT INTO socios (data_entrada, participacao, empresas_id) 
			VALUES ('2010-10-02', 3, 3);
INSERT INTO socios (data_entrada, participacao, empresas_id) 
			VALUES ('2013-09-12', 13, 4);
INSERT INTO socios (data_entrada, participacao, empresas_id) 
			VALUES ('2002-02-13', 15, 5);
INSERT INTO socios (data_entrada, participacao, empresas_id) 
			VALUES ('2000-11-11', 30, 1);
INSERT INTO socios (data_entrada, participacao, empresas_id) 
			VALUES ('2001-08-08', 36, 2);
INSERT INTO socios (data_entrada, participacao, empresas_id) 
			VALUES ('2012-12-12', 19, 3);
INSERT INTO socios (data_entrada, participacao, empresas_id) 
			VALUES ('2009-09-09', 12.5, 4);
-- SELECT * FROM socios


-- insert socios_pf			
INSERT INTO socios_pf (pessoas_id, socios_id) VALUES (5, 1);
INSERT INTO socios_pf (pessoas_id, socios_id) VALUES (6, 2);
INSERT INTO socios_pf (pessoas_id, socios_id) VALUES (7, 3);
INSERT INTO socios_pf (pessoas_id, socios_id) VALUES (8, 4);
-- SELECT * FROM socios_pf



-- insert socio_pj
INSERT INTO socios_pj (socios_id, empresas_id) VALUES (3, 5);
INSERT INTO socios_pj (socios_id, empresas_id) VALUES (4, 5);
-- SELECT * FROM socio_pj



-- insert cargos
INSERT INTO cargos(nome, descricao) VALUES ('Diretor', 'descricao diretor');
INSERT INTO cargos(nome, descricao) VALUES ('Administrador de Marketing', 'descricao Administrador marketing');
INSERT INTO cargos(nome, descricao) VALUES ('Administrador de e-Commerce', 'descricao Administrador de e-Commerce');
INSERT INTO cargos(nome, descricao) VALUES ('Administrador Financeiro', 'descricao Administrador Financeiro');
INSERT INTO cargos(nome, descricao) VALUES ('Administrador de e-Commerce', 'descricao Administrador de e-Commerce');
INSERT INTO cargos(nome, descricao) VALUES ('Vice-Presidente Administrativo', 'descricao Vice-Presidente Administrativo');
-- SELECT * FROM cargos;



-- insert administradores
INSERT INTO administradores (data_entrada, cargos_id, empresas_id) VALUES ('2010-05-29', 1, 1);
INSERT INTO administradores (data_entrada, cargos_id, empresas_id) VALUES ('2011-01-12', 2, 2);
INSERT INTO administradores (data_entrada, cargos_id, empresas_id) VALUES ('2009-08-20', 3, 3);
INSERT INTO administradores (data_entrada, cargos_id, empresas_id) VALUES ('2012-11-04', 4, 4);
INSERT INTO administradores (data_entrada, cargos_id, empresas_id) VALUES ('2015-04-08', 5, 5);
-- SELECT * FROM administradores



-- insert administradores_pf
INSERT INTO administradores_pf (administradores_id, pessoas_id) VALUES (1, 7);
INSERT INTO administradores_pf (administradores_id, pessoas_id) VALUES (2, 8);
-- SELECT * FROM administradores_pf;



-- insert administradores_pj
INSERT INTO administradores_pj (administradores_id, empresas_id) VALUES (3, 1);
INSERT INTO administradores_pj (administradores_id, empresas_id) VALUES (4, 2);
-- SELECT * FROM administradores_pj



-- insert tipos_inadimplencias
INSERT INTO tipos_inadimplencias (tipo) VALUES ('I'), ('J'), ('K'), ('L'); 
-- SELECT * FROM tipos_inadimplencias



-- insert inadimplencias
INSERT INTO inadimplencias (data_inadimplencia, empresas_id, tipos_inadimplencias_id) 
					VALUES ('2003-03-03', 1, 1), ('2003-03-03', 1, 1), ('2010-10-10', 1, 2), ('2012-12-12', 2, 3), ('2015-12-12', 3, 1);
-- SELECT * FROM inadimplencias;



-- insert inadimplencias_pf
INSERT INTO inadimplencias_pf (inadimplencias_id, pessoas_id) VALUES (1, 5);
INSERT INTO inadimplencias_pf (inadimplencias_id, pessoas_id) VALUES (2, 3);
-- SELECT * FROM inadimplencias_pf;



-- insert inadimplencias_pj 
INSERT INTO inadimplencias_pj (inadimplencias_id, empresas_id) VALUES (1, 1);
INSERT INTO inadimplencias_pj (inadimplencias_id, empresas_id) VALUES (2, 2);
-- SELECT * FROM inadimplencias_pJ;



-- insert telefones
INSERT INTO telefones (ddd, numero) VALUES ('11', '1212-1212');
INSERT INTO telefones (ddd, numero) VALUES ('11', '3332-1212');
INSERT INTO telefones (ddd, numero) VALUES ('14', '5553-1212');
INSERT INTO telefones (ddd, numero) VALUES ('14', '1212-9999');
INSERT INTO telefones (ddd, numero) VALUES ('15', '1456-13212');
INSERT INTO telefones (ddd, numero) VALUES ('13', '8888-1212');
INSERT INTO telefones (ddd, numero) VALUES ('11', '4444-7777');
INSERT INTO telefones (ddd, numero) VALUES ('10', '9658-4679');
INSERT INTO telefones (ddd, numero) VALUES ('10', '3265-2659');

INSERT INTO telefones (ddd, numero) VALUES ('10', '3265-6425');
INSERT INTO telefones (ddd, numero) VALUES ('13', '1111-2659');
INSERT INTO telefones (ddd, numero) VALUES ('16', '3265-4679');
INSERT INTO telefones (ddd, numero) VALUES ('10', '6589-2879');
INSERT INTO telefones (ddd, numero) VALUES ('16', '3265-2659');
INSERT INTO telefones (ddd, numero) VALUES ('11', '5289-2659');
INSERT INTO telefones (ddd, numero) VALUES ('18', '4567-1235');
INSERT INTO telefones (ddd, numero) VALUES ('20', '3265-2301');
INSERT INTO telefones (ddd, numero) VALUES ('21', '1478-6458');
-- SELECT * FROM telefones;



-- insert telefones_empresas
INSERT INTO telefones_empresas (empresas_id, telefones_id) 
						VALUES (1, 1);
INSERT INTO telefones_empresas (empresas_id, telefones_id) 
						VALUES (2, 2);
INSERT INTO telefones_empresas (empresas_id, telefones_id) 
						VALUES (3, 3);
INSERT INTO telefones_empresas (empresas_id, telefones_id) 
						VALUES (4, 4);
INSERT INTO telefones_empresas (empresas_id, telefones_id) 
						VALUES (5, 5);
-- select * from telefones_empresas;
                        
                  
                  
-- insert telefones_pessoas
INSERT INTO telefones_pessoas (pessoas_id, telefones_id) 
					   VALUES (1, 10);
INSERT INTO telefones_pessoas (pessoas_id, telefones_id) 
					   VALUES (2, 11);
INSERT INTO telefones_pessoas (pessoas_id, telefones_id) 
					   VALUES (3, 12);
INSERT INTO telefones_pessoas (pessoas_id, telefones_id) 
					   VALUES (4, 13);
INSERT INTO telefones_pessoas (pessoas_id, telefones_id) 
					   VALUES (5, 14);                       
INSERT INTO telefones_pessoas (pessoas_id, telefones_id) 
					   VALUES (6, 15);
INSERT INTO telefones_pessoas (pessoas_id, telefones_id) 
					   VALUES (7, 16);
INSERT INTO telefones_pessoas (pessoas_id, telefones_id) 
					   VALUES (8, 17);
INSERT INTO telefones_pessoas (pessoas_id, telefones_id) 
					   VALUES (9, 18);
-- SELECT * FROM telefones_pessoas;



-- insert localizacoes_pessoas
INSERT INTO localizacoes_pessoas (localizacoes_id, pessoas_id) 
VALUES (11, 1);
INSERT INTO localizacoes_pessoas (localizacoes_id, pessoas_id) 
VALUES (12, 2);
INSERT INTO localizacoes_pessoas (localizacoes_id, pessoas_id) 
VALUES (13, 3);
INSERT INTO localizacoes_pessoas (localizacoes_id, pessoas_id) 
VALUES (14, 4);
INSERT INTO localizacoes_pessoas (localizacoes_id, pessoas_id) 
VALUES (15, 5);
INSERT INTO localizacoes_pessoas (localizacoes_id, pessoas_id) 
VALUES (16, 6);
INSERT INTO localizacoes_pessoas (localizacoes_id, pessoas_id) 
VALUES (17, 7);
INSERT INTO localizacoes_pessoas (localizacoes_id, pessoas_id) 
VALUES (18, 8); 
INSERT INTO localizacoes_pessoas (localizacoes_id, pessoas_id) 
VALUES (19, 9);
-- select * from localizacoes_pessoas;
   
   
 
 -- insert tipo_logs
 insert into tipos_logs (log) values ('PAGAMENTO PONTUAL'), ('PAGAMENTO COM ATRASO 6-15 DIAS'), ('CONSULTA');
 -- SELECT * FROM tipos_logs;
 
 
-- insert logs
INSERT INTO `logs` (data_log, tipos_logs_id) VALUES ('2017-06-01', 1), ('2017-05-05', 1),('2017-04-04', 1),('2017-03-03', 1),('2017-01-21', 1);
 -- SELECT * FROM logs;



