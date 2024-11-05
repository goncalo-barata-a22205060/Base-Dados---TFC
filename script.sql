-- Exercicio 1 , Exercicio 2 


-- Criacao de tabelas 
-- load dos ficheiros fizemos export dos exels

CREATE DATABASE projetoBD;

USE projetoBD;


CREATE TABLE Curso (
	id BIGINT(20) NOT NULL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
);

SELECT * FROM projetoBD.Curso c ;


CREATE TABLE TFCCurso(
    id BIGINT(20) NOT NULL PRIMARY KEY,
    idCurso BIGINT(20) NOT NULL,
    idTFC BIGINT(20) NOT NULL
);

SELECT * FROM projetoBD.TFCCurso t  ;


CREATE TABLE Disciplina(
	id BIGINT(20) NOT NULL PRIMARY KEY,
	cursoAssociado BIGINT(20) NOT NULL,
	nome VARCHAR(255) NOT NULL
);

SELECT * FROM projetoBD.Disciplina d  ;


CREATE TABLE TFCDisciplina(
	id BIGINT(20) NOT NULL PRIMARY KEY,
	idNumeroDisciplina BIGINT(20) NOT NULL,
	numeroTFC BIGINT(20) NOT NULL
);

SELECT * FROM projetoBD.TFCDisciplina t2 ;


CREATE TABLE Tecnologia(
	id BIGINT(20) NOT NULL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
);

SELECT * FROM projetoBD.Tecnologia t  ;


CREATE TABLE TFCTecnologia(
    id BIGINT(20) NOT NULL PRIMARY KEY,
    idTFC BIGINT(20) NOT NULL,
    idTecnologia BIGINT(20) NOT NULL
);

SELECT * FROM projetoBD.TFCTecnologia t ;


CREATE TABLE Inscricao (
	id BIGINT(20) NOT NULL PRIMARY KEY,
	estado VARCHAR(255),
	idNumeroGrupo BIGINT(20),
	idTFC VARCHAR(255) NOT NULL,
	numeroAluno VARCHAR(255),
	ordemEscolha INT(11),
	registoDeInscricao DATETIME,
	publicado TINYINT(1),
	anoLetivo VARCHAR(255)
);

SELECT * FROM projetoBD.Inscricao i  ;


CREATE TABLE Grupo (
	id BIGINT(20) NOT NULL PRIMARY KEY,
	confirmaAluno1 TINYINT(1) NOT NULL,
	confirmaAluno2 TINYINT(1),
	idNumeroAluno1 VARCHAR(255) NOT NULL,
	idNumeroAluno2 VARCHAR(255)
);

SELECT * FROM projetoBD.Grupo g  ;


CREATE TABLE Aluno (
    id BIGINT(20) NOT NULL PRIMARY KEY,
    curso VARCHAR (255),
    email VARCHAR(255),
    nome VARCHAR(255) NOT NULL,
    numeroAluno VARCHAR(255) NOT NULL,
    numeroContato INT(11)
);

SELECT * FROM projetoBD.Aluno a ;

CREATE TABLE ProfessorDEISI(
    id BIGINT(20) NOT NULL PRIMARY KEY,
    email VARCHAR(255),
    nome VARCHAR(255) NOT NULL,
    numeroContato INT(11),
    numeroProfessor VARCHAR(255) NOT NULL
);

SELECT * FROM projetoBD.ProfessorDEISI pd  ;


CREATE TABLE ProfessorNDEISI(
    id BIGINT(20) NOT NULL PRIMARY KEY,
    departamentoAfeto VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    idProfessor VARCHAR(255),
    nome VARCHAR(255) NOT NULL,
    numeroContato INT(11) NOT NULL 
);

SELECT * FROM projetoBD.ProfessorNDEISI pn  ;


CREATE TABLE Utilizador(
	id BIGINT(20) NOT NULL PRIMARY KEY,
	coordenador TINYINT(1),
	idIdentificacao VARCHAR(255),
	tipoUtilizador VARCHAR(255)

);

SELECT * FROM projetoBD.Utilizador u  ;	


CREATE TABLE AvaliacaoDisciplina (
    id BIGINT(20) NOT NULL PRIMARY KEY,
    idNumeroAluno BIGINT(20) NOT NULL,
    idNumeroDisciplina BIGINT(20) NOT NULL,
    nota INT(11) NOT NULL
);

SELECT * FROM projetoBD.AvaliacaoDisciplina ad ;


CREATE TABLE Empresa_EntidadeExterna(
    id BIGINT(20) NOT NULL PRIMARY KEY,
    email VARCHAR(255),
    idEmpresa VARCHAR(255),
    interlocutor VARCHAR(255),
    morada VARCHAR(255),
    nome VARCHAR(255) NOT NULL,
    numeroContato INT(11)
);

SELECT * FROM projetoBD.Empresa_EntidadeExterna eee  ;


CREATE TABLE TFC(
	id BIGINT(20) NOT NULL PRIMARY KEY,
	Titulo VARCHAR(255),
	anoLetivo VARCHAR(255),
	avaliacaoProposta VARCHAR(255),
	coorientador VARCHAR(255),
	dataEstado VARCHAR(255),
	dataProposta VARCHAR(255),
	descricao TEXT,
	entidade BIGINT(20),
	estado VARCHAR(255),
	idGrupo BIGINT(20),
	idtfc VARCHAR(255),
	motivoRecusa VARCHAR(255),
	numeroInscricoes INT(11),
	orientador VARCHAR(255),
	orientadorProposto VARCHAR(255),
	preponente VARCHAR(255),
	semestre INT(11),
	tecnologias VARCHAR(255)
);

SELECT * FROM projetoBD.TFC t  ;


CREATE TABLE HistoricoTFC(
	id BIGINT(20) NOT NULL PRIMARY KEY,
	avaliacao VARCHAR(255),
	dataMudancaEstado VARCHAR(255),
	estado VARCHAR(255) NOT NULL,
	idTFC VARCHAR(255) NOT NULL,
	idTFCNumerico BIGINT(20) NOT NULL,
	utilizador VARCHAR(255) NOT NULL
);

SELECT * FROM projetoBD.HistoricoTFC ht  ;


-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- exercicio 3


-- Mudar a coluna de referencia a idTFC

SELECT
    TFCCurso.id AS TFCCurso_id,
    TFCCurso.idTFC AS TFCCurso_idTFC,
    TFC.id AS TFC_id,
    TFC.idTFC AS TFC_idTFC
FROM
    TFCCurso
JOIN
    TFC ON TFCCurso.idTFC = TFC.id;



ALTER TABLE TFCCurso
ADD COLUMN idTFC_Varchar VARCHAR(255);

UPDATE TFCCurso
JOIN TFC ON TFCCurso.idTFC  = TFC.id
SET TFCCurso.idTFC_Varchar = TFC.idTFC;

ALTER TABLE TFCCurso
DROP COLUMN idTFC;

ALTER TABLE TFCCurso
CHANGE COLUMN idTFC_Varchar idTFC VARCHAR(255);


-- Mudar a coluna de referencia a idTFC


SELECT
    TFCDisciplina.id AS TFCDisciplina_id,
    TFCDisciplina.numeroTFC AS TFCDisciplina_idTFC_Antes,
    TFC.id AS TFC_id,
    TFC.idTFC AS TFC_idTFC_Depois
FROM
    TFCDisciplina
JOIN
    TFC ON TFCDisciplina.numeroTFC  = TFC.id;



ALTER TABLE TFCDisciplina
ADD COLUMN idTFC_Varchar VARCHAR(255);

UPDATE TFCDisciplina
JOIN TFC ON TFCDisciplina.numeroTFC  = TFC.id
SET TFCDisciplina.idTFC_Varchar = TFC.idTFC;

ALTER TABLE TFCDisciplina
DROP COLUMN numeroTFC;

ALTER TABLE TFCDisciplina
CHANGE COLUMN idTFC_Varchar numeroTFC VARCHAR(255);


-- Mudar a coluna de referencia a idTFC

SELECT
    TFCTecnologia.id AS TFCTecnologia_id,
    TFCTecnologia.idTFC AS TFCTecnologia_idTFC_Antes,
    TFC.id AS TFC_id,
    TFC.idTFC AS TFC_idTFC_Depois
FROM
    TFCTecnologia
JOIN
    TFC ON TFCTecnologia.idTFC  = TFC.id;



ALTER TABLE TFCTecnologia
ADD COLUMN idTFC_Varchar VARCHAR(255);

UPDATE TFCTecnologia
JOIN TFC ON TFCTecnologia.idTFC  = TFC.id
SET TFCTecnologia.idTFC_Varchar = TFC.idTFC;

ALTER TABLE TFCTecnologia
DROP COLUMN idTFC;

ALTER TABLE TFCTecnologia
CHANGE COLUMN idTFC_Varchar idTFC VARCHAR(255);


-- criação indice

UPDATE Empresa_EntidadeExterna
SET idEmpresa = CONCAT('emp', id);

UPDATE Empresa_EntidadeExterna
SET idEmpresa = CONCAT('emp', id);   



-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

 -- exercicio 4


-- exercicios 4.1. e 4.2. foram feitos diretamente no excel

-- exercicio 4.3.

UPDATE TFC
SET estado = CASE
 WHEN estado NOT IN ('A Aguardar Atribuição', 'A Aguardar Aprovação', 'Atribuido', 'Nao Atribuido', 'Recusado', 'Indisponivel', 'Anulado', 'Publicado') THEN 'Anulado'
    ELSE estado
END
WHERE estado NOT IN ('A Aguardar Atribuição', 'A Aguardar Aprovação', 'Atribuido', 'Nao Atribuido', 'Recusado', 'Indisponivel', 'Anulado', 'Publicado');

UPDATE Inscricao
SET estado = CASE
    WHEN estado NOT IN ('A Aguardar Atribuição', 'A Aguardar Aprovação', 'Atribuido', 'Nao Atribuido', 'Recusado', 'Indisponivel', 'Anulado', 'Publicado') THEN 'Anulado'
    ELSE estado
END
WHERE estado NOT IN ('A Aguardar Atribuição', 'A Aguardar Aprovação', 'Atribuido', 'Nao Atribuido', 'Recusado', 'Indisponivel', 'Anulado', 'Publicado');

UPDATE HistoricoTFC
SET estado = CASE
    WHEN estado NOT IN ('A Aguardar Atribuição', 'A Aguardar Aprovação', 'Atribuido', 'Nao Atribuido', 'Recusado', 'Indisponivel', 'Anulado', 'Publicado') THEN 'Anulado'
    ELSE estado
END
WHERE estado NOT IN ('A Aguardar Atribuição', 'A Aguardar Aprovação', 'Atribuido', 'Nao Atribuido', 'Recusado', 'Indisponivel', 'Anulado', 'Publicado');


-- //////////////////////////////////////////////////////////////////////////////////////////////////

  -- exercicio 5

-- -------------------------------------------------------------------------------------------------
  -- exercicio 5.1
-- ---------------------------------------------------------------------------------------------------
    -- exercicio 5.1.1 : Na tabela de [TFC], não pode haver duplicação de identificadores [idTFC]; 

 	
ALTER TABLE TFC  
ADD COLUMN id_temp INT AUTO_INCREMENT UNIQUE;

SELECT t1.idtfc , t1.id_temp,
       t2.idtfc AS idtfc_duplicado, t2.id_temp AS id_temp_duplicado
FROM TFC t1
JOIN TFC t2 ON t1.idtfc = t2.idtfc AND t1.id_temp > t2.id_temp;


DELETE t1
FROM TFC  t1
JOIN TFC  t2 ON t1.idtfc = t2.idtfc AND t1.id_temp > t2.id_temp;

ALTER TABLE TFC  
DROP COLUMN id_temp;

-- ---------------------------------------------------------------------------------------------------
    -- exercicio 5.1.2 : Não pode haver duplicações de [Aluno].[numeroAluno], [ProfessorDEISI].[numeroProfessor] e [ProfessorNDEISI].[idProfessor]

-- --------------------------------------aluno--------------------------------------
	ALTER TABLE Aluno
ADD COLUMN id_temp INT AUTO_INCREMENT UNIQUE;

SELECT a1.numeroAluno, a1.id_temp,
       a2.numeroAluno AS numeroAluno_duplicado,  a2.id_temp AS id_temp_duplicado
FROM Aluno a1
JOIN Aluno a2 ON a1.numeroAluno = a2.numeroAluno AND a1.id_temp > a2.id_temp;


DELETE a1
FROM Aluno a1
JOIN Aluno a2 ON a1.numeroAluno = a2.numeroAluno AND a1.id_temp > a2.id_temp;

ALTER TABLE Aluno
DROP COLUMN id_temp;

-- --------------------------------------ProfDEISI-----------------------------------

ALTER TABLE ProfessorDEISI 
ADD COLUMN id_temp INT AUTO_INCREMENT UNIQUE;

SELECT p1.numeroProfessor, p1.nome, p1.id_temp,
       p2.numeroProfessor AS numeroProfessor_duplicado, p2.nome AS nome_duplicado, p2.id_temp AS id_temp_duplicado
FROM ProfessorDEISI p1
JOIN ProfessorDEISI p2 ON p1.numeroProfessor = p2.numeroProfessor AND p1.id_temp > p2.id_temp;

DELETE p1
FROM ProfessorDEISI  p1
JOIN ProfessorDEISI  p2 ON p1.numeroProfessor = p2.numeroProfessor AND p1.id_temp > p2.id_temp;

ALTER TABLE ProfessorDEISI 
DROP COLUMN id_temp;

-- --------------------------------------ProfNDEISI--------------------------------------

ALTER TABLE ProfessorNDEISI
ADD COLUMN id_temp INT AUTO_INCREMENT UNIQUE;

SELECT p1.idProfessor, p1.id_temp,
       p2.idProfessor AS numeroProfessor_duplicado, p2.id_temp AS id_temp_duplicado
FROM ProfessorNDEISI p1
JOIN ProfessorNDEISI p2 ON p1.idProfessor = p2.idProfessor AND p1.id_temp > p2.id_temp;


DELETE p1
FROM ProfessorNDEISI  p1
JOIN ProfessorNDEISI  p2 ON p1.idProfessor = p2.idProfessor AND p1.id_temp > p2.id_temp;

ALTER TABLE ProfessorNDEISI 
DROP COLUMN id_temp;


-- -----------------------------------------------------------------------------------------------
    -- exercicio 5.1.3 : Na tabela de [Grupo], o mesmo aluno não pode aparecer em dois grupos

SELECT idTFC, COUNT(*)
FROM TFC
GROUP BY idTFC
HAVING COUNT(*) > 1;

SELECT g1.id AS id_grupo1, g1.idNumeroAluno1 AS aluno1_grupo1, g1.idNumeroAluno2 AS aluno2_grupo1, i1.estado AS estado_inscricao1, i1.anoLetivo  AS anoLetivo1,
       g2.id AS id_grupo2, g2.idNumeroAluno1 AS aluno1_grupo2, g2.idNumeroAluno2 AS aluno2_grupo2, i2.estado AS estado_inscricao2, i2.anoLetivo  AS anoLetivo2
FROM Grupo g1
JOIN Grupo g2 ON g1.id < g2.id
LEFT JOIN Inscricao i1 ON g1.id = i1.idNumeroGrupo
LEFT JOIN Inscricao i2 ON g2.id = i2.idNumeroGrupo
WHERE
  (g1.idNumeroAluno1 = g2.idNumeroAluno1 OR g1.idNumeroAluno1 = g2.idNumeroAluno2 OR g1.idNumeroAluno2 = g2.idNumeroAluno1 OR g1.idNumeroAluno2 = g2.idNumeroAluno2)
  AND (
    (i1.estado = 'Atribuído' AND i2.estado IS NULL)
    OR (i1.estado IS NULL AND i2.estado = 'Atribuído')
    OR (i1.estado = 'Atribuído' AND i1.anoLetivo = i2.anoLetivo)
    OR (i2.estado = 'Atribuído' AND i1.anoLetivo = i2.anoLetivo)
    OR (i2.estado = 'Nao Atribuido' AND i1.estado = 'Nao Atribuido' AND i1.anoLetivo = i2.anoLetivo)
    )
   ORDER BY g1.id; 
  
  
  DELETE g1
FROM Grupo g1
JOIN Grupo g2 ON g1.id < g2.id
LEFT JOIN Inscricao i1 ON g1.id = i1.idNumeroGrupo
LEFT JOIN Inscricao i2 ON g2.id = i2.idNumeroGrupo
WHERE
  (g1.idNumeroAluno1 = g2.idNumeroAluno1 OR g1.idNumeroAluno1 = g2.idNumeroAluno2 OR g1.idNumeroAluno2 = g2.idNumeroAluno1 OR g1.idNumeroAluno2 = g2.idNumeroAluno2)
  AND (
     (i1.estado IS NULL AND i2.estado = 'Atribuído')
    OR (i2.estado = 'Atribuído' AND i1.anoLetivo = i2.anoLetivo)
    );
 
   DELETE g2
FROM Grupo g1
JOIN Grupo g2 ON g1.id < g2.id
LEFT JOIN Inscricao i1 ON g1.id = i1.idNumeroGrupo
LEFT JOIN Inscricao i2 ON g2.id = i2.idNumeroGrupo
WHERE
  (g1.idNumeroAluno1 = g2.idNumeroAluno1 OR g1.idNumeroAluno1 = g2.idNumeroAluno2 OR g1.idNumeroAluno2 = g2.idNumeroAluno1 OR g1.idNumeroAluno2 = g2.idNumeroAluno2)
  AND (
    (i1.estado = 'Atribuído' AND i2.estado IS NULL)
    OR (i1.estado = 'Atribuído' AND i1.anoLetivo = i2.anoLetivo)
    OR (i2.estado = 'Não Atribuído' AND i1.estado = 'Não Atribuido'AND i1.anoLetivo = i2.anoLetivo)                   
  );
 


-- -------------------------------------------------------------------------------------------
  -- exercicio 5.2

 -- --------------------------------------aluno------------------------------

ALTER TABLE Aluno
ADD COLUMN id_temp INT AUTO_INCREMENT UNIQUE;

SELECT a1.numeroAluno, a1.id_temp,
       a2.numeroAluno AS numeroAluno_duplicado,  a2.id_temp AS id_temp_duplicado
FROM Aluno a1
JOIN Aluno a2 ON a1.numeroAluno = a2.numeroAluno AND a1.id_temp > a2.id_temp;


DELETE a1
FROM Aluno a1
JOIN Aluno a2 ON a1.numeroAluno = a2.numeroAluno AND a1.id_temp > a2.id_temp;

ALTER TABLE Aluno
DROP COLUMN id_temp;



------------------------------- ProfDEISI --------------------

ALTER TABLE ProfessorDEISI 
ADD COLUMN id_temp INT AUTO_INCREMENT UNIQUE;

SELECT p1.numeroProfessor, p1.nome, p1.id_temp,
       p2.numeroProfessor AS numeroProfessor_duplicado, p2.nome AS nome_duplicado, p2.id_temp AS id_temp_duplicado
FROM ProfessorDEISI p1
JOIN ProfessorDEISI p2 ON p1.numeroProfessor = p2.numeroProfessor AND p1.id_temp > p2.id_temp;

DELETE p1
FROM ProfessorDEISI  p1
JOIN ProfessorDEISI  p2 ON p1.numeroProfessor = p2.numeroProfessor AND p1.id_temp > p2.id_temp;

ALTER TABLE ProfessorDEISI 
DROP COLUMN id_temp;


-- --------------------------------ProfNDEISI--------------------


ALTER TABLE ProfessorNDEISI
ADD COLUMN id_temp INT AUTO_INCREMENT UNIQUE;

SELECT p1.idProfessor, p1.id_temp,
       p2.idProfessor AS numeroProfessor_duplicado, p2.id_temp AS id_temp_duplicado
FROM ProfessorNDEISI p1
JOIN ProfessorNDEISI p2 ON p1.idProfessor = p2.idProfessor AND p1.id_temp > p2.id_temp;


DELETE p1
FROM ProfessorNDEISI  p1
JOIN ProfessorNDEISI  p2 ON p1.idProfessor = p2.idProfessor AND p1.id_temp > p2.id_temp;

ALTER TABLE ProfessorNDEISI 
DROP COLUMN id_temp;


-- -------------------------------------TFC -------------------

ALTER TABLE TFC  
ADD COLUMN id_temp INT AUTO_INCREMENT UNIQUE;

SELECT t1.idtfc , t1.id_temp,
       t2.idtfc AS idtfc_duplicado, t2.id_temp AS id_temp_duplicado
FROM TFC t1
JOIN TFC t2 ON t1.idtfc = t2.idtfc AND t1.id_temp > t2.id_temp;


DELETE t1
FROM TFC  t1
JOIN TFC  t2 ON t1.idtfc = t2.idtfc AND t1.id_temp > t2.id_temp;

ALTER TABLE TFC  
DROP COLUMN id_temp;


-- ----------------------------------------------------------------------------------------------------------------------------------------
-- exercicio 5.3 : Verificar a coerência nas referências entre tabelas, garantindo que se poderá estabelecer relações sem comprometer integridade referencial: 

-- -------------------------------------------------------------------------------------------------------------------------------------------
  -- exercicio 5.3.1 :Todos os valores de [idTFC] em qualquer tabelas têm que existir em [TFC].[idTFC] 

-- -------------------------TFCCurso-----------------------------------
-- //Apagar linhas com idtfc que nao estao na tabela de TFC

SELECT id , idCurso , idTFC 
FROM TFCCurso  ht
WHERE ht.idTFC  NOT IN (SELECT idtfc FROM TFC t);

DELETE FROM TFCCurso
WHERE idTFC  NOT IN ( SELECT idtfc FROM TFC); 

-- -------------------------TFCDisciplina-----------------------------------

-- //Apagar linhas com idtfc que nao estao na tabela de TFC

SELECT id , idNumeroDisciplina , numeroTFC 
FROM TFCDisciplina t2    
WHERE t2.numeroTFC  NOT IN (SELECT idtfc FROM TFC t);   											

DELETE FROM TFCDisciplina 
WHERE numeroTFC NOT IN ( SELECT idtfc FROM TFC); 

-- -------------------------TFCTecnologia-----------------------------------

-- //Apagar linhas com idtfc que nao estao na tabela de TFC

SELECT id , idTecnologia , idTFC 
FROM TFCTecnologia t2
WHERE t2.idTFC  NOT IN (SELECT idtfc FROM TFC t);

DELETE FROM TFCTecnologia 
WHERE idTFC  NOT IN ( SELECT idtfc FROM TFC); 

-- -------------------------Inscricao-----------------------------------

-- //Apagar linhas com idtfc que nao estao na tabela de TFC

SELECT id , estado , idNumeroGrupo , numeroAluno ,idTFC 
FROM Inscricao i2
WHERE i2.idTFC  NOT IN (SELECT idtfc FROM TFC t);   											

DELETE FROM Inscricao 
WHERE idTFC  NOT IN ( SELECT idtfc FROM TFC); 

-- -------------------------HistoricoTFC-----------------------------------  


-- //Apagar linhas com idtfc que nao estao na tabela de TFC

SELECT id ,avaliacao , dataMudancaEstado , estado , idTFC , utilizador 
FROM HistoricoTFC ht  
WHERE ht.idTFC  NOT IN (SELECT idtfc FROM TFC t);   											

DELETE FROM HistoricoTFC 
WHERE idTFC  NOT IN ( SELECT idtfc FROM TFC);   



-- ----------------------------------------------------------------------------------------------------------------------------------------
  -- exercicio 5.3.2 : Todas as referências a orientadores têm que existir em [ProfessorDEISI].[numeroProfessor] 

SELECT orientador,
	Titulo  , anoLetivo , estado 
FROM TFC t 
WHERE t.orientador IS NOT NULL
	AND t.orientador  NOT IN (SELECT pd.numeroProfessor FROM ProfessorDEISI pd);


DELETE FROM TFC 
	WHERE orientador  NOT IN (SELECT  pd.numeroProfessor FROM ProfessorDEISI pd );  
	


-- // APAGAR TFC com preponente que nao se encontra na base de dados em nehuma das tabelas

SELECT idtfc , Titulo , numeroInscricoes , orientador , estado , anoLetivo , idGrupo ,preponente  
    FROM TFC t 
WHERE    t.preponente NOT IN (SELECT numeroAluno FROM Aluno a) 
          AND t.preponente NOT IN (SELECT numeroProfessor FROM ProfessorDEISI pd)
          AND t.preponente NOT IN (SELECT idProfessor FROM ProfessorNDEISI pn ) 
          AND t.preponente NOT IN (SELECT idEmpresa FROM Empresa_EntidadeExterna eee );
          
DELETE FROM TFC 
WHERE  preponente NOT IN (SELECT numeroAluno FROM Aluno a) 
          AND preponente NOT IN (SELECT numeroProfessor FROM ProfessorDEISI pd)
          AND preponente NOT IN (SELECT idProfessor FROM ProfessorNDEISI pn ) 
          AND preponente NOT IN (SELECT idEmpresa FROM Empresa_EntidadeExterna eee );           
          





-- ----------------------------------------------------------------------------------------------------------------------------------------------------
  -- exercicio 5.3.3 : Todas as referências a alunos têm que existir em [Aluno].[numeroAluno]; o mesmo com identificação de grupo e [Grupo].[id] 

-- ---------------------Inscricao ------------------------------------------

-- //Apagar linhas com NumAlunos que nao estao na tabela de Alunos.

SELECT *        															  
FROM Inscricao
WHERE (numeroAluno IS NULL AND  idNumeroGrupo NOT IN (SELECT id FROM Grupo))
   OR (idNumeroGrupo IS NULL AND numeroAluno NOT IN (SELECT  numeroAluno FROM Aluno));

DELETE FROM Inscricao
	WHERE (numeroAluno IS NULL AND  idNumeroGrupo NOT IN (SELECT id FROM Grupo))			    
    OR (idNumeroGrupo IS NULL AND numeroAluno NOT IN (SELECT  numeroAluno FROM Aluno));



-- //Apagar linhas com idGrupo que nao estao na tabela de Grupos

SELECT id , estado , idNumeroGrupo , numeroAluno ,idTFC 
    FROM Inscricao i3
WHERE    i3.idNumeroGrupo NOT IN (SELECT id FROM Grupo g);               

DELETE FROM Inscricao 
WHERE idNumeroGrupo  NOT IN ( SELECT id FROM Grupo);    

-- ----------------------Grupo-------------------------------------------------
         
-- //Apagar alunos da coluna 1 que nao estao em alunos

SELECT g.idNumeroAluno1 
	 FROM Grupo g
WHERE g.idNumeroAluno1  IS NOT NULL
	AND g.idNumeroAluno1  NOT IN (SELECT a.numeroAluno FROM Aluno a);


DELETE FROM Grupo 
	WHERE idNumeroAluno1  NOT IN (SELECT a.numeroAluno FROM Aluno a);


-- //Apagar alunos da coluna 2 que nao estao em alunos

SELECT g.idNumeroAluno2 
	 FROM Grupo g
WHERE g.idNumeroAluno2  IS NOT NULL
	AND g.idNumeroAluno2  NOT IN (SELECT a.numeroAluno FROM Aluno a);


DELETE FROM Grupo 
	WHERE idNumeroAluno2  NOT IN (SELECT a.numeroAluno FROM Aluno a );

-- ------------------------Utilizador-------------------------------------------------

-- Apagar utilizadores que nao estejam em nenhuma tabela da base de dados 

SELECT id , coordenador  , idIdentificacao  , tipoUtilizador i
    FROM Utilizador u  
WHERE    u.idIdentificacao NOT IN (SELECT numeroAluno FROM Aluno a) 
          AND u.idIdentificacao NOT IN (SELECT numeroProfessor FROM ProfessorDEISI pd)
          AND u.idIdentificacao NOT IN (SELECT idProfessor FROM ProfessorNDEISI pn ) 
          AND u.idIdentificacao NOT IN (SELECT idEmpresa FROM Empresa_EntidadeExterna eee );
          
DELETE FROM Utilizador  
WHERE  idIdentificacao NOT IN (SELECT numeroAluno FROM Aluno a) 
          AND idIdentificacao NOT IN (SELECT numeroProfessor FROM ProfessorDEISI pd)
          AND idIdentificacao NOT IN (SELECT idProfessor FROM ProfessorNDEISI pn ) 
          AND idIdentificacao NOT IN (SELECT idEmpresa FROM Empresa_EntidadeExterna eee );

-- ------------------------TFC-------------------------------------------------

-- //Apagar linhas com idGrupo que nao estao na tabela de Grupos

SELECT idtfc , Titulo , numeroInscricoes , orientador , estado , anoLetivo , idGrupo  
    FROM TFC t 
WHERE    t.idGrupo NOT IN (SELECT id FROM Grupo g);           

DELETE FROM TFC 
WHERE idGrupo  NOT IN ( SELECT id FROM Grupo); 

-- ------------------------HistoricoTFC-------------------------------------------------

-- // Apagar utilizadores que nao estao na tabela de utilizadores      

SELECT id , utilizador  , estado s
    FROM HistoricoTFC ht  
WHERE    utilizador  NOT IN (SELECT idIdentificacao FROM Utilizador u ) ;
          
DELETE FROM HistoricoTFC ht  
WHERE    utilizador  NOT IN (SELECT idIdentificacao FROM Utilizador u ) ;   

-- Decidimos tambem fazer estas alteracoes em relacao a tabela utilizador pois faz sentido no modelo


-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- exercicio 6 : Criar chaves primárias para a tabelas do modelo

-- ------------------------ProfDeisi-----------------------------------

ALTER TABLE ProfessorDEISI
DROP PRIMARY KEY;

ALTER TABLE ProfessorDEISI
ADD PRIMARY KEY (numeroProfessor);

-- -----------------------ProfNDEISI--------------------------------

ALTER TABLE ProfessorNDEISI
DROP PRIMARY KEY;

ALTER TABLE ProfessorNDEISI
ADD PRIMARY KEY (idProfessor);

-- ---------------------Empresa_EntidadeExterna----------------------

ALTER TABLE Empresa_EntidadeExterna
DROP PRIMARY KEY;

ALTER TABLE Empresa_EntidadeExterna
ADD PRIMARY KEY (idEmpresa);

-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- exercicio 7 : Inserir a coluna [Aluno].[ECTS], de tipo inteiro, preenchimento obrigatório e com DEFAULT 0 

-- Preencher a coluna aleatoriamente para, pelo menos, 5 alunos de modo que se possa responder aos exercícios da 3ª etapa 

ALTER TABLE Aluno 
ADD COLUMN ECTS INT(11) NOT NULL DEFAULT 0;

ALTER TABLE Aluno
DROP COLUMN ECTS;

INSERT INTO Aluno (id, curso, email, nome, numeroAluno, numeroContato, ECTS)
VALUES 
(355, 'LEI', NULL, 'a22290818', 'a22290818',  NULL, 104),
(356, 'LIG', NULL, 'a22271568', 'a22271568',  NULL, 146),
(357, 'LEI', NULL, 'a22214832', 'a22214832', NULL,  180),
(358, 'LIG',NULL, 'a22230865', 'a22230865',  NULL, 90),
(359, 'LEI',NULL, 'a22250115', 'a22250115',  NULL, 129);

-- Preenchemos os 5 alunos e deixamos um deles com 85 ECTS ou seja não lhe pode ser atribuido o TFC

-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- exercicio 8 : Para os mesmo cinco alunos utilizados na alínea anterior e para o mesmo efeito, 

-- Preencher avaliações – tabela [AvaliacaoDisciplinaAluno] – para as disciplinas referenciadas no TFC 
     
INSERT INTO AvaliacaoDisciplina (id, idNumeroAluno, idNumeroDisciplina, nota)
VALUES 
(1,  'a22214832',2, 15),
(2,  'a22214832',30, 17),
(3,  'a22290818',2, 10),
(4,  'a22290818',30, 15),
(5,  'a22271568',4, 10),
(6,  'a22271568',8, 14),
(7,  'a22230865',4, 10),
(8,  'a22230865',8, 10),
(9,  'a22250115',4, 8),
(10,  'a22250115',8, 7);

-- Preenchemos as disciplinas relativos aos TFCS : DEISI85 , DEISI130
-- Apenas um dos alunos nao tem nota o suficiente para lhe ser atribuido o TFC

-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- exercicio 9 : Acrescentar as restrições de integridade – UK, NN, CH

-- ----------------------------------------curso------------------------------------

-- Coluna nome ser unica

ALTER TABLE Curso
ADD CONSTRAINT UK_Curso_Nome UNIQUE (nome);



-- ----------------------------------------disciplina----------------------------------------

-- Coluna nome ser unica

ALTER TABLE Disciplina
ADD CONSTRAINT UK_Disciplina_Nome UNIQUE (nome); 



-- ----------------------------------------tecnologia----------------------------------------

-- Coluna nome ser unica

ALTER TABLE Tecnologia
ADD CONSTRAINT UK_Tecnologia_Nome UNIQUE (nome);



-- ----------------------------------------inscricao----------------------------------------

-- Coluna ordemEscolha apenas numeros entre 1 e 6

SELECT id, ordemEscolha
FROM Inscricao
WHERE ordemEscolha NOT BETWEEN 1 AND 6;

DELETE 
FROM Inscricao
WHERE ordemEscolha NOT BETWEEN 1 AND 6;


ALTER TABLE Inscricao
ADD CONSTRAINT CK_Inscricao_OrdemEscolha CHECK (ordemEscolha BETWEEN 1 AND 6);


-- Coluna registoDeInscricao coincidir com ano letivo

SELECT *
FROM Inscricao
WHERE SUBSTRING(registoDeInscricao, 1, 4) <> anoLetivo;

UPDATE Inscricao
SET anoLetivo = SUBSTRING(registoDeInscricao, 1, 4)
WHERE SUBSTRING(registoDeInscricao, 1, 4) <> anoLetivo;


ALTER TABLE Inscricao
ADD CONSTRAINT CK_registoAno_coerente
CHECK (SUBSTRING(registoDeInscricao, 1, 4) = anoLetivo);



-- ----------------------------------------profDEISI----------------------------------------

-- coluna email e numeroContacto unicos 

ALTER TABLE ProfessorDEISI
ADD CONSTRAINT UK_ProfessorNDEISI_Email UNIQUE (email);

ALTER TABLE ProfessorDEISI
ADD CONSTRAINT UK_ProfessorNDEISI_Contacto UNIQUE (numeroContato);





-- ----------------------------------------profNDEISI----------------------------------------

-- coluna email e numeroContacto unicos

ALTER TABLE ProfessorNDEISI
ADD CONSTRAINT UK_ProfessorNDEISI_Email UNIQUE (email);

ALTER TABLE ProfessorNDEISI
ADD CONSTRAINT UK_ProfessorNDEISI_Contacto UNIQUE (numeroContato);







-- ----------------------------------------utilizador----------------------------------------

-- coluna idIdentificacao Unica

ALTER TABLE Utilizador
	ADD CONSTRAINT UK_Utilizador_Identificacao UNIQUE (idIdentificacao);

-- mudamos os ids para formato emp(idAntigo) para ficar mais organizado

	UPDATE Utilizador 
	SET idIdentificacao = CONCAT('emp', idIdentificacao)
	WHERE tipoUtilizador = 'Empresa';  




-- ----------------------------------------AvaliacaoDisciplina----------------------------------------


-- coluna nota de 0 a 20

ALTER TABLE AvaliacaoDisciplina
MODIFY COLUMN nota INT(11) NOT NULL;

ALTER TABLE AvaliacaoDisciplina
ADD CONSTRAINT CH_nota_range CHECK (nota >= 0 AND nota <= 20);



-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- exercicio 10 : Garantir que pelos menos um entre Aluno e grupo está preenchido


-- exercicio 10


-- -----------------------------------inscricao-------------------------------


ALTER TABLE Inscricao
ADD CONSTRAINT CK_Inscricao_TipoIdentificacao CHECK (
   (idNumeroGrupo IS NOT NULL AND numeroAluno IS NULL) OR
   (idNumeroGrupo IS NULL AND numeroAluno IS NOT NULL)
);



-- ----------------------------------------TFC-----------------------------

DELIMITER //

CREATE TRIGGER trg_validar_preponente
BEFORE INSERT ON TFC
FOR EACH ROW
BEGIN
    DECLARE id_valido BOOLEAN;

    -- Verificar se o preponente é um ProfessorDEISI válido
    SELECT 1 INTO id_valido
    FROM ProfessorDEISI
    WHERE numeroProfessor = NEW.preponente;

    IF id_valido IS NULL THEN
        -- Verificar se o preponente é um ProfessorNDEISI válido
        SELECT 1 INTO id_valido
        FROM ProfessorNDEISI
        WHERE idProfessor = NEW.preponente;
    END IF;

    IF id_valido IS NULL THEN
        -- Verificar se o preponente é um Aluno válido
        SELECT 1 INTO id_valido
        FROM Aluno
        WHERE numeroAluno = NEW.preponente;
    END IF;

    -- Se nenhum dos casos acima for verdadeiro, lançar um erro
   
    IF id_valido IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ID de preponente inválido. Deve ser um ProfessorDEISI, ProfessorNDEISI , Aluno ou EntidadeExterna.';
    END IF;
   
    IF id_valido IS NULL THEN
        -- Verificar se o preponente é uma Empresa_EntidadeExterna válida
   		SELECT 1 INTO id_valido
        FROM Empresa_EntidadeExterna 
        WHERE idEmpresa = NEW.preponente;
    END IF;
   
END;

//

DELIMITER ;

-- Decidimos criar este trigger para ter a certesa que na coluna preponente so entrao valores,
-- correspondentes a alunos , professores , empresas


-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- exercicio 11 : Adicionar chaves estrangeiras (FK) indicadas no modelo dados 


-- ----------------------------------------TFCcurso----------------------------------------

ALTER TABLE TFCCurso
ADD CONSTRAINT FK_TFCCurso_TFC FOREIGN KEY (idTFC) REFERENCES TFC(idTFC);

ALTER TABLE TFCCurso 
DROP CONSTRAINT FK_TFCCurso_TFC;


ALTER TABLE TFCCurso
ADD CONSTRAINT FK_TFCCurso_Curso FOREIGN KEY (idCurso) REFERENCES Curso(id);




-- ----------------------------------------disciplina----------------------------------------


ALTER TABLE Disciplina
ADD CONSTRAINT FK_Disciplina_Curso FOREIGN KEY (cursoAssociado) REFERENCES Curso(id);



-- ----------------------------------------TFCdisciplina----------------------------------------

ALTER TABLE TFCDisciplina
ADD CONSTRAINT FK_TFCDisciplina_TFC FOREIGN KEY (numeroTFC) REFERENCES TFC(idTFC);

ALTER TABLE TFCDisciplina 
DROP CONSTRAINT FK_TFCDisciplina_TFC;



ALTER TABLE TFCDisciplina
ADD CONSTRAINT FK_TFCDisciplina_Disciplina FOREIGN KEY (idNumeroDisciplina) REFERENCES Disciplina(id);




-- ----------------------------------------TFCtecnologia----------------------------------------



ALTER TABLE TFCTecnologia
ADD CONSTRAINT FK_TFCTecnologia_TFC FOREIGN KEY (idTFC) REFERENCES TFC(idTFC);

ALTER TABLE TFCTecnologia
DROP CONSTRAINT FK_TFCTecnologia_TFC;

ALTER TABLE TFCTecnologia
ADD CONSTRAINT FK_TFCTecnologia_Tecnologia FOREIGN KEY (idTecnologia) REFERENCES Tecnologia(id);



-- ----------------------------------------inscricao----------------------------------------



ALTER TABLE Inscricao
ADD CONSTRAINT FK_Inscricao_TFC FOREIGN KEY (idTFC) REFERENCES TFC(idTFC);

ALTER TABLE Inscricao
DROP CONSTRAINT FK_Inscricao_TFC ;


ALTER TABLE Inscricao
ADD CONSTRAINT FK_Inscricao_Grupo FOREIGN KEY (idNumeroGrupo) REFERENCES Grupo(id);

ALTER TABLE Inscricao
ADD CONSTRAINT FK_Inscricao_Aluno FOREIGN KEY (numeroAluno) REFERENCES Aluno(numeroAluno);



-- ----------------------------------------grupo----------------------------------------


ALTER TABLE Grupo
ADD CONSTRAINT FK_Grupo_Aluno1 FOREIGN KEY (idNumeroAluno1) REFERENCES Aluno(numeroAluno);

ALTER TABLE Grupo
ADD CONSTRAINT FK_Grupo_Aluno2 FOREIGN KEY (idNumeroAluno2) REFERENCES Aluno(numeroAluno);




-- ----------------------------------------AvaliacaoDisciplina----------------------------------------


ALTER TABLE AvaliacaoDisciplina
ADD CONSTRAINT FK_AvaliacaoDisciplinaAluno FOREIGN KEY (idNumeroAluno) REFERENCES Aluno(numeroAluno);



ALTER TABLE AvaliacaoDisciplina
ADD CONSTRAINT FK_AvaliacaoDisciplina_Disciplina FOREIGN KEY (idNumeroDisciplina) REFERENCES Disciplina(id);




-- ----------------------------------------TFC----------------------------------------



ALTER TABLE TFC
ADD CONSTRAINT FK_TFC_Grupo FOREIGN KEY (idGrupo) REFERENCES Grupo(id);

ALTER TABLE TFC
ADD CONSTRAINT FK_TFC_Orientador FOREIGN KEY (orientador) REFERENCES ProfessorDEISI(numeroProfessor);



-- ----------------------------------------HistoricoTFC----------------------------------------


ALTER TABLE HistoricoTFC
ADD CONSTRAINT FK_HistoricoTFC_TFC FOREIGN KEY (idTFC) REFERENCES TFC(idTFC);

ALTER TABLE HistoricoTFC
ADD CONSTRAINT FK_HistoricoTFC_Utilizador FOREIGN KEY (utilizador) REFERENCES Utilizador(idIdentificacao);

ALTER TABLE HistoricoTFC 
DROP CONSTRAINT FK_HistoricoTFC_TFC;


-- ////////////////////////////////////////////////////////////////////////////////////////////

-- exercicio 12 : Alterar o modelo de modo que, sempre que possível,
                  -- sejam utilizadas chaves naturais para as entidades do modelo.


-- ----------------------------------------TFC----------------------------------------



ALTER TABLE TFC
DROP PRIMARY KEY;

ALTER TABLE TFC
ADD PRIMARY KEY (idTFC);



-- ----------------------------------------Aluno----------------------------------------


ALTER TABLE Aluno 
DROP PRIMARY KEY;

ALTER TABLE Aluno
ADD PRIMARY KEY (numeroAluno);


-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- exercicio 13: Adicionar coluna estado a Aluno


ALTER TABLE Aluno 
ADD COLUMN estado VARCHAR(255);

SELECT a.id AS idAluno, a.nome, a.numeroAluno, i.id AS idInscricao, a.estado AS estado_anterior, 'válido' AS novo_estado
FROM Aluno a
JOIN Inscricao i ON i.numeroAluno = a.numeroAluno
WHERE i.estado = 'Atribuido';



-- Atualizar o estado dos alunos com tema atribuído individualmente

UPDATE Aluno a
SET estado = 'válido'
WHERE EXISTS (
    SELECT 1
    FROM Inscricao i
    WHERE i.numeroAluno = a.numeroAluno
      AND i.estado = 'Atribuido'
);

SELECT a.id AS idAluno, a.nome, a.numeroAluno, i.id AS idInscricao, a.estado AS estado_anterior, 'válido' AS novo_estado
FROM Aluno a
JOIN Grupo g ON a.numeroAluno IN (g.idNumeroAluno1, g.idNumeroAluno2)
JOIN Inscricao i ON g.id = i.idNumeroGrupo
WHERE i.estado = 'Atribuido';

-- Atualizar o estado dos alunos com tema atribuído em grupo

UPDATE Aluno a
SET estado = 'válido'
WHERE EXISTS (
    SELECT 1
    FROM Grupo g
    JOIN Inscricao i ON g.id = i.idNumeroGrupo
    WHERE a.numeroAluno IN (g.idNumeroAluno1, g.idNumeroAluno2)
      AND i.estado = 'Atribuido'
);

-- Atualizar o estado dos alunos sem tema atribuído

UPDATE Aluno
SET estado = 'excluído'
WHERE estado IS NULL;


ALTER TABLE Aluno
MODIFY COLUMN estado VARCHAR(255) NOT NULL;


-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- exercicio 14: Fortalecer a normalização do modelo, no sentido que este fique em FN3

-- -------------------------------------inscricao----------------------------------------

ALTER TABLE Inscricao
DROP COLUMN publicado;

-- ----------------------------------------aluno----------------------------------------


ALTER TABLE Aluno    -- nome é redundade sendo que temos numeroAluno
DROP COLUMN nome;

ALTER TABLE Aluno    -- contato é redundante
DROP COLUMN numeroContato;



-- ----------------------------------------profDEISI----------------------------------------

ALTER TABLE ProfessorDEISI
DROP COLUMN numeroContato;


-- ------------------------------------------TFC------------------------------------------------


ALTER TABLE TFC
DROP COLUMN orientadorProposto;  --  orientadorProposto é uma redundancia de orientador

ALTER TABLE TFC
DROP COLUMN semestre;  -- não faz sentido para os dias de hoje 

ALTER TABLE TFC
DROP COLUMN tecnologias; -- nao faz sentido visto que ja temos uma ligacao entre tecnologias e tfc feito por meio da tabela TFCDisciplina

ALTER TABLE TFC
DROP COLUMN numeroInscricoes; -- retirar valores calculados , o numero de inscricoes pode ser calculado ao fazer a pesquisa necessaria
                              -- não é preciso ocupar espaco na base de dados 


-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- Exercicio 15 , 16: Querys


-- 16.1

DELIMITER //

CREATE FUNCTION CalcularNumeroInscricoes(idTFCParam VARCHAR(255)) RETURNS INT
BEGIN
    DECLARE numInscricoes INT;

    SELECT COUNT(*) INTO numInscricoes
    FROM Inscricao
    WHERE idTFC = idTFCParam;

    RETURN numInscricoes;
END //

DELIMITER ;


SELECT idTFC, CalcularNumeroInscricoes(idTFC) AS NumeroInscricoes
FROM TFC;


-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- 16.3


CREATE VIEW ViewTemasAtribuidosAnoLetivo AS
SELECT t.idTFC AS idTFC,
       t.Titulo AS Titulo,
       a.numeroAluno AS NumeroAluno,
       t.orientador AS Orientador,
       t.coorientador AS Coorientador,
       t.anoLetivo AS AnoLetivo
FROM TFC t
JOIN Inscricao i ON t.idTFC = i.idTFC
JOIN Aluno a ON i.numeroAluno = a.numeroAluno
WHERE i.estado = 'Atribuido';



SELECT * FROM ViewTemasAtribuidosAnoLetivo WHERE anoLetivo = '2022';    -- // COLOCAR ano pretendido

-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- 16.4

CREATE VIEW TemasAtribuidosPorOrientador AS
SELECT pd.nome AS docente,
       GROUP_CONCAT(DISTINCT co.nome SEPARATOR ', ') AS coorientador,
       t.idTFC AS TFC,
       t.Titulo AS titulo,
       GROUP_CONCAT(DISTINCT a.numeroAluno SEPARATOR ', ') AS aluno
FROM TFC t
JOIN Inscricao i ON t.idTFC = i.idTFC
JOIN Aluno a ON i.numeroAluno = a.numeroAluno
JOIN ProfessorDEISI pd ON t.orientador = pd.numeroProfessor
LEFT JOIN ProfessorDEISI co ON t.coorientador = co.numeroProfessor
WHERE t.preponente LIKE 'p%'
GROUP BY pd.nome, t.idTFC, t.Titulo;





SELECT * FROM TemasAtribuidosPorOrientador;




-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- 16.6

CREATE VIEW TemasDisponiveis AS
SELECT
    i.idTFC,
    t.titulo AS Titulo,
    CASE
        WHEN i.numeroAluno IS NOT NULL THEN i.numeroAluno
        WHEN i.idNumeroGrupo IS NOT NULL THEN i.idNumeroGrupo 
    END AS Identificador,
    i.ordemEscolha,
    i.registoDeInscricao,
    t.orientador
FROM
    Inscricao i
JOIN
    TFC t ON i.idTFC = t.idtfc AND t.estado = 'A Aguardar Atribuição'
LEFT JOIN
    Aluno a ON i.numeroAluno = a.numeroAluno
LEFT JOIN
    Grupo g ON i.idNumeroGrupo = g.id
LEFT JOIN
    Aluno a1 ON g.idNumeroAluno1 = a1.numeroAluno
LEFT JOIN
    Aluno a2 ON g.idNumeroAluno2 = a2.numeroAluno
WHERE
    i.estado = 'A Aguardar Atribuição'
    AND (
        (i.numeroAluno IS NOT NULL AND a.estado = 'excluido' AND g.id IS NULL)
        OR
        (i.idNumeroGrupo IS NOT NULL AND (a1.estado = 'excluido' AND a2.estado = 'excluido'))
    );
    
   SELECT * FROM TemasDisponiveis;
  

  
  
  -- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- 16.7

CREATE VIEW ViewTemasAtribuidosPorAluno AS
SELECT a.numeroAluno AS Numero_Aluno,
       t.idTFC AS ID_Tema,
       t.Titulo AS Titulo_Tema,
       t.orientador AS Orientador
FROM Inscricao i
JOIN TFC t ON i.idTFC = t.idTFC
JOIN Aluno a ON i.numeroAluno = a.numeroAluno
WHERE i.estado = 'Atribuido';

SELECT * FROM ViewTemasAtribuidosPorAluno;



-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- 16.8


DELIMITER //

CREATE PROCEDURE MostrarRegistrosTema(IN idTFCParam VARCHAR(255))
BEGIN
    SELECT tfc.idTFC , tfc.titulo, ht.avaliacao , ht.estado, ht.dataMudancaEstado AS data, ht.utilizador
    FROM HistoricoTFC ht
    JOIN TFC tfc ON ht.idTFC = tfc.idTFC
    WHERE tfc.idTFC = idTFCParam
    ORDER BY ht.dataMudancaEstado DESC;
END //

DELIMITER ;


CALL MostrarRegistrosTema('DEISI132');



-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- 16.9



DELIMITER //

CREATE PROCEDURE ObterListaOrientacoesPorProfessor()
BEGIN
    SELECT
        pd.numeroProfessor AS NumeroProfessor,
        pd.nome AS NomeDocente,
        COUNT(DISTINCT t.orientador) AS Orientacoes,
        COUNT(DISTINCT t.coorientador) AS Coorientacoes
    FROM
        ProfessorDEISI pd
    LEFT JOIN
        TFC t ON pd.numeroProfessor = t.orientador OR pd.numeroProfessor = t.coorientador
    GROUP BY
        pd.numeroProfessor, pd.nome
    ORDER BY
        pd.numeroProfessor;
END //

DELIMITER ;



CALL ObterListaOrientacoesPorProfessor();


-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- 16.11

DELIMITER //

CREATE TRIGGER alteracaoDeEstado_DepoisTemaPublicado
AFTER UPDATE ON TFC
FOR EACH ROW
BEGIN
    DECLARE idInscricaoAtualizada BIGINT;

    IF NEW.estado = 'Publicado' THEN
        -- Obter o ID da inscrição associada a este TFC
        SELECT id INTO idInscricaoAtualizada
        FROM Inscricao
        WHERE idTFC = NEW.idtfc
        LIMIT 1;

        -- Alterar o estado da inscrição associada a este TFC para "Atribuído"
        UPDATE Inscricao
        SET estado = 'Atribuído'
        WHERE idTFC = NEW.idtfc
        	AND id = idInscricaoAtualizada;

        -- Utilizar o ID da inscrição para as próximas atualizações
        UPDATE Inscricao
        SET estado = 'Não Atribuído'
        WHERE idTFC = NEW.idtfc
          AND id != idInscricaoAtualizada;
    END IF;
END //

DELIMITER ;

DROP TRIGGER after_theme_published;





-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


-- 16.13


DELIMITER //

CREATE FUNCTION ObterNomesDoGrupo(groupId BIGINT) RETURNS VARCHAR(255)
BEGIN
    DECLARE nomeAluno1 VARCHAR(255);
    DECLARE nomeAluno2 VARCHAR(255);

    -- Obter nomes dos alunos no grupo
    SELECT
        (SELECT nome FROM Aluno WHERE numeroAluno = g.idNumeroAluno1) AS nome1,
        (SELECT nome FROM Aluno WHERE numeroAluno = g.idNumeroAluno2) AS nome2
    INTO nomeAluno1, nomeAluno2
    FROM Grupo g
    WHERE g.id = groupId;

    -- Verificar se o grupo existe
    IF nomeAluno1 IS NOT NULL AND nomeAluno2 IS NOT NULL THEN
        -- Retornar os nomes dos alunos no formato desejado
        RETURN CONCAT( nomeAluno1 ," , ", nomeAluno2);
    ELSE
        -- Se o grupo não existir, retornar mensagem de erro
        RETURN 'Grupo não encontrado';
    END IF;
END //

DELIMITER ;

SELECT ObterNomesDoGrupo(1);

-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


-- 16.14


DELIMITER //

CREATE FUNCTION VerificarAtribuicaoTFC(idTFCParam VARCHAR(255)) RETURNS VARCHAR(255)
BEGIN
    IF (SELECT estado FROM TFC WHERE idTFC = idTFCParam) = 'Atribuido' THEN
        RETURN (
            SELECT GROUP_CONCAT(numeroAluno SEPARATOR ' , ')
            FROM Inscricao
            WHERE idTFC = idTFCParam
        );
    ELSE
        RETURN (SELECT estado FROM TFC WHERE idTFC = idTFCParam);
    END IF;
END //

DELIMITER ;




SELECT VerificarAtribuicaoTFC('DEISI30');


-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- 16.16

DELIMITER //

CREATE TRIGGER VerificarEstadoAntesDeletarTFC
BEFORE DELETE ON TFC
FOR EACH ROW
BEGIN
    IF OLD.estado = 'Atribuido' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Não é possível excluir este tema, pois está atribuído.';
    END IF;
END //

DELIMITER ;
