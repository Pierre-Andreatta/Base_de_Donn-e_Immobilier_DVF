
CREATE TABLE public.Type_local (
                Code INTEGER NOT NULL,
                Nom VARCHAR(50) NOT NULL,
                CONSTRAINT Type_local_pk PRIMARY KEY (Code)
);


CREATE TABLE public.Commune (
                Code_id INTEGER NOT NULL,
                Cp CHAR(5) NOT NULL,
                code_dep VARCHAR(3) NOT NULL,
                Nom VARCHAR(100) NOT NULL,
                CONSTRAINT Commune_pk PRIMARY KEY (Code_id)
);


CREATE UNIQUE INDEX public.Commune_idx
 ON public.Commune
 ( Cp, Nom );

CREATE TABLE public.Type_voie (
                Code_type INTEGER NOT NULL,
                Nom VARCHAR(4) NOT NULL,
                CONSTRAINT Type_voie_pk PRIMARY KEY (Code_type)
);


CREATE TABLE public.Voie (
                Id INTEGER NOT NULL,
                Code_type INTEGER NOT NULL,
                No INTEGER,
                Btq CHAR(1),
                Nom VARCHAR(100) NOT NULL,
                CONSTRAINT Voie_pk PRIMARY KEY (Id)
);


CREATE TABLE public.Bien (
                Id INTEGER NOT NULL,
                Code_local INTEGER NOT NULL,
                lot_nb INTEGER NOT NULL,
                Surface_reel INTEGER NOT NULL,
                Piece_princip_nb INTEGER NOT NULL,
                Surface_terrain INTEGER,
                Voie_id INTEGER NOT NULL,
                Commune_code_id INTEGER NOT NULL,
                prem_lot VARCHAR(15) NOT NULL,
                surface_car DECIMAL(10,2) NOT NULL,
                CONSTRAINT Bien_pk PRIMARY KEY (Id)
);


CREATE TABLE public.Nature_Mutation (
                Id INTEGER NOT NULL,
                Nom VARCHAR(34) NOT NULL,
                CONSTRAINT Nature_Mutation_pk PRIMARY KEY (Id)
);


CREATE TABLE public.Mutation (
                Id INTEGER NOT NULL,
                Nature_id INTEGER NOT NULL,
                Dispo_no INTEGER NOT NULL,
                Date DATE NOT NULL,
                Val_fonc DECIMAL(15,2),
                Bien_id INTEGER NOT NULL,
                CONSTRAINT Mutation_pk PRIMARY KEY (Id)
);


ALTER TABLE public.Bien ADD CONSTRAINT Type_local_Bien_fk
FOREIGN KEY (Code_local)
REFERENCES public.Type_local (Code)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE public.Bien ADD CONSTRAINT Commune_Bien_fk
FOREIGN KEY (Commune_code_id)
REFERENCES public.Commune (Code_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE public.Voie ADD CONSTRAINT Type_voie_Voie_fk
FOREIGN KEY (Code_type)
REFERENCES public.Type_voie (Code_type)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE public.Bien ADD CONSTRAINT Voie_Bien_fk
FOREIGN KEY (Voie_id)
REFERENCES public.Voie (Id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE public.Mutation ADD CONSTRAINT Bien_Mutation_fk
FOREIGN KEY (Bien_id)
REFERENCES public.Bien (Id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE public.Mutation ADD CONSTRAINT Nature_Mutation_Vente_mutation_fk
FOREIGN KEY (Nature_id)
REFERENCES public.Nature_Mutation (Id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;