--**********************************************************************
--*                    A01:  EXERCICE 01                               *  
--**********************************************************************
   
  SELECT * FROM DEPT;

--**********************************************************************
--*                    A01:  EXERCICE 02                               *  
--**********************************************************************

  SELECT
    EMP_NUM   AS "N° EMP.",
    EMP_NOM   AS "NOMS EMPLOYÉS",
    POSTE     AS "POSTE",
    DATE_EMB  AS "DATE D'EMBAUCHE"
  FROM EMPLOYEE;

--**********************************************************************
--*                    A01:  EXERCICE 03                               *  
--**********************************************************************
  
  SELECT DISTINCT POSTE AS "TOUS LES POSTES" FROM EMPLOYEE; 

--**********************************************************************
--*                    A01:  EXERCICE 04                               *  
--**********************************************************************

  SELECT
   EMP_NUM   AS "N° EMP.",
   EMP_NOM   AS "NOMS EMPLOYÉS",
   POSTE     AS "POSTE",
   DIR       AS "ID DIRECTEUR",
   DATE_EMB  AS "DATE EMBAUCHE",
   SAL       AS "SALAIRE",
   COMM      AS "COMMISSION"
  FROM EMPLOYEE;

--**********************************************************************
--*                    A01:  EXERCICE 05                               *  
--**********************************************************************

   SELECT 
    EMP_NOM !! ',' !! POSTE 
    AS "EMPLOYÉS ET POSTES"
   FROM EMPLOYEE;

--**********************************************************************
--*                    A01:  EXERCICE 06                               *  
--**********************************************************************
  
    SELECT
      LTRIM(CHAR(EMP_NUM))    !! ',' !! 
      LTRIM(EMP_NOM)          !! ',' !! 
      LTRIM(POSTE)            !! ',' !! 
      LTRIM(DIR)              !! ',' !! 
      LTRIM(CHAR(DATE_EMB))   !! ',' !! 
      LTRIM(CHAR(SAL))        !! ',' !! 
      LTRIM(CHAR(COMM))      AS "Liste des Employés"
    FROM EMPLOYEE;