-- Tabela de Estados
CREATE TABLE Estado (
    EstadoID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    UF CHAR(2) NOT NULL
);

-- Tabela de Cidades
CREATE TABLE Cidade (
    CidadeID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    EstadoID INT NOT NULL,
    FOREIGN KEY (EstadoID) REFERENCES Estado(EstadoID)
);

-- Tabela de Polos
CREATE TABLE Polo (
    PoloID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CidadeID INT NOT NULL,
    FOREIGN KEY (CidadeID) REFERENCES Cidade(CidadeID)
);

-- Tabela de Cursos
CREATE TABLE Curso (
    CursoID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    VagasDisponiveis INT NOT NULL,
    Preco DECIMAL(10,2) NOT NULL,
    CidadeID INT NOT NULL,
    FOREIGN KEY (CidadeID) REFERENCES Cidade(CidadeID)
);

-- Tabela de Estudantes
CREATE TABLE Estudante (
    EstudanteID INT IDENTITY(1,1) PRIMARY KEY,
    Total_Ativos INT,
    Total_Formados INT,
    Total_Desistentes INT,
    Total_Trancamentos INT,
    CursoID INT NOT NULL,
    PoloID INT NOT NULL,
    Satisfacao DECIMAL(2,1) CHECK (Satisfacao BETWEEN 1.0 AND 5.0),
    DataConsiderada DATE,
    FOREIGN KEY (CursoID) REFERENCES Curso(CursoID),
    FOREIGN KEY (PoloID) REFERENCES Polo(PoloID)
);

-- Tabela de Pagamentos
CREATE TABLE Pagamento (
    PagamentoID INT IDENTITY(1,1) PRIMARY KEY,
    EstudanteID INT NOT NULL,
    CursoID INT NOT NULL,
    StatusPagamento VARCHAR(20) CHECK (StatusPagamento IN ('Adimplente', 'Inadimplente')) NOT NULL,
    FOREIGN KEY (EstudanteID) REFERENCES Estudante(EstudanteID),
    FOREIGN KEY (CursoID) REFERENCES Curso(CursoID)
);
