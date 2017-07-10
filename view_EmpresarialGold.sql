
-- alter table TblEmpresa Change `Razão Social` RazaoSocial TEXT;
-- alter table TblEmpresa ADD COLUMN dataCNPJ date not null default '2010-10-10';
-- alter table TblEmpresa ADD COLUMN dataSINTEGRA date not null default '2010-10-10';
-- ALTER TABLE TblEmpresa ADD COLUMN dataRazaoAnterior date;

desc TblEmpresa;

SELECT 
TblEmpresa.razaoSocial, TblEmpresa.CNPJ, 'nire',
TblEmpresa.nomeFantasia, TblEmpresa.razaoAnterior, dataRazaoAnterior,
TblEmpresa.dataFundacao, TblEmpresa.dataEncerramento, 'inscricao estadual',
TblEmpresa.situacaoCNPJ, dataCNPJ, dataConsultadoCNPJ,
TblEmpresa.situacaoSINTEGRA, dataSINTEGRA, dataConsultadoSINTEGRA FROM TblEmpresa;


-- BUSCANDO NIRE
SELECT CONCAT(TblMunicipio.UF, ' - ', TblNire.numNIRE) AS NIRE
FROM TblNIRE INNER JOIN TblEmpresa ON TblNIRE.TblEmpresaTblNireCNPJ = TblEmpresa.CNPJ
INNER JOIN TblMunicipio ON TblNire.TblMunicipioTblNireCodigo = TblMunicipio.codigo ;

-- BUSCANDO INSC. ESTADUAL
SELECT CONCAT(TblMunicipio.UF, ' - ', TblInscricaoEstadual.numInscricao) AS 'INSCRIÇÃO ESTADUAL' 
FROM TblInscricaoEstadual INNER JOIN TblEmpresa ON TblInscricaoEstadual.TblEmpresaTblInscricaoEstadualCNPJ = TblEmpresa.CNPJ 
INNER JOIN TblMunicipio ON TblMunicipio.codigo = TblInscricaoEstadual.TblInscricaoEstadualTblMunicipioCodigo;


-- NATUREZA JURIDICA
SELECT UPPER(TBLNaturezaJuridica.descricao) AS 'NATUREZA JURÍDICA'
FROM TblEmpresa INNER JOIN TBLNaturezaJuridica ON TblEmpresa.TblNaturezaJuridicaTblNaturezaJuridicaID = TBLNaturezaJuridica.IDNaturezaJuridica;


-- FILIAIS
SELECT COUNT(TblFilial.TblEmpresaTblFilialCNPJ) AS 'FILIAIS'
FROM TblEmpresa INNER JOIN TblFilial ON TblEmpresa.CNPJ = TblFilial.TblEmpresaTblFilialCNPJ
group by TblEmpresa.CNPJ; 


-- RAMO DE ATIVIDADE PRIMÁRIO - CNAE
SELECT CONCAT(descricao, ' - ', IDCNAE) AS 'RAMO DE ATIVIDADE PRIMÁRIO - CNAE'
FROM TblEmpresa INNER JOIN TblCNAEEmpresa ON TblEmpresa.CNPJ = TblCNAEEmpresa.TblEmpresaTblCNAEEmpresaCNPJ
INNER JOIN TblCNAE ON TblCNAE.IDCNAE = TblCNAEEmpresa.TblCNAETblCNAEEmpresaIDCNAE
WHERE TblCNAEEmpresa.primario = 1;


-- RAMO DE ATIVIDADE SECUNDÁRIO - CNAE
SELECT GROUP_CONCAT(descricao, ' - ', IDCNAE, '   ') AS 'RAMO DE ATIVIDADE SECUNDÁRIO - CNAE'
FROM TblEmpresa INNER JOIN TblCNAEEmpresa ON TblEmpresa.CNPJ = TblCNAEEmpresa.TblEmpresaTblCNAEEmpresaCNPJ
INNER JOIN TblCNAE ON TblCNAE.IDCNAE = TblCNAEEmpresa.TblCNAETblCNAEEmpresaIDCNAE
WHERE TblCNAEEmpresa.primario = 0;


-- CIDADES
SELECT GROUP_CONCAT(TblMunicipio.nome, '/', TblMunicipio.UF) AS 'CIDADES'
FROM TblEmpresa INNER JOIN TblFilial ON TblEmpresa.CNPJ = TblFilial.TblEmpresaTblFilialCNPJ
INNER JOIN TblLocalizacao ON TblFilial.TblLocalizacaoTblFilialIDLocalizacao = TblLocalizacao.IDLocalizacao
INNER JOIN TblMunicipio ON TblMunicipio.codigo = TblLocalizacao.TblMunicipioTblLocalizacaoCodigo;



CREATE FUNCTION funNIRE(CONS_CNPJ CHAR(18)) RETURNS CHAR(20)
	RETURN (SELECT CONCAT(TblMunicipio.UF, ' - ', TblNire.numNIRE) AS NIRE 
				FROM TblNIRE INNER JOIN TblEmpresa ON TblNIRE.TblEmpresaTblNireCNPJ = TblEmpresa.CNPJ 
				INNER JOIN TblMunicipio ON TblNire.TblMunicipioTblNireCodigo = TblMunicipio.codigo 
				WHERE TblEmpresa.CNPJ = CONS_CNPJ
			);


CREATE FUNCTION funInscEstadual(CONS_CNPJ CHAR(18)) RETURNS CHAR(20)
	RETURN (SELECT CONCAT(TblMunicipio.UF, ' - ', TblInscricaoEstadual.numInscricao)
				FROM TblInscricaoEstadual INNER JOIN TblEmpresa ON TblInscricaoEstadual.TblEmpresaTblInscricaoEstadualCNPJ = TblEmpresa.CNPJ 
				INNER JOIN TblMunicipio ON TblMunicipio.codigo = TblInscricaoEstadual.TblInscricaoEstadualTblMunicipioCodigo
				WHERE TblEmpresa.CNPJ = CONS_CNPJ
        );


CREATE FUNCTION funNaturezaJuridica(CONS_CNPJ CHAR(18)) RETURNS CHAR(45)
	RETURN (SELECT UPPER(TBLNaturezaJuridica.descricao)
				FROM TblEmpresa INNER JOIN TBLNaturezaJuridica ON TblEmpresa.TblNaturezaJuridicaTblNaturezaJuridicaID = TBLNaturezaJuridica.IDNaturezaJuridica
				WHERE TblEmpresa.CNPJ = CONS_CNPJ
			);


CREATE FUNCTION funFiliais(CONS_CNPJ CHAR(18)) RETURNS INT
	RETURN (SELECT COUNT(TblFilial.TblEmpresaTblFilialCNPJ)
				FROM TblEmpresa INNER JOIN TblFilial ON TblEmpresa.CNPJ = TblFilial.TblEmpresaTblFilialCNPJ
				WHERE TblEmpresa.CNPJ = CONS_CNPJ
            );
            
            
DELIMITER //
CREATE FUNCTION funRamoAtividade(CONS_CNPJ CHAR(18), primario tinyint) RETURNS VARCHAR(8000)
	BEGIN
		DECLARE RESULTADO VARCHAR(8000);
		
		IF(primario = 1) THEN
				SET RESULTADO = (SELECT CONCAT(descricao, ' - ', IDCNAE)
				FROM TblEmpresa INNER JOIN TblCNAEEmpresa ON TblEmpresa.CNPJ = TblCNAEEmpresa.TblEmpresaTblCNAEEmpresaCNPJ
				INNER JOIN TblCNAE ON TblCNAE.IDCNAE = TblCNAEEmpresa.TblCNAETblCNAEEmpresaIDCNAE
				WHERE TblCNAEEmpresa.primario = 1 AND TblEmpresa.CNPJ = CONS_CNPJ);
		ELSE
				SET RESULTADO = (SELECT GROUP_CONCAT(descricao, ' - ', IDCNAE)
				FROM TblEmpresa INNER JOIN TblCNAEEmpresa ON TblEmpresa.CNPJ = TblCNAEEmpresa.TblEmpresaTblCNAEEmpresaCNPJ
				INNER JOIN TblCNAE ON TblCNAE.IDCNAE = TblCNAEEmpresa.TblCNAETblCNAEEmpresaIDCNAE
				WHERE TblCNAEEmpresa.primario = 0 AND TblEmpresa.CNPJ = CONS_CNPJ);
		END IF;
        
        RETURN RESULTADO;
	END//
    DELIMITER ;
    

CREATE FUNCTION funCidades(CONS_CNPJ CHAR(18)) RETURNS VARCHAR(8000)
	RETURN (SELECT GROUP_CONCAT(TblMunicipio.nome, '/', TblMunicipio.UF)
				FROM TblEmpresa INNER JOIN TblFilial ON TblEmpresa.CNPJ = TblFilial.TblEmpresaTblFilialCNPJ
				INNER JOIN TblLocalizacao ON TblFilial.TblLocalizacaoTblFilialIDLocalizacao = TblLocalizacao.IDLocalizacao
				INNER JOIN TblMunicipio ON TblMunicipio.codigo = TblLocalizacao.TblMunicipioTblLocalizacaoCodigo
				WHERE TblEmpresa.CNPJ = CONS_CNPJ
            );
            


DROP PROCEDURE IDENTIFICACAO;
DELIMITER //
	CREATE PROCEDURE IDENTIFICACAO (IN CONS_CNPJ CHAR(18))
	BEGIN
		SELECT 
		TblEmpresa.razaoSocial,	TblEmpresa.CNPJ, funNIRE(CONS_CNPJ) AS NIRE ,
		TblEmpresa.nomeFantasia, TblEmpresa.razaoAnterior, dataRazaoAnterior,
		TblEmpresa.dataFundacao, TblEmpresa.dataEncerramento, funInscEstadual(CONS_CNPJ) AS 'INSCRIÇÃO ESTADUAL',
		TblEmpresa.situacaoCNPJ, dataCNPJ, dataConsultadoCNPJ,
		TblEmpresa.situacaoSINTEGRA, dataSINTEGRA, dataConsultadoSINTEGRA,
		funNaturezaJuridica(CONS_CNPJ) AS 'NATUREZA JURÍDICA', funFiliais(CONS_CNPJ) AS 'FILIAIS',
		funRamoAtividade(CONS_CNPJ, 1) AS 'RAMO DE ATIVIDADE PRIMÁRIO - CNAE', funRamoAtividade(CONS_CNPJ, 0) AS 'RAMO DE ATIVIDADE SECUNDÁRIO - CNAE',
		funCidades(CONS_CNPJ) AS 'CIDADES'  FROM TblEmpresa where TblEmpresa.CNPJ = CONS_CNPJ;
	END //
DELIMITER ;

CALL IDENTIFICACAO('111111111111111'); -- 111111111111111 222222222222222 333333333333333 444444444444444 555555555555555


DROP PROCEDURE LOCALIZACAO;
DELIMITER //
CREATE PROCEDURE LOCALIZACAO(IN CONS_CNPJ CHAR(18))
	BEGIN
		(SELECT CONCAT(TblLocalizacao.endereco, ', ', TblLocalizacao.numero, ', ', TblLocalizacao.complemento) AS 'ENDERECO DA MATRIZ', TblLocalizacao.bairro AS 'BAIRRO DA MATRIZ', CONCAT(TblMunicipio.nome, ' - ', TblMunicipio.UF)AS 'CIDADE - UF', TblLocalizacao.CEP AS CEP, CONCAT('(', TblTelefone.DDD, ')', TblTelefone.numero) AS TELEFONE FROM TblEmpresa 
		INNER JOIN TblLocalizacao ON TblEmpresa.TblLocalizacaoTblEmpresaIDLocalizacao = TblLocalizacao.IDLocalizacao
		INNER JOIN TblMunicipio ON TblLocalizacao.TblMunicipioTblLocalizacaoCodigo = TblMunicipio.codigo
		INNER JOIN TblTelefoneEmpresa ON TblEmpresa.CNPJ = TblTelefoneEmpresa.TblEmpresaTblTelefoneEmpresaCNPJ
		INNER JOIN TblTelefone ON (TblTelefoneEmpresa.TblTelefoneTblTelefoneEmpresaDDD = TblTelefone.DDD AND TblTelefoneEmpresa.TblTelefoneTblTelefoneEmpresaNumero = TblTelefone.numero)
		WHERE TblEmpresa.CNPJ = CONS_CNPJ);
	END //	
DELIMITER ;

CALL LOCALIZACAO('222222222222222'); -- 111111111111111 222222222222222 333333333333333 444444444444444 555555555555555




