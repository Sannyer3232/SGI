
drop procedure sp_membro_por_id;
select *from membro;
call sp_membro_por_id(15);

use bdsgi;
DELIMITER //
CREATE PROCEDURE sp_membro_por_id(p_membroid INT)
BEGIN
    SELECT
        m.mbrid,
        sednome,
        m.mbrnome,
        m.mbrcpf,
        sup.mbrnome,
        m.mbrnumero_identidade,
        m.mbremail,
        m.mbrsenha,
        m.mbrtelefone,
        m.mbrata_nascimento,
        estdescricao,
       SUBSTRING_INDEX(m.mbrfoto, '\\', -1) AS nome_arquivo,
        m.mbrativo,
        m.mbracesso,
        e.endrua,
        e.endnumero,
        e.endbairro,
        e.endcep,
        e.endcidade,
        e.endestado,
        
        CASE
            WHEN p.idpastor IS NOT NULL THEN 'Pastor'
            WHEN pr.idpresbitero IS NOT NULL THEN 'Presbítero'
            WHEN s.idsecretaria IS NOT NULL THEN 'Secretaria'
            WHEN d.iddiacono IS NOT NULL THEN 'Diácono'
            WHEN pt.idporteiro IS NOT NULL THEN 'Porteiro'
            WHEN msc.idmusico IS NOT NULL THEN 'Músico'
            WHEN cl.idcoral IS NOT NULL THEN 'Coral de Louvor'
            WHEN oi.idoracao IS NOT NULL THEN 'Oracao e Intercessão'
            WHEN sn.idsonoplastia IS NOT NULL THEN 'Sonoplastia'
            ELSE 'Comum'
        END AS cargo,
        m.mbrsuperior
    FROM
        membro m
	INNER JOIN
		sedetemplo ON m.mbrsedeid = sedid
	INNER JOIN
		estadocivil on m.mbrcivilid = estid
	LEFT JOIN
		membro sup ON m.mbrsuperior = sup.mbrid
    LEFT JOIN
        endereco e ON m.mbrid = e.endmbrid
    LEFT JOIN
        pastor p ON m.mbrid = p.idpastor
    LEFT JOIN
        presbitero pr ON m.mbrid = pr.idpresbitero
    LEFT JOIN
        secretaria s ON m.mbrid = s.idsecretaria
    LEFT JOIN
        diacono d ON m.mbrid = d.iddiacono
    LEFT JOIN
        porteiro pt ON m.mbrid = pt.idporteiro
    LEFT JOIN
        musico msc ON m.mbrid = msc.idmusico
    LEFT JOIN
        corallouvor cl ON m.mbrid = cl.idcoral
    LEFT JOIN
        orcacaointercessao oi ON m.mbrid = oi.idoracao
    LEFT JOIN
        sonoplastia sn ON m.mbrid = sn.idsonoplastia,
	m.mbrfilid
	WHERE m.mbrid = p_membroid;
END//

DELIMITER ;
drop procedure sp_membro_por_id;
call sp_membro_por_id(22);

call sp_membro_e_cargo();
## lISTAGEM DE DADOS DE TODOS OS MEBROS
DELIMITER //

CREATE PROCEDURE sp_membro_e_cargo()
BEGIN
    SELECT
        m.mbrid,
        sednome,
        m.mbrnome,
        m.mbrcpf,
        sup.mbrnome,
        m.mbrnumero_identidade,
        m.mbremail,
        m.mbrsenha,
        m.mbrtelefone,
        m.mbrata_nascimento,
        estdescricao,
        SUBSTRING_INDEX(m.mbrfoto, '\\', -1) AS nome_arquivo,
        m.mbrativo,
        m.mbracesso,
        e.endrua,
        e.endnumero,
        e.endbairro,
        e.endcep,
        e.endcidade,
        e.endestado,
        
        
        CASE
            WHEN p.idpastor IS NOT NULL THEN 'Pastor'
            WHEN pr.idpresbitero IS NOT NULL THEN 'Presbítero'
            WHEN s.idsecretaria IS NOT NULL THEN 'Secretaria'
            WHEN d.iddiacono IS NOT NULL THEN 'Diácono'
            WHEN pt.idporteiro IS NOT NULL THEN 'Porteiro'
            WHEN msc.idmusico IS NOT NULL THEN 'Músico'
            WHEN cl.idcoral IS NOT NULL THEN 'Coral de Louvor'
            WHEN oi.idoracao IS NOT NULL THEN 'Oracao e Intercessão'
            WHEN sn.idsonoplastia IS NOT NULL THEN 'Sonoplastia'
            ELSE 'Comum'
        END AS cargo,
	m.mbrsuperior
   FROM
        membro m
	INNER JOIN
		sedetemplo ON m.mbrsedeid = sedid
	INNER JOIN
		estadocivil on m.mbrcivilid = estid
	LEFT JOIN
		membro sup ON m.mbrsuperior = sup.mbrid
    LEFT JOIN
        endereco e ON m.mbrid = e.endmbrid
    LEFT JOIN
        pastor p ON m.mbrid = p.idpastor
    LEFT JOIN
        presbitero pr ON m.mbrid = pr.idpresbitero
    LEFT JOIN
        secretaria s ON m.mbrid = s.idsecretaria
    LEFT JOIN
        diacono d ON m.mbrid = d.iddiacono
    LEFT JOIN
        porteiro pt ON m.mbrid = pt.idporteiro
    LEFT JOIN
        musico msc ON m.mbrid = msc.idmusico
    LEFT JOIN
        corallouvor cl ON m.mbrid = cl.idcoral
    LEFT JOIN
        orcacaointercessao oi ON m.mbrid = oi.idoracao
    LEFT JOIN
        sonoplastia sn ON m.mbrid = sn.idsonoplastia;
END//

DELIMITER ;
call sp_membro_e_cargo();

##CADASTRO DE MEBROS
select*from membro;
DELIMITER //

CREATE PROCEDURE sp_membro_endereco(
										p_mbrsedeid INT,
										p_mbrnome VARCHAR(255),
										p_mbrcpf VARCHAR(20),
										p_mbrsuperior INT,
										p_mbrnumero_identidade VARCHAR(20),
										p_mbremail VARCHAR(30),
										p_mbrsenha VARCHAR(32),
										p_mbrtelefone VARCHAR(20),
										p_mbrata_nascimento DATE,
										p_mbrcivilid INT,
										p_mbrfoto varchar(255),
										p_mbrativo boolean,
										p_mbracesso ENUM('Administrador','Usuario'),
										p_endrua VARCHAR(100),
										p_endnumero VARCHAR(11),
										p_endbairro VARCHAR(100),
										p_endcep VARCHAR(10),
										p_endcidade VARCHAR(50),
										p_endestado VARCHAR(50),
                                        p_cargoSelecao INT,
                                        p_filial int)
BEGIN
	DECLARE mbr_id INT;
    
    IF p_mbrsuperior = 0 THEN
     INSERT INTO membro (
        mbrsedeid, mbrnome, mbrcpf, mbrsuperior,
        mbrnumero_identidade, mbremail, mbrsenha,
        mbrtelefone, mbrata_nascimento, mbrcivilid,
        mbrfoto, mbrativo, mbracesso, mbrfilid
		)VALUES(p_mbrsedeid, p_mbrnome,  p_mbrcpf, NULL, p_mbrnumero_identidade, 
				p_mbremail, p_mbrsenha, p_mbrtelefone, p_mbrata_nascimento, p_mbrcivilid,
                p_mbrfoto, p_mbrativo, p_mbracesso,p_filial);
	ELSE
     INSERT INTO membro (
        mbrsedeid, mbrnome, mbrcpf, mbrsuperior,
        mbrnumero_identidade, mbremail, mbrsenha,
        mbrtelefone, mbrata_nascimento, mbrcivilid,
        mbrfoto, mbrativo, mbracesso, mbrfilid
		)VALUES(p_mbrsedeid, p_mbrnome,  p_mbrcpf, p_mbrsuperior, p_mbrnumero_identidade, 
				p_mbremail, p_mbrsenha, p_mbrtelefone, p_mbrata_nascimento, p_mbrcivilid,
                p_mbrfoto, p_mbrativo, p_mbracesso,p_filial);
		END IF;
		SET mbr_id = LAST_INSERT_ID();
        
        INSERT INTO endereco (
        endmbrid, endrua, endnumero, endbairro,
        endcep, endcidade, endestado
    ) VALUES (mbr_id, p_endrua, p_endnumero, p_endbairro,
				p_endcep, p_endcidade, p_endestado);
                
	CALL sp_escolhe_cargo(mbr_id, p_cargoSelecao);
END//

DELIMITER ;


##LISTAR ANIVERSARIANTES
DELIMITER ##

CREATE PROCEDURE sp_aniversariantes(p_mes INT)
BEGIN
	SELECT id_Membro,mbrmemnome, SUBSTRING_INDEX(mbrfoto, '\\', -1) AS nome_arquivo, mbrativo, mbrata_nascimento FROM membro 
    WHERE MONTH(mbrata_nascimento)=p_mes AND mbrativo = '1';
END ##
DELIMITER ;	


##DEFINIR CARGO

DELIMITER //

CREATE PROCEDURE sp_escolhe_cargo(
    IN p_mbr_id INT,
    IN p_cargoSelecao INT
)
BEGIN
    DECLARE cargo_id INT;

    IF p_cargoSelecao = 1 THEN
        INSERT INTO pastor (idpastor) VALUES (p_mbr_id);
    ELSEIF p_cargoSelecao = 2 THEN
        INSERT INTO presbitero (idpresbitero) VALUES (p_mbr_id);
    ELSEIF p_cargoSelecao = 3 THEN
        INSERT INTO secretaria (idsecretaria) VALUES (p_mbr_id);
    ELSEIF p_cargoSelecao = 4 THEN
        INSERT INTO diacono (iddiacono) VALUES (p_mbr_id);
    ELSEIF p_cargoSelecao = 5 THEN
        INSERT INTO porteiro (idporteiro) VALUES (p_mbr_id);
    ELSEIF p_cargoSelecao = 6 THEN
        INSERT INTO musico (idmusico) VALUES (p_mbr_id);
    ELSEIF p_cargoSelecao = 7 THEN
        INSERT INTO corallouvor (idcoral) VALUES (p_mbr_id);
    ELSEIF p_cargoSelecao = 8 THEN
        INSERT INTO orcacaointercessao (idoracao) VALUES (p_mbr_id);
    ELSEIF p_cargoSelecao = 9 THEN
        INSERT INTO sonoplastia (idsonoplastia) VALUES (p_mbr_id);
    ELSE
        SET cargo_id = NULL;
    END IF;

END//

DELIMITER ;

## PUXAR DADOS PELO NOME

call sp_membro_dados_nome("edu", 1);

DELIMITER //

CREATE PROCEDURE sp_membro_dados_nome(p_nome VARCHAR(255), p_status Int)
BEGIN
    DECLARE v_achou_membro INT DEFAULT 0;
    SET v_achou_membro = (SELECT COUNT(*) FROM membro WHERE mbrnome LIKE CONCAT('%', p_nome, '%'));
    
    IF v_achou_membro <> 0 THEN 
        SELECT
            m.mbrid,
            m.mbrnome,
            m.mbrcpf,
            m.mbremail,
            sednome,
            sup.mbrnome,
            CASE
                WHEN p.idpastor IS NOT NULL THEN 'Pastor'
                WHEN pr.idpresbitero IS NOT NULL THEN 'Presbítero'
                WHEN s.idsecretaria IS NOT NULL THEN 'Secretaria'
                WHEN d.iddiacono IS NOT NULL THEN 'Diácono'
                WHEN pt.idporteiro IS NOT NULL THEN 'Porteiro'
                WHEN msc.idmusico IS NOT NULL THEN 'Músico'
                WHEN cl.idcoral IS NOT NULL THEN 'Coral de Louvor'
                WHEN oi.idoracao IS NOT NULL THEN 'Oração e Intercessão'
                WHEN sn.idsonoplastia IS NOT NULL THEN 'Sonoplastia'
                ELSE 'Comum'
            END AS cargo,
		filnome
        FROM
            membro m
        INNER JOIN
            sedetemplo ON m.mbrsedeid = sedid
        INNER JOIN
            estadocivil ON m.mbrcivilid = estid
        LEFT JOIN
            membro sup ON m.mbrsuperior = sup.mbrid
        LEFT JOIN
            endereco e ON m.mbrid = e.endmbrid
        LEFT JOIN
            pastor p ON m.mbrid = p.idpastor
        LEFT JOIN
            presbitero pr ON m.mbrid = pr.idpresbitero
        LEFT JOIN
            secretaria s ON m.mbrid = s.idsecretaria
        LEFT JOIN
            diacono d ON m.mbrid = d.iddiacono
        LEFT JOIN
            porteiro pt ON m.mbrid = pt.idporteiro
        LEFT JOIN
            musico msc ON m.mbrid = msc.idmusico
        LEFT JOIN
            corallouvor cl ON m.mbrid = cl.idcoral
        LEFT JOIN
            orcacaointercessao oi ON m.mbrid = oi.idoracao
        LEFT JOIN
            sonoplastia sn ON m.mbrid = sn.idsonoplastia
		inner join filial on m.mbrfilid = idfilial
        WHERE
            m.mbrnome LIKE CONCAT('%', p_nome, '%') And m.mbrativo = p_status;
    ELSE
        SELECT 'SEM MEMBROS' AS RESPOSTA;
    END IF;
END//

DELIMITER ;

desc membro;
delimiter //

create procedure sp_desativar_membro(p_mbrid int)

begin

	declare v_achou_membro boolean default false;
    set v_achou_membro = (select count(*) from membro where mbrid=p_mbrid);
    
    if v_achou_membro then
		update membro set mbrativo = 0 where mbrid = p_mbrid;
	else
		select 'Membro não encontrado' as resposta;
	end if;

end//

delimiter ;

call sp_desativar_membro(15);
desc contasapagar;
use bdsgi;
CALL sp_membro_dados_nome('Sannyer', 1);

drop procedure sp_atualizar_membro;
DELIMITER //

CREATE PROCEDURE sp_atualizar_membro(
    IN p_mbrid INT,
    IN p_mbrsedeid INT,
    IN p_mbrnome VARCHAR(255),
    IN p_mbrcpf VARCHAR(20),
    IN p_mbrsuperior INT,
    IN p_mbrnumero_identidade VARCHAR(20),
    IN p_mbremail VARCHAR(30),
    IN p_mbrtelefone VARCHAR(20),
    IN p_mbrata_nascimento DATE,
    IN p_mbrcivilid INT,
    IN p_mbrativo BOOLEAN,
    IN p_mbracesso ENUM('Administrador', 'Usuario'),
    IN p_endrua VARCHAR(100),
    IN p_endnumero VARCHAR(11),
    IN p_endbairro VARCHAR(100),
    IN p_endcep VARCHAR(10),
    IN p_endcidade VARCHAR(50),
    IN p_endestado VARCHAR(50),
    IN p_cargoSelecao INT
)
BEGIN
    DECLARE mbr_id INT;

    -- Atualiza os dados do membro
    UPDATE membro
    SET
        mbrsedeid = p_mbrsedeid,
        mbrnome = p_mbrnome,
        mbrcpf = p_mbrcpf,
        mbrsuperior = CASE WHEN p_mbrsuperior = 0 THEN NULL ELSE p_mbrsuperior END,
        mbrnumero_identidade = p_mbrnumero_identidade,
        mbremail = p_mbremail,
        mbrtelefone = p_mbrtelefone,
        mbrata_nascimento = p_mbrata_nascimento,
        mbrcivilid = p_mbrcivilid,
        mbrativo = p_mbrativo,
        mbracesso = p_mbracesso
    WHERE mbrid = p_mbrid;

    -- Atualiza o endereço do membro
    UPDATE endereco
    SET
        endrua = p_endrua,
        endnumero = p_endnumero,
        endbairro = p_endbairro,
        endcep = p_endcep,
        endcidade = p_endcidade,
        endestado = p_endestado
    WHERE endmbrid = p_mbrid;

    -- Remove o membro do cargo atual
    CALL sp_remove_membro_cargo(p_mbrid);

    -- Chama a procedure para escolher o novo cargo do membro
    CALL sp_escolhe_cargo(p_mbrid, p_cargoSelecao);
END//

DELIMITER ;


DELIMITER //

CREATE PROCEDURE sp_remove_membro_cargo(
    IN p_mbr_id INT
)
BEGIN
    DECLARE cargo_id INT;

    -- Verifica se o membro está em algum cargo e obtém o cargo_id
    SELECT
        CASE
            WHEN EXISTS (SELECT 1 FROM pastor WHERE idpastor = p_mbr_id) THEN 1
            WHEN EXISTS (SELECT 1 FROM presbitero WHERE idpresbitero = p_mbr_id) THEN 2
            WHEN EXISTS (SELECT 1 FROM secretaria WHERE idsecretaria = p_mbr_id) THEN 3
            WHEN EXISTS (SELECT 1 FROM diacono WHERE iddiacono = p_mbr_id) THEN 4
            WHEN EXISTS (SELECT 1 FROM porteiro WHERE idporteiro = p_mbr_id) THEN 5
            WHEN EXISTS (SELECT 1 FROM musico WHERE idmusico = p_mbr_id) THEN 6
            WHEN EXISTS (SELECT 1 FROM corallouvor WHERE idcoral = p_mbr_id) THEN 7
            WHEN EXISTS (SELECT 1 FROM orcacaointercessao WHERE idoracao = p_mbr_id) THEN 8
            WHEN EXISTS (SELECT 1 FROM sonoplastia WHERE idsonoplastia = p_mbr_id) THEN 9
            ELSE NULL
        END INTO cargo_id;

    -- Remove o membro do cargo
    CASE cargo_id
        WHEN 1 THEN
            DELETE FROM pastor WHERE idpastor = p_mbr_id;
        WHEN 2 THEN
            DELETE FROM presbitero WHERE idpresbitero = p_mbr_id;
        WHEN 3 THEN
            DELETE FROM secretaria WHERE idsecretaria = p_mbr_id;
        WHEN 4 THEN
            DELETE FROM diacono WHERE iddiacono = p_mbr_id;
        WHEN 5 THEN
            DELETE FROM porteiro WHERE idporteiro = p_mbr_id;
        WHEN 6 THEN
            DELETE FROM musico WHERE idmusico = p_mbr_id;
        WHEN 7 THEN
            DELETE FROM corallouvor WHERE idcoral = p_mbr_id;
        WHEN 8 THEN
            DELETE FROM orcacaointercessao WHERE idoracao = p_mbr_id;
        WHEN 9 THEN
            DELETE FROM sonoplastia WHERE idsonoplastia = p_mbr_id;
        ELSE
        SELECT 'NENHUM CARGO ENCONTRADO' AS RESPOSTA;

    END CASE;
END//

DELIMITER ;

call sp_membro_por_id(15);
call sp_atualizar_membro(15, '1','Sannyer Cardoso Carvalho','12345678945','14','45612312','sannyer@gmail.com','45789456123','1999-11-15','1',
							'1','Administrador'
                            ,'235','26','Cidade Nova','69096800','Manaus','Amazonas','10');




DELIMITER //

CREATE PROCEDURE sp_inserir_tarefa(p_trftitulo VARCHAR(255),
									p_trffilial INT,
									p_trfdescricao VARCHAR(255),
                                    p_trfmbrid INT,
                                    p_trfdata DATE,
                                    p_trfhora TIME,
                                    p_trfstatus ENUM('Agendado','Concluido','Cancelado'))
BEGIN

	INSERT INTO tarefa(trftitulo, trffilial, trfdescricao, trfmbrid, trfdata, trfhora, trfstatus)
	VALUES (p_trftitulo, p_trffilial, p_trfdescricao, p_trfmbrid, p_trfdata, p_trfhora, p_trfstatus);

END//

DELIMITER ;

drop procedure sp_inserir_tarefa;

select * from tarefa;

desc membro;
SELECT trftitulo, filnome, trfdescricao, mbrnome, trfdata, trfhora, trfstatus
from tarefa inner join filial on trffilial = idfilial
inner join membro on trfmbrid = mbrid where trfstatus not in ('Concluido', 'Cancelado');

delimiter // 

create procedure sp_listar_tarefa()

begin
SELECT trftitulo, filnome, trfdescricao,  CONCAT(SUBSTRING(mbrnome, 1, LOCATE(' ', mbrnome) - 1), ' ',
    SUBSTRING(mbrnome, LOCATE(' ', mbrnome) + 1, LOCATE(' ', mbrnome, LOCATE(' ', mbrnome) + 1) - LOCATE(' ', mbrnome) - 1)) AS NOME, trfdata, trfhora, trfstatus, trfid
from tarefa inner join filial on trffilial = idfilial
inner join membro on trfmbrid = mbrid where trfstatus not in ('Concluido', 'Cancelado');
end//

delimiter ;
DROP PROCEDURE sp_listar_tarefa;

SELECT 
    SUBSTRING(mbrnome, 1, LOCATE(' ', mbrnome) - 1) AS primeiro_nome,
    SUBSTRING(mbrnome, LOCATE(' ', mbrnome) + 1) AS segundo_nome
FROM membro
WHERE mbrid = 15;

SELECT 
    CONCAT(SUBSTRING(mbrnome, 1, LOCATE(' ', mbrnome) - 1), ' ',
    SUBSTRING(mbrnome, LOCATE(' ', mbrnome) + 1, LOCATE(' ', mbrnome, LOCATE(' ', mbrnome) + 1) - LOCATE(' ', mbrnome) - 1)) AS NOME
FROM membro
WHERE mbrid = 15;



call sp_listar_tarefa();

delimiter //
create procedure sp_listar_tarefa_cancelada()

begin
SELECT trftitulo, filnome, trfdescricao, CONCAT(SUBSTRING(mbrnome, 1, LOCATE(' ', mbrnome) - 1), ' ',
    SUBSTRING(mbrnome, LOCATE(' ', mbrnome) + 1, LOCATE(' ', mbrnome, LOCATE(' ', mbrnome) + 1) - LOCATE(' ', mbrnome) - 1)) AS NOME, trfdata, trfhora, trfstatus, trfid
from tarefa inner join filial on trffilial = idfilial
inner join membro on trfmbrid = mbrid where trfstatus= 'Cancelado';
end//

delimiter ;


delimiter //
create procedure sp_listar_tarefa_concluido()

begin
SELECT trftitulo, filnome, trfdescricao, CONCAT(SUBSTRING(mbrnome, 1, LOCATE(' ', mbrnome) - 1), ' ',
    SUBSTRING(mbrnome, LOCATE(' ', mbrnome) + 1, LOCATE(' ', mbrnome, LOCATE(' ', mbrnome) + 1) - LOCATE(' ', mbrnome) - 1)) AS NOME, trfdata, trfhora, trfstatus, trfid
from tarefa inner join filial on trffilial = idfilial
inner join membro on trfmbrid = mbrid where trfstatus= 'Concluido';
end//

delimiter ;



delimiter // 

create procedure sp_listar_tarefa_por_id(p_tarefaid int)

begin
SELECT trfid, trftitulo, filnome, trfdescricao, trfmbrid, trfdata, trfhora, trfstatus
from tarefa inner join filial on trffilial = idfilial
inner join membro on trfmbrid = mbrid where trfstatus not in ('Concluido', 'Cancelado') and trfid = p_tarefaid ;
end//

delimiter ;	

desc tarefa;

call sp_listar_tarefa();
drop procedure sp_listar_tarefa_por_id;
call sp_listar_tarefa_por_id(4);

select*from Membro;


delimiter //

create procedure sp_editar_tarefa(p_trfid int,
									p_trftitulo VARCHAR(255),
									p_trffilial INT,
									p_trfdescricao VARCHAR(255),
                                    p_trfmbrid INT,
                                    p_trfdata DATE,
                                    p_trfhora TIME,
                                    p_trfstatus ENUM('Agendado','Concluido','Cancelado'))
BEGIN

	declare v_achou_tarefa boolean default false;
    set v_achou_tarefa = (select count(*) from tarefa where trfid = p_trfid);
    
    if v_achou_tarefa then
		update tarefa set	trftitulo = p_trftitulo,
							trffilial = p_trffilial,
                            trfdescricao = p_trfdescricao,
                            trfmbrid = p_trfmbrid,
                            trfdata = p_trfdata,
                            trfhora = p_trfhora,
                            trfstatus = p_trfstatus
		where trfid = p_trfid ;
	else	
		select 'ID de tarefa invalida' as resposta;
	end if;
                            
        
	

END//

delimiter ;
select * from tarefa;
call sp_membro_por_id(25);


call sp_editar_tarefa(4, 'Compra de Matrial de Limpeza',2, 'Necessário a compra de material de limpeza ',
						15, '2024-03-23', '23:00:00','Agendado');
desc tarefa;
use bdsgi;
select * from membro;
select * from membro where mbrnome = 'admin';
update membro set mbrnome = 'admins admins admins' where mbrid = 14;


desc dizimosofertas;
delimiter //

	create procedure novo_dizomo_oferta(p_membro int,
										p_tipo varchar(50),
										p_valor decimal(10,2),
                                        p_data date)
                                        
	begin
		
        declare v_existe_membro boolean default false;
        
        set v_existe_membro = (select count(*) from membro where mbrid = p_membro);
        
        if v_existe_membro then
			
				insert dizimosofertas(dzomembroid, dzotipo, dzovalor, dzodtcontribuicao)
                values(p_membro, p_tipo, p_valor, p_data);
		else	
			select 'Não existe membro com essa ID';
		end if;
        
    end//

delimiter ;
drop procedure novo_dizomo_oferta;
call novo_dizomo_oferta(15, 'Dizimo', '150.00','2024-07-21');

select * from dizimosofertas;

select *from membro;


DELIMITER //

CREATE FUNCTION f_achou_membro(p_membro INT)
RETURNS TINYINT(1)
READS SQL DATA
BEGIN
    DECLARE v_achou_membro TINYINT(1) DEFAULT 0;
    
    SELECT COUNT(*)
    INTO v_achou_membro
    FROM membro
    WHERE mbrid = p_membro;
    
    IF v_achou_membro > 0 THEN
        RETURN TRUE;
    ELSE    
        RETURN FALSE;
    END IF;
END //

DELIMITER 

SELECT f_achou_membro(15);
