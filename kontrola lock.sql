-- příkazy pro kontrolu locků
select * from Zvirata;

select * from zamestnanci;
INSERT INTO Zamestnanci (jmeno, prijmeni, email, telefon, datum_narozeni, bankovni_ucet, id_poz)
VALUES ('Jan', 'Novák', 'jan.novak@example.com', '123456789', '1985-06-15', 'CZ1234567890123456', 1);

UPDATE Zamestnanci SET telefon = '980784321' WHERE id_zam = 1;
