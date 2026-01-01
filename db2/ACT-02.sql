--**********************************************************************
--*                    A02:  EXERCICE 01                               *  
--**********************************************************************
   
    SELECT
       EMP_NOM   AS "EMPLOYÉS",
       SAL       AS "SALAIRES"
    FROM EMPLOYEE 
       WHERE SAL>2850;

--**********************************************************************
--*                    A02:  EXERCICE 02                               *  
--**********************************************************************

    SELECT
       EMP_NOM   AS "EMPLOYÉS",
       SAL       AS "SALAIRES"
    FROM EMPLOYEE 
       WHERE SAL < 1500 OR SAL > 2850;
  
--**********************************************************************
--*                    A02:  EXERCICE 03                               *  
--**********************************************************************

    SELECT
       EMP_NOM   AS "EMPLOYÉS",
       POSTE     AS "POSTES",
       DATE_EMB  AS "DATE D'ENTRÉE"
    FROM EMPLOYEE
       WHERE DATE_EMB BETWEEN '2021-02-20' AND '2021-05-01'
       ORDER BY DATE_EMB ASC;
    
--**********************************************************************
--*                    A02:  EXERCICE 04                               *  
--**********************************************************************

    SELECT
       EMP_NOM   AS "EMPLOYÉS",
       DEPT_NUM  AS "DEPARTEMENT"
    FROM EMPLOYEE
       WHERE DEPT_NUM IN (10, 30)
       ORDER BY EMP_NOM ASC;

--**********************************************************************
--*                    A02:  EXERCICE 05                               *  
--**********************************************************************

    SELECT
       EMP_NOM   AS "EMPLOYÉS",
       SAL       AS "SALAIRE MENSUEL"
    FROM EMPLOYEE
       WHERE SAL>1500 AND DEPT_NUM IN(10,30);

--**********************************************************************
--*                    A02:  EXERCICE 06                               *  
--**********************************************************************
    
    SELECT
       EMP_NOM   AS "EMPLOYÉS",
       DATE_EMB  AS "DATE EMBAUCHE"
    FROM EMPLOYEE
       WHERE YEAR(DATE_EMB)=2022;

--**********************************************************************
--*                    A02:  EXERCICE 07                               *  
--**********************************************************************
    
    SELECT
       EMP_NOM   AS "EMPLOYÉS",
       POSTE     AS "POSTES"
    FROM EMPLOYEE
       WHERE DIR IS NULL;   

--**********************************************************************
--*                    A02:  EXERCICE 08                               *  
--**********************************************************************
    
    SELECT
       EMP_NOM   AS "EMPLOYÉS",
       SAL       AS "SALAIRES",
       COMM      AS "COMMISSIONS"
    FROM EMPLOYEE
       WHERE COMM IS NOT NULL
       ORDER BY SAL DESC, COMM DESC;
--**********************************************************************
--*                    A02:  EXERCICE 09                               *  
--**********************************************************************
    
    SELECT
       EMP_NOM   AS "EMPLOYÉS"
    FROM EMPLOYEE
       WHERE EMP_NOM LIKE '__A%';   
    
--**********************************************************************
--*                    A02:  EXERCICE 10                               *  
--**********************************************************************
    
    SELECT
       EMP_NOM   AS "EMPLOYÉS"
    FROM EMPLOYEE
        WHERE (EMP_NOM LIKE '%G%G%' AND DEPT_NUM = 30) OR DIR = 7782;   
   
--**********************************************************************
--*                    A02:  EXERCICE 11                               *  
--**********************************************************************
    
    SELECT
        EMP_NOM   AS "NOMS EMPLOYÉS",
        SAL       AS "SALAIRE",
        COMM      AS "COMMISSION"
    FROM EMPLOYEE
        WHERE (POSTE = 'AGENT' OR POSTE = 'ANALYSTE') 
        AND SAL NOT IN (1000, 3000, 5000);
        
--**********************************************************************
--*                    A02:  EXERCICE 12                               *  
--**********************************************************************
  
    SELECT
        EMP_NOM   AS "NOMS EMPLOYÉS",
        SAL       AS "SALAIRE",
        COMM      AS "COMMISSION"
    FROM EMPLOYEE
        WHERE COMM > (SAL * 1.10);