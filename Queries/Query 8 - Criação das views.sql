--- Query 8 - Criação das views - Projeto: Power BI para uma instituição fictícia
--- Data: 19/07/2025
--- Autor: Willian Ferreira Gonçalves
--- INFORMAÇÃO DAS RELAÇÕES ENTRE AS TABELAS: Pagamento -> Estudante -> Curso -> Polo -> Cidade -> Estado + UF


--- View Resumo Quantidade Estudantes
CREATE VIEW vw_ResumoQuantidadeEstudantes AS
SELECT
	E.Total_Ativos, E.Total_Formados, E.Total_Desistentes, E.Total_Trancamentos,
	P.Nome AS 'Polo Considerado',
	Ci.Nome AS 'Cidade Considerada',
	Es.Nome AS 'Estado Considerado',
	Es.UF AS 'UF Respectiva'
FROM Estudante E
INNER JOIN Curso C ON C.CursoID = E.CursoID
INNER JOIN Polo P ON P.PoloID = E.PoloID
INNER JOIN Cidade Ci ON P.CidadeID = Ci.CidadeID
INNER JOIN Estado Es ON Es.EstadoID = Ci.EstadoID;

--- View Satisfação dos Estudantes
CREATE VIEW vw_SatisfacaoDosEstudantes AS
SELECT
	E.DataConsiderada AS 'Data Considerada',
	E.Satisfacao AS 'Satisfação',
	C.Nome AS 'Nome do Curso',
	P.Nome AS 'Polo Considerado',
	Ci.Nome AS 'Cidade Considerada',
	Es.Nome AS 'Estado Considerado',
	Es.UF AS 'UF Respectiva'
FROM Estudante E
INNER JOIN Curso C ON C.CursoID = E.CursoID
INNER JOIN Polo P ON P.PoloID = E.PoloID
INNER JOIN Cidade Ci ON P.CidadeID = Ci.CidadeID
INNER JOIN Estado Es ON Es.EstadoID = Ci.EstadoID;

--- View Resumo Cursos
CREATE VIEW vw_ResumoDosCursos AS
SELECT
	E.DataConsiderada AS 'Data Considerada',
	C.Nome AS 'Nome do Curso', C.Preco 'Preço', C.VagasDisponiveis AS 'Vagas Disponíveis',
	P.Nome AS 'Polo Considerado',
	Ci.Nome AS 'Cidade Considerada',
	Es.Nome AS 'Estado Considerado',
	Es.UF AS 'UF Respectiva'
FROM Estudante E
INNER JOIN Curso C ON C.CursoID = E.CursoID
INNER JOIN Polo P ON P.PoloID = E.PoloID
INNER JOIN Cidade Ci ON P.CidadeID = Ci.CidadeID
INNER JOIN Estado Es ON Es.EstadoID = Ci.EstadoID;

--- View Resumo Financeiro
CREATE VIEW vw_ResumoFinanceiro AS
SELECT
	E.DataConsiderada AS 'Data Considerada',
	C.Nome AS 'Nome do Curso', C.Preco 'Preço', C.VagasDisponiveis AS 'Vagas Disponíveis',
	P.Nome AS 'Polo Considerado',
	Ci.Nome AS 'Cidade Considerada',
	Es.Nome AS 'Estado Considerado',
	Es.UF AS 'UF Respectiva'
FROM Estudante E
INNER JOIN Curso C ON C.CursoID = E.CursoID
INNER JOIN Polo P ON P.PoloID = E.PoloID
INNER JOIN Cidade Ci ON P.CidadeID = Ci.CidadeID
INNER JOIN Estado Es ON Es.EstadoID = Ci.EstadoID
GROUP BY
E.DataConsiderada, C.Nome, P.Nome, Ci.Nome, Es.Nome, Es.UF;

