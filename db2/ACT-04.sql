--**********************************************************************
--*                    A04:  EXERCICE 01                               *  
--**********************************************************************

    SELECT E.EMP_NOM AS "EMPLOYÉS",
        E.DEPT_NUM   AS "NUMÉRO DE DÉPARTEMENT",
        D.DEPT_NOM   AS "DÉPARTEMENT"
    FROM EMPLOYEE    AS E JOIN DEPT AS D
    ON E.DEPT_NUM=D.DEPT_NUM;

--**********************************************************************
--*                    A04:  EXERCICE 02                               *  
--**********************************************************************

    SELECT DISTINCT POSTE FROM EMPLOYEE WHERE DEPT_NUM = 30;

--**********************************************************************
--*                    A04:  EXERCICE 03                               *  
--**********************************************************************

    SELECT E.EMP_NOM AS "EMPLOYÉ(E)S",
        D.DEPT_NOM   AS "DÉPARTEMENT",
        D.LOC        AS "LOCALISATION"
    FROM EMPLOYEE E JOIN DEPT D ON E.DEPT_NUM=D.DEPT_NUM
    WHERE E.COMM IS NOT NULL;

--**********************************************************************
--*                    A04:  EXERCICE 04                               *  
--**********************************************************************
 
    SELECT E.EMP_NOM  AS "EMPLOYÉ(E)S",
        D.DEPT_NOM    AS "DÉPARTEMENT"
    FROM EMPLOYEE AS E JOIN DEPT AS D 
        ON E.DEPT_NUM=D.DEPT_NUM
        WHERE UPPER(E.EMP_NOM) LIKE '%A%';        

--**********************************************************************
--*                    A04:  EXERCICE 05                               *  
--**********************************************************************

   SELECT E.EMP_NOM   AS "EMPLOYÉ(E)S",
          E.POSTE     AS "POSTES",
          E.DEPT_NUM  AS "NUMÉROS DÉPT.",
          D.DEPT_NOM  AS "DÉPARTEMENT"
    FROM EMPLOYEE AS E JOIN DEPT AS D
        ON E.DEPT_NUM=D.DEPT_NUM
    WHERE UPPER(D.LOC) LIKE 'STRASBOURG';

--**********************************************************************
--*                    A04:  EXERCICE 06                               *  
--**********************************************************************

    SELECT E.EMP_NOM  AS "EMPLOYÉS",
           E.EMP_NUM  AS "N° EMP.",
           E1.EMP_NOM AS "DIRECTEUR",
           E1.EMP_NUM AS "N° DIR."
    FROM EMPLOYEE E JOIN EMPLOYEE E1
        ON E.DIR=E1.EMP_NUM
    WHERE E.DIR IS NOT NULL;

--**********************************************************************
--*                    A04:  EXERCICE 07                               *  
--**********************************************************************

    SELECT E.EMP_NOM  AS "EMPLOYÉS",
           E.EMP_NUM  AS "N° EMP.",
           E1.EMP_NOM AS "DIRECTEUR",
           E1.EMP_NUM AS "N° DIR."
    FROM EMPLOYEE E LEFT JOIN EMPLOYEE E1
        ON E.DIR=E1.EMP_NUM;


--**********************************************************************
--*                    A04:  EXERCICE 08                               *  
--**********************************************************************
 
    SELECT E.EMP_NUM   AS "N° EMP.",
           E.DEPT_NUM  AS "NUMÉRO DÉPARTEMENT",
           COUNT(E2.EMP_NUM)-1  AS "NOMBRE DE COLLÈGUES"
    FROM EMPLOYEE E JOIN EMPLOYEE E2
        ON E.DEPT_NUM=E2.DEPT_NUM
    GROUP BY E.EMP_NUM, E.DEPT_NUM
    ORDER BY E.EMP_NUM;

--**********************************************************************
--*                    A04:  EXERCICE 09                               *  
--**********************************************************************

    SELECT E.EMP_NOM   AS "EMPLOYÉ(E)S",
           E.POSTE     AS "POSTES",
           D.DEPT_NOM  AS "DÉPARTEMENTS",
           E.SAL       AS "SALAIRES",
           S.GRADE     AS "GRADES"
    FROM EMPLOYEE E JOIN
        DEPT D ON E.DEPT_NUM=D.DEPT_NUM JOIN
        SAL_GRILLE S ON E.SAL BETWEEN S.MIN_SAL AND S.MAX_SAL;
 
--**********************************************************************
--*                    A04:  EXERCICE 10                               *  
--********************************************************************** 

    SELECT E.EMP_NOM   AS "EMPLOYÉ(E)S",
           E.DATE_EMB  AS "DATE D'EMBAUCHE"
        FROM EMPLOYEE E 
             WHERE E.DATE_EMB <    
    (SELECT E2.DATE_EMB FROM EMPLOYEE E2 
    WHERE UPPER(E2.EMP_NOM)='JEAN')
    ORDER BY E.DATE_EMB;

--**********************************************************************
--*                    A04:  EXERCICE 11                               *  
--**********************************************************************

    SELECT E.EMP_NOM  AS "EMPLOYÉ(E)S",
          E.DATE_EMB  AS "DATE EMBAUCHE EMP.",
          E1.EMP_NOM  AS "DIRECTEUR",
          E1.DATE_EMB AS "DATE EMBAUCHE DIR."
    FROM EMPLOYEE E JOIN EMPLOYEE E1
        ON E.DIR=E1.EMP_NUM
    WHERE E.DIR IS NOT NULL AND 
          E.DATE_EMB<E1.DATE_EMB
    ORDER BY E.EMP_NOM ASC;

