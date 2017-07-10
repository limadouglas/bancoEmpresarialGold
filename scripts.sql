-- AULA 05: Criação do banco de dados.
CREATE DATABASE dbBiblioteca;

SHOW DATABASES;

USE dbBiblioteca;

SELECT DATABASE();						-- mostra o banco sendo utilizado no momento.

DROP DATABASE IF EXISTS dbBiblioteca;	-- excluindo o banco.

SHOW TABLES;							-- mostra as tabelas dentro do banco selecionado.

DROP DATABASE db_Biblioteca;			-- Excluir banco de dados.



-- AULA 06: Constraints.

NOT NULL																-- NOT NULL não permite que valores nulos sejam salvo.
UNIQUE 																	-- UNIQUE não permite valores iguais serem gravados ex: email, cpf...
CONSTRAINT pk_ID_nomepk PRIMARY KEY (id_colunatabelapk); 				-- PRIMARY KEY identificador da tabela.
CONSTRAINT fk_ID_nomedaforeignkey FOREIGN KEY (id_colunatabelaatualfk);	-- FOREIGN KEY identificador extrangeiro da tabela (conecta tabelas).
REFERENCES tbl_nomedatabeladereferencia (id_nomecolunadoid);
DEFAULT																	-- DEFAULT quando algo é inserido ele vem com valor padrão se outro valor não for definido.



-- AULA 07: Criação de tabelas.

CREATE TABLE IF NOT EXISTS TblLivro (	-- Criação de tabela simples.
	IDLivro smallint AUTO_INCREMENT PRIMARY KEY,
    NomeLivro varchar(50) NOT NULL,
    ISBN varchar(30) NOT NULL,
    IDAutor smallint NOT NULL,
    DataPub DATE NOT NULL,
    PrecoLivro decimal NOT NULL
);

CREATE TABLE IF NOT EXISTS TblAutor (
	IDAutor smallint PRIMARY KEY,
    NomeAutor varchar (50),
    SobrenomeAutor varchar(60)
);

CREATE TABLE IF NOT EXISTS TblEditora (
	IDEditora smallint PRIMARY KEY AUTO_INCREMENT,
    NomeEditora varchar(50) NOT NULL
);
drop table TblEditoras;

CREATE TABLE IF NOT EXISTS Compra (		-- Exemplo de criação de tabela com chave estrangeira.
	IDCompra smallint PRIMARY KEY,
    CodigoProduto varchar(50),
    DataCompra DATE,
    FOREIGN KEY (CodigoProduto) REFERENCES Produto(CodProduto)
);

DROP TABLE nometabela; 					-- Excluir tabela.



-- Aula 08: AUTO_INCREMENT
DROP TABLE TblTesteIncremento;
CREATE TABLE IF NOT EXISTS TblTesteIncremento (	
	Codigo smallint PRIMARY KEY AUTO_INCREMENT,
    Nome varchar(20) NOT NULL
)AUTO_INCREMENT = 15;								-- AUTO_INCREMENT INICIA EM 15.

INSERT INTO TblTesteIncremento (Nome) VALUES ('Ana');	-- Inserindo valores para teste.
INSERT INTO TblTesteIncremento (Nome) VALUES ('Maria');
INSERT INTO TblTesteIncremento (Nome) VALUES ('Joao');
INSERT INTO TblTesteIncremento (Nome) VALUES ('Bianca');
INSERT INTO TblTesteIncremento (Codigo, Nome) VALUES (100 ,'Joao');
INSERT INTO TblTesteIncremento (Codigo, Nome) VALUES (14 ,'Marta');	-- Sobreponto AUTO_INCREMENT.
-- Obs: após forçar um valor maior para a coluna com AUTO_INCREMENT os proximos valores serão gerador apartir dele.
-- Obs: ex, se um coluna com AUTO_INCREMENT estiver em 15 e eu forçar um insert com o valor 100 o proximo valor gerado no AUTO_INCREMENT vai ser 101, 102, 103...
-- Obs: pode haver apenas um ALTER_TABLE por tabela e ele deve estar junto a uma PRIMARY KEY. Não é possivel ter duas colunas com a CONSTRAINT PRIMARY KEY.
SELECT * FROM TblTesteIncremento;

SELECT MAX(Codigo) FROM TblTesteIncremento;				-- mostrar o ultimo id inserido (MAX() retorna o maior valor), como é AUTO_INCREMENT o maior valor sempre sera o ultimo inserido logo saberemos qual o valor do AUTO_INCREMENT.

ALTER TABLE TblTesteIncremento AUTO_INCREMENT = 150; 	-- alterando valor do AUTO_INCREMENT.



-- AULA 10: ALTER TABLE.

ALTER TABLE TblLivro ADD IDAutor smallint NOT NULL;						-- inserindo nova coluna na Tabela TblLivro.(este campo já existia, só coloquei de exemplo)

ALTER TABLE TblLivro ADD CONSTRAINT fk_IDAutor FOREIGN KEY (IDAutor)	-- inserindo 
	REFERENCES TblAutor (IDAutor);
    
-- outro exemplo igual ao acima apenas para teste.
ALTER TABLE TblLivro ADD IDEditora smallint;

ALTER TABLE TblLivro ADD CONSTRAINT fk_IDEditora FOREIGN KEY (IDEditora)
	REFERENCES TblEditora(IDEditora);

ALTER TABLE TblLivro MODIFY COLUMN NomeLivro varchar(60);				-- altera tipo de uma coluna

DESC TblLivro;															-- mostra informações sobre as colunas, ex tipo, CONSTRAINT e etc.
    
CREATE TABLE IF NOT EXISTS TblCliente (
	nome varchar(30)
);
DROP TABLE TblCliente;

ALTER TABLE TblCliente ADD IDCLIENTE smallint not null;					-- adicionando coluna IDCliente a tabela tblCliente.

ALTER TABLE TblCliente ADD PRIMARY KEY (IDCLIENTE);						-- transformando IDCliente em PRIMARY KEY.
								
ALTER TABLE TblCliente ADD IDCLIENTE smallint PRIMARY KEY NOT NULL; 	-- Poderia ser feito assim tambem, criando IDCliente e já adicionando PRIMARY KEY.

describe TblCliente;



-- AULA 11: INSERT INTO
ALTER TABLE TblAutor CHANGE NomeAutor Nome varchar(50);								-- alterando nome da coluna NomeAutor para Nome.
ALTER TABLE TblAutor CHANGE SobrenomeAutor Sobrenome varchar(50);

RENAME TABLE nome_tabela TO novo_nome_tabela;										-- renomeando tabela.

-- Cadastrando Autores.
INSERT INTO TblAutor (IDAutor, Nome, Sobrenome) VALUES (1, 'Daniel', 'Barret');		-- inserindo valores na tabela TblAutor.
INSERT INTO TblAutor (IDAutor, Nome, Sobrenome) VALUES (2, 'Gerald', 'Carter');
INSERT INTO tblAutor (IDAutor, Nome, Sobrenome) VALUES (3, 'Mark', 'Sobell');
INSERT INTO TblAutor (IDAutor, Nome, Sobrenome) VALUES (4, 'William', 'Stanek');
INSERT INTO TblAutor (IDAutor, Nome, Sobrenome) VALUES (5, 'Richard', 'Blum');	


SELECT * FROM TblAutor;
desc TblAutor;
show tables;

-- Cadastrando Editoras.
ALTER TABLE TblEditora CHANGE NomeEditora Nome varchar(50);
INSERT INTO TblEditora (Nome) VALUES ('Prentice Hall');
INSERT INTO TblEditora (Nome) VALUES ('O´REILLY');
INSERT INTO TblEditora (Nome) VALUES ('Microsoft Press');
INSERT INTO TblEditora        VALUES (4, 'Willey');			-- pode ser direto, sem especificar a coluna. Porém é necessario preencher todos os campos na sequencia de criação da tabela.
SELECT * FROM TblEditora;
desc TblEditora;

-- Cadastrando Livros.
DESC TblLivro;
SELECT * FROM TblLivro;
ALTER TABLE TblLivro CHANGE NomeLivro Nome varchar(60);
ALTER TABLE TblLivro CHANGE PrecoLivro Preco decimal(10,2);

INSERT INTO TblLivro (Nome, ISBN, DataPub, Preco, IDAutor, IDEditora) 
	VALUES ('Linux Command Line and Shell Scripting', 143856969, '20091221', 68.35, 5, 4);
    
INSERT INTO TblLivro (Nome, ISBN, DataPub, Preco, IDAutor, IDEditora) 
	VALUES ('SSH, them Secure Shell', 127658789, '20091221', 58.30, 1, 2);
    
INSERT INTO TblLivro (Nome, ISBN, DataPub, Preco, IDAutor, IDEditora) 
	VALUES ('Using Samba', 123856789 , '2001221', 61.45, 2, 2);
    
    
    
-- AULA 13: Consulta com Ordenação.
SELECT * FROM TblLivro ORDER BY Nome ASC;	-- ordem do menor para o maior.

SELECT * FROM TblLivro ORDER BY Nome DESC; 	-- ordem do maior para o menor.
use dbbiblioteca;
SELECT Nome, IDEditora 
FROM TblLivro 		
ORDER BY IDEditora asc;

SELECT Nome, Preco 
FROM TblLivro
ORDER BY Preco DESC;



-- AULA 14: consulta com WHERE
desc tbllivro;
SELECT Nome, DataPub 
FROM TblLivro
WHERE IDAutor = 1;

SELECT IDAutor, nome 
FROM TblAutor
WHERE sobrenome = 'stanek';



-- AULA 15: Consulta com AND, OR e NOT
SELECT * 
FROM TblLivro 
WHERE IDLivro > 2 AND IDAutor < 3;

SELECT * FROM TblLivro
WHERE IDLivro > 2 OR IDAutor < 3;

SELECT *
FROM TblLivro
WHERE IDLivro > 2 AND NOT IDAutor < 3;

SELECT * FROM TblLivro;



-- AULA 16: DELETE, TRUNCATE TABLE
CREATE TABLE TblTesteIncremento (					-- Tabela criada para teste.
	Codigo smallint AUTO_INCREMENT PRIMARY KEY,
    Nome varchar(50)
);



INSERT INTO TblTesteIncremento (Nome) VALUES ("douglas");
INSERT INTO TblTesteIncremento (Nome) VALUES ("bruno");
INSERT INTO TblTesteIncremento (Nome) VALUES ("kevin");
INSERT INTO TblTesteIncremento (Nome) VALUES ("gg");


SELECT * FROM TblTesteIncremento;
DELETE FROM TblTesteIncremento WHERE Codigo <= 2;	-- Apaga apenas os registros determinado pela cláusula WHERE.
TRUNCATE TABLE TblTesteIncremento;					-- Apaga todos os registros da tabela.

delete from tabela where id =2;
truncate table tabela;

-- AULA 17: ALIAS COM AS
SELECT Nome AS N, PRECO AS P						-- Criando um apelido para coluna, isto facilita em SELECT muito extenso.
FROM tbllivro;



-- AULA 18: Funções de Agregação - SUM, COUNT, MAX, MIX, AVG.

SELECT COUNT(*) AS TotalAutores FROM TblLivro;						-- total registros da tabela TblLivro.
SELECT COUNT(DISTINCT IDAutor) AS AutoresDistintos FROM TblLivro;	-- total de autores distintos TblLivro.
SELECT MAX(Preco) AS MaiorPreço FROM TblLivro;						-- Maior Preco.
SELECT MIN(Preco) AS MenorPreco FROM TblLivro;						-- Menor Preco.
SELECT AVG(Preco) AS MediaPreco FROM TblLivro;						-- Media Preco
SELECT SUM(Preco) AS SomatoriaPreco FROM TblLivro;					-- Somatoria Preco.



-- AULA 19: Renomeando Tabelas.
-- Criando tabela para teste.
CREATE TABLE IF NOT EXISTS Clientes(
	Codigo smallint AUTO_INCREMENT,
    Nome varchar(30),
    CONSTRAINT pk_codigo PRIMARY KEY (Codigo)
)AUTO_INCREMENT = 0;



INSERT INTO Clientes(Nome) VALUES('eu01');
INSERT INTO Clientes(Nome) VALUES('eu02');
INSERT INTO Clientes(Nome) VALUES('eu03');

SELECT * FROM Clientes;

RENAME TABLE Clientes TO Cliente;			-- renomeando tabela Clientes => Cliente.

SELECT * FROM Cliente;						-- os registros permanecem intactos após a alterção do nome da tabela.



-- AULA 20: UPDATE
-- UPDATE utilizado para atualizar valor de determinados registros.
UPDATE TblLivro								-- alterando valor do registro com idLivro=2.
SET Nome = 'SSH, o Shell Seguro'
WHERE IDLivro = 2;

-- UPDATE nomeTabela
-- SET Coluna = valor
-- where condicao;

SELECT * FROM TblLivro;



-- AULA 21: BETWEEN

-- O BETWEEN é utilizado na clausula WHERE para definir intervalos.
SELECT * FROM TblLivro;

SELECT Nome AS Nome_Livro FROM TblLivro			-- Mostrando livros com preço entre 50 e 62.
WHERE Preco BETWEEN 50.0 AND 62.0; 

SELECT Nome AS Nome_Livro FROM TblLivro			-- Mostrando livros com datas entre 2000 e 2010.
WHERE DataPub BETWEEN 20000101 AND 20100101;



-- AULA 22: LIKE, NOTLIKE, %, _

-- LIKE é utilizado para verificar caracteres, ex quais palavras tem determinado caracter.

SELECT * FROM TblLivro							-- Livros que tem Nome iniciado
WHERE Nome LIKE 'S%';

SELECT * FROM TblLivro							-- Livros que não iniciam com a letra S.
WHERE Nome NOT LIKE 'S%';

SELECT * FROM TblLivro							-- Livros que tem com segundo caracter a letra i. 
WHERE Nome LIKE '_i%';							-- _ significa caracter anonimo sem importancia, ou seja qualquer caracter unico.
												-- % significa sequencia de qualquer caracter. 


-- AULA 23: REGEXP, Expressoes Regulares.

-- REGEXP é utilizado para filtrar colunas do tipo texto atráves de gramatica.
SELECT * FROM TblLivro							-- Nomes que tenham as letras a ou b
WHERE Nome REGEXP '[ab]';

-- ^[ab] fora dos conchetes = inicia com valores dentro do conchetes.
-- [^ab] dentro do conchetes = negação dos caracteres dentro do conchetes.

SELECT * FROM TblLivro							-- Nomes que iniciam com S ou U.
WHERE Nome REGEXP '^[su]';						-- minusculo ou maiusculo não importa.

SELECT * FROM TblLivro							-- Nomes que não iniciam com S ou U.
WHERE Nome REGEXP '^[^su]';


-- [ol]$ = palavras que terminam com os caracteres dentro dos conchetes. 
SELECT * FROM TblLivro							-- palavras que terminam com O ou L.
WHERE Nome REGEXP '[ol]$';

SELECT * FROM TblLivro							-- palavras que iniciam com U, A ou a sequência li.
WHERE Nome REGEXP '^[ua]|li';

SELECT * FROM TblLivro;



-- AULA 24: DEFAULT.
-- DEFAULT =  define valores padrões para as colunas especificadas de determinada tabela.

SELECT * FROM TblAutor;
DESC TblAutor;

ALTER TABLE TblAutor									-- definindo valor padrão para sobrenome.
MODIFY COLUMN Sobrenome varchar(50) DEFAULT 'LIMA';

INSERT INTO TblAutor(IDAutor, Nome) VALUES (6, 'eu');	-- inserindo valor para teste.

ALTER TABLE TblAutor									-- removendo valor padrão da coluna Sobrenome.
MODIFY COLUMN Sobrenome varchar(50);

INSERT INTO TblAutor (IDAutor, Nome) VALUES (7, 'eu2');



-- AULA 26  : GROUP BY.
-- GROUP BY : é utilizado para agrupar valores de uma coluna determinada.

SELECT * FROM TblLivro;

SELECT IDAutor, SUM(Preco) AS Total FROM TblLivro		-- preco total de livros de cada autor.
GROUP BY IDAutor;

SELECT IDEditora, SUM(Preco) AS Total FROM TblLivro		-- preco total por editora.
GROUP BY IDEditora;



-- AULA 27: HAVING

-- HAVING = é uma parecido com a cláusula WHERE, porém ela é sempre utilizada em conjunto com o GROUP BY, já que seu objetivo é filtrar os resultado do GROUP BY.
CREATE TABLE IF NOT EXISTS Venda(							-- tabela para treinamento.
	ID smallint PRIMARY KEY,
    Nome varchar(20),
    Quantidade int,
    Produto varchar(20),
    Cidade varchar(20)
);

INSERT INTO Venda (ID, Nome, Quantidade, Produto, Cidade)	-- inserindo valores para teste. 	
VALUES	(10,'Jorge',1400,'Mouse','São Paulo'      ),
		(12,'Tatiana',1220,'Teclado','São Paulo'  ),
		(14,'Ana',1700,'Teclado','Rio de Janeiro' ),
		(15,'Rita',2120,'Webcam','Recife'         ),
		(18,'Marcos',980,'Mouse','São Paulo'      ),
		(19,'Carla',1120,'Webcam','Recife'        ),
		(22,'Roberto',3145,'Mouse','São Paulo'    );
        
SELECT Cidade, SUM(Quantidade) FROM Venda											-- agrupando cidades e mostrando as que possuem quantidade maior que 1500.								
GROUP BY Cidade
Having SUM(Quantidade) > 1500;

SELECT Cidade, SUM(Quantidade) AS TotalTeclado FROM Venda							-- total de vendas do produto teclado das cidades cujo a quantidade de itens vendidos é menor que 1500.
WHERE Produto = 'Teclado'
GROUP BY Cidade
HAVING SUM(Quantidade) < 1500;



-- AULA 28: VIEW 

-- VIEW é uma tabela virtual, utilizada em conjunto com o select ela é um forma de deixar uma consulta sempre pronta e assim podendo ser utilizada em outros selects.

CREATE VIEW LivroAutor AS															-- Cria VIEW
SELECT TblAutor.Nome AS Autor, TblLivro.Nome AS Livro, TblLivro.Preco AS Preco
FROM TblAutor INNER JOIN TblLivro 
ON TblAutor.IDAutor = TblLivro.IdAutor;  

ALTER VIEW LivroAutor AS															-- Altera a VIEW, unica diferença é a palavra ALTER invés de CREATE, é necessário informar todo o SELECT novamente.
SELECT TblAutor.Nome AS Autor, TblLivro.Nome AS Livro								-- Com a alteração a VIEW não retorna mais o Preço.
FROM TblAutor INNER JOIN TblLivro 
ON TblAutor.IDAutor = TblLivro.IdAutor;  

SELECT * FROM LivroAutor ORDER BY Autor ASC;										-- Usando VIEW.alter

DROP VIEW LivroAutor;																-- Excluindo VIEW.



-- AULA 29: INNER JOIN.
-- INNER JOIN = Juntar duas ou mais tabelas atráves de suas chaves primárias, é utilizado em SELECT.

SELECT L.Nome, E.Nome, A.Nome														-- INNER JOIN entre as tabelas Autor, Livro e Editora.
FROM TblLivro AS L INNER JOIN TblEditora AS E 
				   ON L.IDEditora = E.IDEditora 
                   INNER JOIN TblAutor AS A ON L.IDAutor = A.IDAutor; 
                   
                   
                   
-- AULA 30: LEFT JOIN E RIGHT JOIN.

-- LEFT JOIN  = Traz todos os dados da tabela a esquerda e a interseção com a tabela da direita.
-- RIGHT JOIN = Traz todos os dados da tabela a direita e a interseção com a tabela da esquerda.

-- ex: LEFT JOIN.
SELECT * 							
FROM tbllivro AS l 						-- tabela a esquerda.
LEFT JOIN TblAutor AS a 				-- tabela a direita.
ON l.IDLivro = a.IDAutor;				-- condição do SELECT.

-- ex: RIGHT JOIN, contrário ao LEFT JOIN
SELECT * 
FROM TblLivro AS l 
RIGHT JOIN TblAutor AS a 
ON l.IDLivro = a.IDAutor;

-- ex: buscando apenas valores que não fazem interseção com a tabela a esquerda.
SELECT *
FROM TblLivro AS l
RIGHT JOIN TblAutor AS a
ON l.IDLivro = a.IDAutor
WHERE l.IDLivro IS NULL;			-- verifica se os valores da tabela a esquerda são nulos, assim todos os valores que não participam da interseção são mostrados.

-- FULL JOIN Traz todos os valores das duas tabelas sem repetir, o mysql não tem o FULL JOIN então é necessário fazer uma UNION entre um LEFT JOIN e um RIGHT JOIN.
-- junta todos os registros de ambas as tabelas.
SELECT *
FROM TblLivro AS l
LEFT JOIN TblAutor AS a
ON l.IDLivro = a.IDAutor
UNION							-- Faz a união(UNION) de dois SELECTS.
SELECT * 
FROM TblLivro AS l 
RIGHT JOIN TblAutor AS a
ON l.IDLivro = a.IDAutor;



-- AULA 31: CONCAT, IFNULL, COALESCE
-- CONCAT   = Contatenar String, ex: CONCAT("lar" + "doce lar" = "lar doce lar".
-- IFNULL   = Verifica se um registro é null e substitui o seu valor, ex: IFNULL(coluna, '10'), trocando o valor nulo da culuna por 10, ele não altera o banco o valor 10 será utilizando apenas para mostrar no SELECT.
-- COALESCE = Retorna o primeiro valor diferente de nulo a ser encontrado, ex: COALESCE(null, coluna1, coluna3, coluna10), assim que o registro de alguma coluna for diferente de null ele será retornado e as verificações serão interrompidas.

-- criando tabela para teste.
CREATE TABLE IF NOT EXISTS TblConcat(
 id smallint PRIMARY KEY AUTO_INCREMENT,
 nome varchar(50),
 sobrenome varchar(50),
 idade smallint
);

-- inserindo valores para teste.
INSERT INTO TblConcat (nome, sobrenome, idade) VALUES ('Douglas', 'Henrique', 20);
INSERT INTO TblConcat (nome, sobrenome, idade) VALUES ('Vitor', 'Seiji', 19);
INSERT INTO TblConcat (nome, sobrenome, idade) VALUES ('Victor', null, null);
INSERT INTO TblConcat (nome, sobrenome, idade) VALUES ('Eduardo', null, null);
UPDATE TblConcat SET sobrenome = 'Alves' WHERE id = 4;

SELECT CONCAT('Brother ', nome) AS IRMAO		-- concatenando a string Brother com o registro da tabela nome, resultado é 'Brother Victor'.
FROM TblConcat
WHERE id = 3;

SELECT CONCAT('BROTHER ', sobrenome) AS IRMAO	-- quando o valor da coluna é null não é possivel concatenar e o resultado é simplesmente null sem concatenação.
FROM TblConcat
WHERE id = 3;

-- para resolver o problema acima(concatenar valores nulos) pode ser utilizado a função IFNULL ou COALESCE.

SELECT CONCAT('BROTHER ', IFNULL(sobrenome, 'padrao')) AS IRMAO		-- verifica se o valor é null é retorna um outro valor especificado(neste caso retorna 'padrao').
FROM TblConcat
WHERE id = 3;

SELECT CONCAT('BROTHER ', COALESCE(sobrenome, idade, 'padrao')) AS IRMAO	-- COALESCE vai verificando os valores de todas as colunas especificadas e retorna o primeiro que for diferente de null.
FROM TblConcat;



-- AULA 32: Operadores e funções matemáticas.
SELECT PI();				-- retorna o valor de PI.
SELECT POW(2, 3);			-- elevado = 2^3=8.
SELECT CEILING(10.40);		-- arredonda o valor para cima.
SELECT FLOOR(10.60);		-- arredonda o valor para baixo.
SELECT SQRT(81);			-- retorna a raiz quadrada.
SELECT HEX(10);				-- retorna a representação hexadecimal de um valor, 10 = A.
	
    
-- AULA 33: FUNCTION.
-- codigo pré progrado onde é necessário apenas fazer chamadas no mesmo ele retorna valores.
CREATE FUNCTION FNMultiplica(a int, b int)		-- funcão multiplica o valor a pelo b.
RETURNS int										-- especificando o tipo de retorno da função.
RETURN a*b;										-- retornando os valores multiplicados.

SELECT FNMultiplica(10, 2) AS Multiplica;		-- chamando a função.
 
DROP FUNCTION FNMultiplica;						-- excluindo função.



-- AULA 34: PROCEDURE.
-- um procedimento pré programado onde é possivel fazer mudançãs no banco atraves de chamadas do mesmo, ele não retorna valores.

CREATE PROCEDURE nomeAutor(ID smallint)
SELECT CONCAT('O autor se chama ', nome) AS NOME FROM TblAutor 
WHERE IDAutor = ID; 

DROP PROCEDURE nomeAutor;		-- excluindo procedimento.

CALL nomeAutor(1);				-- chamando procedimento note que é utilizado o comando CALL e não SELECT



-- AULA 35: BLOCO BEGIN END, DELIMITER.

-- BEGIN END = um bloco  de código utilizado quando é necessario ter mais de uma operação dentro de um mesmo procedimento.
-- DELIMITER = é um delimitador que especifica quando o servidor pode parar de ler o código especificado, ou seja, ele define quando o instrução realmenente acabou.
	
-- !!!!!!!!! NÃO PODE TER COMENTARIOS DENTRO DO DELIMITADOR SENÃO FODE COM TUDO !!!!!!!!!
DELIMITER $$												
	CREATE PROCEDURE registroAutor(IDA smallint)			
	BEGIN
		SELECT * FROM TblAutor WHERE IDAutor = IDA;
		SELECT 'PROCEDIMENTO EXECUTADO COM SUCESSO' AS msg;
	END $$
DELIMITER ;	
-- o mysql não deixa criar blocos sem o DELIMITER.

CALL registroAutor(2);					-- chamando procedimento.
DROP PROCEDURE registroAutor;			-- excluindo procedimento.



-- AULA 36: IN, OUT, INOUT EM PROCEDURES.

-- IN    =  passagem de valor por paramentro.	 => var   // a variavel de recebimento dentro do procedimento só recebe o valor na passagem de parametro.
-- OUT   =  passagem de enderço por parametro. => &var  // a variavel de recebimento recebe o endereço na passagem de paramentro, porém o valor não é recebido mesmo que a variavel passada já tenha um valor atribuido. 
-- INOUT =  var + &var // funciona tanto para passar os valores quando para ter o seu valor alterado INOUT = IN + OUT, já que pode realizar as operações das duas.

SET @msg = '';				-- criando uma variavel.
							-- por padrão quando nada for definido será utizado 'IN'
							-- ex com IN e OUT.
DELIMITER //
	CREATE PROCEDURE testeAula(IN id smallint, OUT msg varchar(50))
	BEGIN
		SELECT nome into msg FROM TblAutor WHERE TblAutor.IDAutor = id;
	END //
DELIMITER ;

DROP PROCEDURE testeAula;

CALL testeAula(3, @msg);-- chamando o procedimento

SELECT @msg AS NOME;

						-- ex com INOUT, para mostrar que o INOUT pode funcionar de duas formas, ou seja, tanto como entrada como saida de valores.
SET @valor = 2;			-- toda varivel começa com '@'.
DELIMITER // 
	CREATE PROCEDURE tstINOUT(INOUT valor DECIMAL(10, 2))
    BEGIN
		SET valor = valor + pow(valor, 2); 
    END //
DELIMITER ;

CALL tstINOUT(@valor);

SELECT @valor as 'Valor Alterado';	-- para utilizar alias com espaço é necessário aspas simples.



-- AULA 40: LOOP

-- LEAVE <nome_loop> = saia do loop especificado.

DELIMITER //
	CREATE PROCEDURE acumula_loop(limite int)
		BEGIN
			DECLARE soma int DEFAULT 0;
            DECLARE contador int DEFAULT 0;
            IF limite <= 0 THEN
				SELECT 'O VALOR DEVE SER MAIOR QUE ZERO' AS MSG_ERRO;
			ELSE
				tst_cont: LOOP
					SET contador = contador + 1;
					SET soma = contador + soma;
				  
					IF contador >= limite THEN
						LEAVE tst_cont;
					END IF;    
				END LOOP tst_cont;
                SELECT soma AS SOMA;
			END IF;
            
		END//
DELIMITER ; 

DROP PROCEDURE acumula_loop;

CALL acumula_loop(10);

-- UNTIL = 'até' ele tem condição contrária, ou seja, 'contador >= limite' só vai parar quando está condição for satisfeita.

DELIMITER $$
	CREATE PROCEDURE acumula_repeat(limite tinyint UNSIGNED)
		BEGIN
			DECLARE contador int DEFAULT 0;
            DECLARE soma int DEFAULT 0;
            IF(limite = 0) THEN
				SELECT 'O VALOR DEVE SER MAIOR QUE ZERO' AS MSG_ERRO;
            ELSE
				REPEAT
					SET contador = contador + 1;
					SET soma     = contador + soma;
				UNTIL contador >= limite
				END REPEAT;
                SELECT soma AS RESULTADO;
            END IF;
		END$$
DELIMITER ;

DROP PROCEDURE acumula_repeat;

CALL acumula_repeat(10);

DELIMITER //
CREATE PROCEDURE acumula_while(limite tinyint UNSIGNED)
	BEGIN
		DECLARE contador int DEFAULT 0;
        DECLARE soma int DEFAULT 0;
        
        WHILE contador < limite DO
			SET contador = contador + 1;
            SET soma = soma + contador;
        END WHILE;

		SELECT soma AS RESULTADO;
		
    END//
DELIMITER ;

DROP PROCEDURE acumula_while;

CALL acumula_while(10);



-- AULA 43: ITERATE
-- ITERATE = retorna a um ponto especificado, é parecido com o goto. 

DELIMITER //
CREATE PROCEDURE acumula_iterate(limite tinyint UNSIGNED)
BEGIN
	DECLARE contador int DEFAULT 0;
    DECLARE soma int DEFAULT 0;
    
    teste: LOOP
		SET contador = contador + 1;
        SET soma     = soma + contador;
        IF contador < limite THEN
			ITERATE teste;
        END IF;
        
        SELECT soma AS RESULTADO;
        LEAVE teste;
	END LOOP teste;
    
END//
DELIMITER ;

DROP PROCEDURE acumula_iterate;

CALL acumula_iterate(0);



-- AULA 44: TRIGGERS.
-- TRIGGERS = gatilhos que quando configurado pode ser disparado em qualquer operação DML, é utilizado para tratamento dos dados.
 
CREATE TABLE IF NOT EXISTS tstProduto (
	id 			  smallint PRIMARY KEY AUTO_INCREMENT,
    nome 		  varchar(50),
    precoNormal   decimal(10, 2),
    precoDesconto decimal(10, 2)

); 

INSERT INTO tstProduto (nome, precoNormal) VALUES ('MONITOR', 200.00);
INSERT INTO tstProduto (nome, precoNormal) VALUES ('MOUSE', 100.00);


SELECT * FROM tstProduto;
 
CREATE TRIGGER tr_desconto 
BEFORE INSERT 											-- TRIGGER será executado antes de qualquer INSERT
ON tstProduto											-- TRIGGER sera da tabela produto
FOR EACH ROW											-- o TRIGGER será executado em cada liha alterada no INSERT
SET NEW.precoDesconto = (NEW.precoNormal * 0.80);		-- configurando desconto de 20%.
														-- necessario utilizar new pois os valores ainda não existem no banco, já que é um TRIGGER do tipo BEFORE.
                                                        
-- serão alterados apenas os produtos que forem inseridos apos a criação do trigger.
INSERT INTO tstProduto (nome, precoNormal) VALUES ('TECLADO', 20.00);


-- AULA 45: CRIAÇÃO DE USUÁRIO.

CREATE USER eu IDENTIFIED BY '123456'; 				-- cria o usuario 'eu' com a senha '123456', sem especificar host.
CREATE USER eu2@localhost IDENTIFIED BY '123456';	-- criao usuario 'eu2' especificando host, ou seja, onde ele pode se conectar com o banco.
SELECT user FROM mysql.user;						-- mostra todos os usuário.

-- host significa apartir de onde o usuário pode se logar, o simbolo '%' = qualquer lugar. 
SELECT USER, HOST FROM MYSQL.USER;					-- mostra os usuário com host de conexão
























































