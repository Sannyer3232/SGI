CREATE DATABASE  IF NOT EXISTS bdsgi;

USE bdsgi;
call sp_filial();
CREATE TABLE sedetemplo (
    id_Sede_templo INT AUTO_INCREMENT,
    sednome VARCHAR(255) NOT NULL,
    sedtelefone VARCHAR(15) NOT NULL,
    sedemail VARCHAR(255),
    PRIMARY KEY (id_Sede_Templo)
);


CREATE TABLE filial (
    idfilial INT AUTO_INCREMENT NOT NULL,
    filsedeid INT,
    filnome VARCHAR(255) NOT NULL,
    filtelefone VARCHAR(15) NOT NULL,
    filemail VARCHAR(255),
    PRIMARY KEY (idfilial),
    FOREIGN KEY (filsedeid) REFERENCES sedetemplo(id_Sede_Templo)
);

DESC filial;
SELECT * FROM filial;
SELECT * FROM filial;
drop table Membro;
CREATE TABLE membro (
    
    id_Membro  INT AUTO_INCREMENT,
    mbrsedeid INT,
    mbrnome VARCHAR(255) NOT NULL,
    mbrcpf VARCHAR(20) NOT NULL,
    mbrmsuperior INT,
	mbrnumero_identidade VARCHAR(20) NOT NULL,
    mbremail VARCHAR(30) NOT NULL,
    mbrtelefone VARCHAR(20) NOT NULL,
    mbrata_nascimento DATE NOT NULL,
    mbrcivilId INT,
    mbrendereco INT NOT NULL,
    mbrfoto varchar(255),
    mbrativo boolean,
    mbrsenha VARCHAR(32),
    mbrfilid int not null,
    PRIMARY KEY(id_Membro),
    FOREIGN KEY (mbrsedeid) REFERENCES sedetemplo(id_Sede_Templo),
	FOREIGN KEY(mbrcivilId) REFERENCES estadocivil(iestid),
    FOREIGN KEY (mbrendereco) REFERENCES endereco(id_Endereco),
    foreign key (mbrfilid) references filial(idfilial)
    
);


CREATE TABLE estadocivil (

	iestid INT AUTO_INCREMENT,
    descricao VARCHAR(50) NOT NULL,
    PRIMARY KEY(iestid)
);


CREATE TABLE pastor (
    
    idpastor INT,
    PRIMARY KEY(idpastor),
    FOREIGN KEY (idpastor) REFERENCES Membro(Id_Membro)
);

alter table pastor modify column idpastor int;

CREATE TABLE presbitero (
    
    idpresbitero INT,
    PRIMARY KEY(idpresbitero),
    FOREIGN KEY (idpresbitero) REFERENCES Membro(Id_Membro)
);

CREATE TABLE secretaria (

    idsecretaria INT,
    PRIMARY KEY (idsecretaria),
    FOREIGN KEY (idsecretaria) REFERENCES Membro(Id_Membro)
);

CREATE TABLE diacono (
    
    iddiacono INT,
    PRIMARY KEY(iddiacono),
    FOREIGN KEY (iddiacono) REFERENCES Membro(Id_Membro)
);

CREATE TABLE porteiro (

    idporteiro INT,
    PRIMARY KEY (idporteiro),
    FOREIGN KEY (idporteiro) REFERENCES Membro(Id_Membro)
);

CREATE TABLE musico (

    idmusico INT,
    PRIMARY KEY (idmusico),
    FOREIGN KEY (idmusico) REFERENCES Membro(Id_Membro)
);

CREATE TABLE corallouvor (

    idcoral INT ,
    PRIMARY KEY (idcoral),
    FOREIGN KEY (idcoral) REFERENCES Membro(Id_Membro)
);

CREATE TABLE orcacaointercessao (

    idoracao INT,
    PRIMARY KEY (idoracao),
    FOREIGN KEY (idoracao) REFERENCES Membro(Id_Membro)
);

CREATE TABLE sonoplastia (

    idsonoplastia INT,
    PRIMARY KEY (idsonoplastia),
    FOREIGN KEY (idsonoplastia) REFERENCES Membro(Id_Membro)
);

CREATE TABLE endereco (

    id_Endereco INT AUTO_INCREMENT,
    endrua VARCHAR(100) NOT NULL,
    endnumero VARCHAR(11) NOT NULL,
    endbairro VARCHAR(100),
    endcep VARCHAR(10) NOT NULL,
    endcidade VARCHAR(50) NOT NULL,
    endestado VARCHAR(50) NOT NULL,
    PRIMARY KEY (Id_Endereco)
);


SELECT * FROM Endereco;


CREATE TABLE Evento (

    idevento INT AUTO_INCREMENT,
    evetitulo VARCHAR(255),
    evedata DATE,
    evehora TIME,
    evelocalizacao VARCHAR(255),
    evestatus ENUM('agendado','concluido','Cancelado'),
    eveidfil int not null,
    PRIMARY KEY(idevento),
    FOREIGN KEY (eveidfil) REFERENCES filial(idfilial)
);



CREATE TABLE doacoesdebens (

    iddoacao INT AUTO_INCREMENT,
    doanomedoador VARCHAR(255),
    doamembroid INT,
    doasecretariaid INT,
    doadescricao TEXT,
    doadtdoacao date not null,
    doavalor DECIMAL(10,2),
    status ENUM('Pendente', 'entregue', 'Recusado'),
    PRIMARY KEY(iddoacao),

    FOREIGN KEY (doamembroid) REFERENCES Membro(mbrid)
);

CREATE TABLE dizimosofertas (

    iddizimooferta INT AUTO_INCREMENT,
    dzomembroid INT,
    dzotipo ENUM('Dizimo','Oferta'),
    dzovalor DECIMAL(10,2),
    dzodtcontribuicao DATE,
    FOREIGN KEY (dzomembroid) REFERENCES Membro(mbrid)
);

CREATE TABLE contasapagar (

    idcontapagar INT AUTO_INCREMENT,
    cntnomefornecedor VARCHAR(255),
    cntmbrid int not null,
    cntdescricaoconta VARCHAR(255),
    cntdtvencimento DATE,
    cntstatuspagamento ENUM('Pendente','Pago'),
    PRIMARY KEY(idcontapagar),
    FOREIGN KEY (cntmbrid) REFERENCES membro(mbrid)
);


CREATE TABLE patrimonio (
    idpatrimonio INT AUTO_INCREMENT,
    ptrnome VARCHAR(255) NOT NULL,
    ptrvalor DECIMAL(10,2),
    ptrdataaquisicao DATE,
    ptrdescricao varchar(255),
    ptrfilial int,
    ptrestado ENUM('Novo', 'Usado', 'Danificado'),
    PRIMARY KEY (idpatrimonio),
    FOREIGN KEY(ptrfilial) REFERENCES filil(idfilial)
);


