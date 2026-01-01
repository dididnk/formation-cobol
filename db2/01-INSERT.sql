
--**********************************************************************
--*                   INSERER LES ENREGISTREMENTS                      *  
--*                     TABLE DEPARTEMENT (DEPT)                       *  
--**********************************************************************  
   
    INSERT INTO DEPT VALUES (10,'COMPTABILITÉ','MARSEILLE');
    INSERT INTO DEPT VALUES (20,'RECHERCHE','STRASBOURG');
    INSERT INTO DEPT VALUES (30,'VENTES','LYON');
    INSERT INTO DEPT VALUES (40,'EXPLOITATION','PARIS');    

--**********************************************************************
--*             TABLE GRILLE SALARIALLE (SAL_GRILLE)                   *  
--********************************************************************** 

   INSERT INTO SAL_GRILLE VALUES (1, 700, 1200);
   INSERT INTO SAL_GRILLE VALUES (2, 1201, 1400);
   INSERT INTO SAL_GRILLE VALUES (3, 1401, 2000);
   INSERT INTO SAL_GRILLE VALUES (4, 2001, 3000);
   INSERT INTO SAL_GRILLE VALUES (5, 3001, 9999);

--**********************************************************************
--*                      TABLE EMPLOYE (EMPLOYEE)                      *  
--********************************************************************** 

   INSERT INTO EMPLOYEE VALUES(7369, 'ARTHUR','AGENT',7902,
    DATE('2020-12-17'),800.00,NULL,20);

   INSERT INTO EMPLOYEE VALUES(7499,'PAUL','VENDEUR',7698,
    DATE('2021-02-20'),1600.00,300.00,30);

   INSERT INTO EMPLOYEE VALUES(7521,'JEAN','VENDEUR',7698,
    DATE('2021-02-22'),1250.00,500.00,30);

   INSERT INTO EMPLOYEE VALUES(7566,'CHARLES','DIRECTEUR',7839,
    DATE('2021-04-02'),2975.00,NULL,20);

   INSERT INTO EMPLOYEE VALUES(7654,'GEORGES','VENDEUR',7698,
    DATE('2021-09-28'),1250.00,1400.00,30);

   INSERT INTO EMPLOYEE VALUES(7698,'ALBERT','DIRECTEUR',7839,
    DATE('2021-05-01'),2850.00,NULL,30);

   INSERT INTO EMPLOYEE VALUES(7782,'GASTON','DIRECTEUR',7839,
    DATE('2021-06-09'),2450.00,NULL,10);

   INSERT INTO EMPLOYEE VALUES(7788,'ARSÈNE','ANALYSTE',7566,
    DATE('2025-07-13'),3000.00,NULL,20);

   INSERT INTO EMPLOYEE VALUES(7839,'HENRI','PDG',NULL,
    DATE('2021-11-17'),5000.00,NULL,10);

   INSERT INTO EMPLOYEE VALUES(7844,'JULES','VENDEUR',7698,
    DATE('2021-09-08'),1500.00,0.00,30);

   INSERT INTO EMPLOYEE VALUES(7900,'FERNAND','AGENT',7698,
    DATE('2021-12-03'),950.00,NULL,30);

   INSERT INTO EMPLOYEE VALUES(7902,'BASILE','ANALYSTE',7566,
    DATE('2021-12-03'),3000.00,NULL,20);

   INSERT INTO EMPLOYEE VALUES(7934,'HECTOR','AGENT',7782,
    DATE('2022-01-23'),1300.00,NULL,10);     


--**********************************************************************
--*                       AFFICHAGE DES TABLEAUX                       *  
--**********************************************************************

  SELECT 
    DEPT_NUM   AS "N° DEP.",
    DEPT_NOM   AS "NOMS DÉPARTEMENT",
    LOC        AS "LOCALISATION"
   FROM DEPT;

  SELECT
   GRADE      AS "GRADES",
   MIN_SAL    AS "SALAIRES MINIMUM",
   MAX_SAL    AS "SALAIRES MAXIMULM" 
  FROM SAL_GRILLE;

  SELECT
   EMP_NUM   AS "N° EMP.",
   EMP_NOM   AS "NOMS EMPLOYÉS",
   POSTE     AS "POSTE",
   DIR       AS "ID DIRECTEUR",
   DATE_EMB  AS "DATE D'EMBAUCHE",
   SAL       AS "SALAIRE",
   COMM      AS "COMMISSION"
  FROM EMPLOYEE;