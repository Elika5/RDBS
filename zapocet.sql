-- SELECT 4x --

-- počet průměrných záznamů v tabulce
select 'Průměr' AS popis, round(AVG(table_rows),0) AS prumerny_pocet_zaznamu
FROM information_schema.tables
WHERE table_schema = 'zoo'
UNION ALL
SELECT table_name, table_rows AS pocet_zaznamu
FROM information_schema.tables
WHERE table_schema = 'zoo';
    
-- vnořený select, zobrazí ty zvířata, u kterých je zadaný chovatel
SELECT jmeno, id_zvi
FROM Zvirata
WHERE id_zam_chov IN (
    SELECT id_zam
    FROM Zamestnanci
    WHERE prijmeni = 'Černý'
)
LIMIT 0, 1000;

-- přidán druh a rod zvířete, bez id
SELECT d.druh AS druh, r.rod AS rod, z.jmeno AS zvire
FROM zvirata z
INNER JOIN druhy d ON z.id_dru = d.id_dru
LEFT JOIN rody r ON d.id_rod = r.id_rod
INNER JOIN 
    (   SELECT id_zvi
        FROM zvirata
        WHERE id_zam_chov IN (
                SELECT id_zam
                FROM Zamestnanci
                WHERE prijmeni = 'Černý'
            )
    ) chovani ON z.id_zvi = chovani.id_zvi
ORDER BY z.jmeno;

-- select s analytickou funkci a group by, ukáže ty zvířata, kterých je počet větší, jak 5 (u rod)
SELECT r.rod AS rod, COUNT(z.id_zvi) AS pocet_zvirat
FROM zvirata z
INNER JOIN druhy d ON z.id_dru = d.id_dru
INNER JOIN rody r ON d.id_rod = r.id_rod
GROUP BY r.rod
HAVING COUNT(z.id_zvi) > 5
ORDER BY pocet_zvirat DESC;



select * from kategorie;
-- rekurze, na vytvořené tabulce kategorie
WITH RECURSIVE HierarchieKategorii AS (
    SELECT id_kategorie, nazev_kategorie, nadrazena_id
    FROM Kategorie
    WHERE nazev_kategorie = 'Elektronika'

    UNION ALL

    SELECT k.id_kategorie, k.nazev_kategorie, k.nadrazena_id
    FROM Kategorie k
    INNER JOIN HierarchieKategorii hk ON k.nadrazena_id = hk.id_kategorie
)
SELECT * FROM HierarchieKategorii;

-- rekurze, ale má to název i té nadkategorie, ne jen číslo
WITH RECURSIVE HierarchieKategorii AS (
    -- Základní případ: Kořenová kategorie
    SELECT id_kategorie, nazev_kategorie, nadrazena_id, CAST(NULL AS CHAR(100)) AS nadrazena_nazev
    FROM Kategorie
    WHERE nazev_kategorie = 'Elektronika'

    UNION ALL

    -- Rekurzivní případ: Podřízené kategorie
    SELECT k.id_kategorie, k.nazev_kategorie, k.nadrazena_id, hk.nazev_kategorie AS nadrazena_nazev
    FROM Kategorie k
    INNER JOIN HierarchieKategorii hk ON k.nadrazena_id = hk.id_kategorie
)
SELECT id_kategorie, nazev_kategorie, nadrazena_id, nadrazena_nazev 
FROM HierarchieKategorii;


-- VIEW -- (vííí), zobrazí celkový přehled u zvířete
CREATE VIEW Zvirata_Info AS
SELECT z.id_zvi, z.jmeno AS zvire_jmeno, z.datum_narozeni, d.druh, r.rod, p.pohlavi,
    zam.jmeno AS zam_jmeno, zam.prijmeni AS zam_prijmeni
FROM Zvirata z
INNER JOIN Druhy d ON z.id_dru = d.id_dru
LEFT JOIN Rody r ON d.id_rod = r.id_rod
LEFT JOIN Pohlavi p ON z.id_poh = p.id_poh
LEFT JOIN Zamestnanci zam ON z.id_zam_chov = zam.id_zam;

select * from Zvirata_Info;


-- index --, vyhledávaní u popisu u výběhu
CREATE FULLTEXT INDEX index_popis ON Vybehy(popis);

SELECT * FROM Vybehy
WHERE MATCH (popis) AGAINST ('vodní*' in boolean mode);


-- function -- počet zvířat starších x
DELIMITER //
CREATE FUNCTION PocetStarychZvirat(věk INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE pocet INT;
    SELECT COUNT(*) INTO pocet 
    FROM Zvirata 
    WHERE YEAR(CURDATE()) - YEAR(datum_narozeni) > věk;
    RETURN pocet;
END //
DELIMITER ;

select PocetStarychZvirat(15); -- vyzkoušení funkce


-- procedure -- + -- transaction --, maže pokud existuje, jinak vytváří tabulku velkevybehy a vkládá do ní výběhy podle zadané rozlohy
DELIMITER $$

CREATE PROCEDURE GenerujVelkeVybehy1(IN min_vel INT)
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE vybeh_nazev VARCHAR(255);

    -- Deklarace kurzoru pro výběr výběhů větších než zadano
    DECLARE cur CURSOR FOR 
    SELECT nazev FROM Vybehy WHERE velikost > min_vel;

    -- Deklarace handleru pro SQL chyby
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Vracení transakce při chybě
        ROLLBACK;
        -- Zobrazíme zprávu o chybě
        SELECT 'Došlo k chybě při vkládání do tabulky VelkeVybehy. Transakce byla zrušena.' AS Chybova_zprava;
    END;

    -- Handler pro konec kurzoru
     DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Smazání tabulky, pokud existuje, a její opětovné vytvoření
    DROP TABLE IF EXISTS VelkeVybehy;

    -- Vytvoření nové tabulky VelkeVybehy
    CREATE TABLE VelkeVybehy (
		id INT AUTO_INCREMENT PRIMARY KEY,
        nazev VARCHAR(255) NOT NULL
    );

    -- Zahájení transakce
    START TRANSACTION;

    -- Otevření kurzoru
    OPEN cur;

    -- Smyčka pro iteraci přes kurzor
    vybehy_loop: LOOP
        -- Načtení dat z kurzoru
        FETCH cur INTO vybeh_nazev;

        -- Ukončení smyčky, pokud nejsou žádná data
        IF done THEN
            LEAVE vybehy_loop;
        END IF;

        -- Pokus o vložení názvu výběhu do tabulky VelkeVybehy
        INSERT INTO VelkeVybehy (nazev) VALUES (vybeh_nazev);
    END LOOP vybehy_loop;

    -- Zavření kurzoru
    CLOSE cur;

    -- Commit transakce při úspěšném dokončení
    COMMIT;

END $$

DELIMITER ;


-- testovací
drop table VelkeVybehy;
CREATE TABLE VelkeVybehy (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nazev VARCHAR(255)
);

-- zavolání procedury a pak zobrazení tabulky
call GenerujVelkeVybehy1(2000);
select * from velkevybehy;

-- smazání procedury
drop procedure GenerujVelkeVybehy;

-- trigger --
-- tabulka, do které se přidávají záznamy od triggeru
CREATE TABLE Log_Zvirata (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    datum_cas DATETIME NOT NULL,
    uzivatel VARCHAR(255) NOT NULL,
    akce ENUM('INSERT') NOT NULL,
    id_zvi INT NOT NULL,
    nove_jmeno VARCHAR(255),
    novy_datum_narozeni DATE
);

-- trigger, co zaznamenává přidání záznamu do tabulky zvirata a ukazuje, kdo, kdy, co 
DELIMITER $$

CREATE TRIGGER tr_LogZvirata_Insert
AFTER INSERT ON Zvirata
FOR EACH ROW
BEGIN
    INSERT INTO Log_Zvirata (
        datum_cas, 
        uzivatel, 
        akce, 
        id_zvi, 
        nove_jmeno, 
        novy_datum_narozeni
    ) 
    VALUES (
        NOW(),      -- Datum a čas vložení
        USER(),     -- Uživatelské jméno, které provedlo vložení
        'INSERT',   -- Typ akce
        NEW.id_zvi, -- ID nového záznamu
        NEW.jmeno,  -- Nové jméno zvířete
        NEW.datum_narozeni -- Nové datum narození
    );
END $$

DELIMITER ;

-- testovací
INSERT INTO Zvirata (id_dru, jmeno, datum_narozeni, id_poh, id_zam_chov,prichod_do_zoo) 
VALUES (2, 'Bobek', '2022-12-15',1,8,'2024-09-15');

-- zobrazení výsledku
select * from Log_zvirata;



-- user --
-- vytvoření
CREATE USER 'Juli'@'%' IDENTIFIED BY 'heslo';
-- práva
GRANT SELECT ON zoo.* TO 'Juli'@'%';
GRANT insert ON zoo.zvirata TO 'Juli'@'%';
-- přidělení práv
FLUSH PRIVILEGES;
-- odstranění uživatele
DROP USER 'Juli'@'%';
-- odebrání privilegií
REVOKE SELECT ON zoo.* FROM 'Juli'@'%';
GRANT SELECT ON zoo.zvirata TO 'Juli'@'%';

-- role
CREATE ROLE 'spravce_vybehu';
GRANT SELECT, INSERT, UPDATE ON zoo.vybehy TO 'spravce_vybehu';
GRANT SELECT, INSERT, UPDATE ON zoo.zvi_vyb TO 'spravce_vybehu';

-- přidělení role
CREATE USER 'Beky'@'%' IDENTIFIED BY 'ahoj';
GRANT 'spravce_vybehu' TO 'Beky'@'%';
SET DEFAULT ROLE 'spravce_vybehu' TO 'Beky'@'%';

FLUSH PRIVILEGES;
-- odebrání role
REVOKE 'spravce_vybehu' FROM 'Beky'@'%';

-- smazání role
DROP ROLE 'spravce_vybehu';
drop user 'Beky'@'%';

select * from zamestnanci;
drop user 'Beky'@'%';


-- lock --
LOCK TABLES Zvirata WRITE; -- ostatní nemužou provádět nic s tabulkou Zvirata

select * from Zvirata;

LOCK TABLES Zamestnanci READ; -- nemůžou zapisovat, ale můžou si ji zobrazit

select * from Zvirata;

-- odemknout vše
UNLOCK TABLES;

SET autocommit = 0;

START TRANSACTION;
SELECT * FROM Zamestnanci WHERE id_zam = 1 FOR UPDATE; -- uzamkne jen zaznamy, kde je id_zam 1
COMMIT;

SELECT * FROM performance_schema.data_locks;





