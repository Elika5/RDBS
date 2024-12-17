-- zkouška příkazů pro to co má povolené uživatel Juli
select * from rody;
drop table rody;

INSERT INTO Zvirata (id_dru, jmeno, datum_narozeni, id_poh, id_zam_chov,prichod_do_zoo) 
VALUES (16, 'Jitka', '2014-03-15',2,8,'2022-02-13');

insert into Rody (nazev) value ('křeček');