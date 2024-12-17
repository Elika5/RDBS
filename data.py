from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

# Připojení k databázi 
DATABASE_URL = "mysql+pymysql://root:12345@localhost/zoo"

# Vytvoření engine a session
engine = create_engine(DATABASE_URL)
Session = sessionmaker(bind=engine)
session = Session()

#zjištění, jestli je databáze připojena
try:
    connection = engine.connect()
    print("Připojení k databázi bylo úspěšné!")
    connection.close()
except Exception as e:
    print(f"Chyba při připojení: {e}")

# Zobrazení tabulek v databázi
from sqlalchemy import MetaData

metadata = MetaData()
metadata.reflect(bind=engine)

print("Tabulky v databázi:")
for table in metadata.tables.keys():
    print(table)


from sqlalchemy.sql import text

# Dotaz na všechna zvířata
try:
    zvirata = session.execute(text("SELECT * FROM zvirata")).fetchall()
    if zvirata:
        print(f"Tabulka 'zvirata' obsahuje {len(zvirata)} záznamů.")
    else:
        print("Tabulka 'zvirata' je prázdná.")
except Exception as e:
    print(f"Chyba při dotazu: {e}")



from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, DateTime, ForeignKey
from sqlalchemy import create_engine
from sqlalchemy.orm import relationship, sessionmaker


#vytvoření modelů tabulek
Base = declarative_base()

class Pohlavi(Base):
    __tablename__ = 'pohlavi'

    id_poh = Column(Integer, primary_key=True, autoincrement=True)
    pohlavi = Column(String(10), nullable=False)

    zvirata = relationship("Zvire", back_populates="pohlavi")

class Rod(Base):
    __tablename__ = 'rody'

    id_rod = Column(Integer, primary_key=True, autoincrement=True)
    rod = Column(String(15), nullable=False)

    druhy = relationship("Druh", back_populates="rod")

class Druh(Base):
    __tablename__ = 'druhy'

    id_dru = Column(Integer, primary_key=True, autoincrement=True)
    id_rod = Column(Integer, ForeignKey('rody.id_rod'), nullable=False)
    druh = Column(String(20), nullable=False)

    rod = relationship("Rod", back_populates="druhy")
    zvirata = relationship("Zvire", back_populates="druh")

class Pozice(Base):
    __tablename__ = 'pozice'

    id_poz = Column(Integer, primary_key=True, autoincrement=True)
    nazev = Column(String(15), nullable=False)
    plat = Column(Integer, nullable=False)

    zamestnanci = relationship("Zamestnanec", back_populates="pozice")

class Zamestnanec(Base):
    __tablename__ = 'zamestnanci'

    id_zam = Column(Integer, primary_key=True, autoincrement=True)
    jmeno = Column(String(20), nullable=False)
    prijmeni = Column(String(30), nullable=False)
    email = Column(String(64), nullable=False)
    telefon = Column(String(20), nullable=False)
    datum_narozeni = Column(DateTime, nullable=False)
    bankovni_ucet = Column(String(50))
    id_poz = Column(Integer, ForeignKey('pozice.id_poz'), nullable=False)

    pozice = relationship("Pozice", back_populates="zamestnanci")
    zvirata = relationship("Zvire", back_populates="chovatel")

class Zvire(Base):
    __tablename__ = 'zvirata'

    id_zvi = Column(Integer, primary_key=True, autoincrement=True)
    id_dru = Column(Integer, ForeignKey('druhy.id_dru'), nullable=False)
    jmeno = Column(String(20), nullable=False)
    datum_narozeni = Column(DateTime, nullable=False)
    id_poh = Column(Integer, ForeignKey('pohlavi.id_poh'), nullable=False)
    id_zam_chov = Column(Integer, ForeignKey('zamestnanci.id_zam'), nullable=False)
    prichod_do_zoo = Column(DateTime, nullable=False)

    druh = relationship("Druh", back_populates="zvirata")
    pohlavi = relationship("Pohlavi", back_populates="zvirata")
    chovatel = relationship("Zamestnanec", back_populates="zvirata")
    zvi_vyb = relationship("ZviVyb", back_populates="zvire")
    zvi_pot = relationship("ZviPot", back_populates="zvire")

class Vybeh(Base):
    __tablename__ = 'vybehy'

    id_vyb = Column(Integer, primary_key=True, autoincrement=True)
    nazev = Column(String(20), nullable=False)
    velikost = Column(Integer, nullable=False)
    popis = Column(String(64), nullable=True)

    zvi_vyb = relationship("ZviVyb", back_populates="vybeh")

class ZviVyb(Base):
    __tablename__ = 'zvi_vyb'

    id_zvi = Column(Integer, ForeignKey('zvirata.id_zvi'), primary_key=True)
    id_vyb = Column(Integer, ForeignKey('vybehy.id_vyb'), primary_key=True)

    vybeh = relationship("Vybeh", back_populates="zvi_vyb")
    zvire = relationship("Zvire", back_populates="zvi_vyb")

class Potrava(Base):
    __tablename__ = 'potrava'

    id_pot = Column(Integer, primary_key=True, autoincrement=True)
    nazev = Column(String(20), nullable=False)

    zvirata = relationship("ZviPot", back_populates="potrava")

class ZviPot(Base):
    __tablename__ = 'zvi_pot'

    id_zvi = Column(Integer, ForeignKey('zvirata.id_zvi'), primary_key=True)
    id_pot = Column(Integer, ForeignKey('potrava.id_pot'), primary_key=True)
    mnozstvi = Column(String(25))

    potrava = relationship("Potrava", back_populates="zvirata")
    zvire = relationship("Zvire", back_populates="zvi_pot")


# Ukázání počtu záznamů v tabulce zvířata, kontrola funkčnosti
try:
    zvirata = session.query(Zvire).all()
    if zvirata:
        print(f"Načteno {len(zvirata)} zvířat z tabulky 'zvirata'.")
    else:
        print("Tabulka 'zvirata' je prázdná nebo neexistuje.")
except Exception as e:
    print(f"Chyba při dotazu na model 'Zvire': {e}")



from sqlalchemy import func
from datetime import datetime

#vytvoření funkce na zobrazení počtu zvířat starších age
def count_animals_older_than_age(session, age):
    try:
        # Vytvoříme aktuální datum a zjistíme věk podle data narození
        today = datetime.today()
        
        # Dotaz, který spočítá počet zvířat starších než zadaný věk
        count = session.query(func.count(Zvire.id_zvi)).filter(
            func.datediff(today, Zvire.datum_narozeni) >= age * 365
        ).scalar()  # Používáme .scalar() pro získání samotné hodnoty (počet)

        return count

    except Exception as e:
        print(f"Chyba při dotazu: {e}")
        return None


#zavolání funkce
age = 15
count = count_animals_older_than_age(session, age)
if count is not None:
    print(f"Počet zvířat starších než {age} let je: {count}")
else:
    print("Došlo k chybě při načítání dat.")
