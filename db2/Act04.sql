--**********************************************************************
--*                    A4:  EXERCICE 01                                *  
--**********************************************************************
  SELECT DEPT.DEPT_NOM, DEPT.DEPT_NUM 
    FROM DEPT EMPLOYEE 
    ON DEPT.DEPT_NUM=EMPLOYEE.DEPT_NUM;
--**********************************************************************
--*                    A4:  EXERCICE 02                                *  
--**********************************************************************
  SELECT DISTINCT EMPLOYEE.POST AS "LISTE DES POSTES" 
    FROM EMPLOYEE LEFT JOIN DEPT 
    ON EMPLOYEE.DEPT_NUM=DEPT.DEPT_NUM;
--**********************************************************************
--*                    A4:  EXERCICE 03                                *  
--**********************************************************************
  SELECT E.EMP_NOM, D.DEPT_NOM, D.LOC
     FROM EMPLOYEE E JOIN DEPT D 
     ON E.DEPT_NUM=D.DEPT_NUM
     WHERE E.COMM IS NOT NULL;
--**********************************************************************
--*                    A4:  EXERCICE 04                                *  
--**********************************************************************
  SELECT E.EMP_NOM, D.DEPT_NOM
     FROM EMPLOYEE E JOIN DEPT D 
     ON E.DEPT_NUM=D.DEPT_NUM
     WHERE UPPER(E.EMP_NOM) LIKE '%A%';
--**********************************************************************
--*                    A4:  EXERCICE 05                                *  
--**********************************************************************
  SELECT E.EMP_NOM, E.POST, E.DEPT_NUM,D.DEPT_NOM
     FROM EMPLOYEE E JOIN DEPT D 
     ON E.DEPT_NUM=D.DEPT_NUM
     WHERE D.LOC='STRASBOURG';
--**********************************************************************
--*                    A4:  EXERCICE 06                                *  
--**********************************************************************
  SELECT A.EMP_NOM AS "Employés",
         A.EMP_NUM AS "N° Emp.",
         B.EMP_NOM AS "Directeur",
         B.EMP_NUM AS "N° Dir."
      FROM EMPLOYEE A JOIN EMPLOYEE B 
      ON A.DIR=B.EMP_NUM;
--**********************************************************************
--*                    A4:  EXERCICE 07 à revoir                       *  
--**********************************************************************
  SELECT DISTINCT A.EMP_NOM AS "Employés",
                  A.EMP_NUM AS "N° Emp.",
         B.EMP_NOM AS "Directeur",
         B.EMP_NUM AS "N° Dir."
      FROM EMPLOYEE A JOIN EMPLOYEE B 
      ON A.EMP_NUM=B.EMP_NUM;
--**********************************************************************
--*                    A4:  EXERCICE 08                                *  
--**********************************************************************
    SELECT A.EMP_NUM, 
        A.DEPT_NUM, 
        COUNT(*) - 1 AS NB_COLLEGUES
    FROM EMPLOYEE A 
    INNER JOIN EMPLOYEE B ON A.DEPT_NUM = B.DEPT_NUM
    GROUP BY A.EMP_NUM, A.DEPT_NUM
    ORDER BY A.EMP_NUM;
--**********************************************************************
--*                    A4:  EXERCICE 09                                *  
--**********************************************************************
    SELECT 
        E.EMP_NOM,
        E.POST,
        D.DEPT_NOM AS DEPARTEMENT,
        E.SAL,
        SG.GRADE
    FROM EMPLOYEE E
    INNER JOIN DEPT D ON E.DEPT_NUM = D.DEPT_NUM
    INNER JOIN SAL_GRILLE SG ON E.SAL BETWEEN SG.MIN_SAL AND SG.MAX_SAL
    ORDER BY E.EMP_NOM;
--**********************************************************************
--*                    A4:  EXERCICE 10                                *  
--**********************************************************************
    SELECT EMP_NOM,DATE_EMB
      FROM EMPLOYEE 
      WHERE DATE_EMB < (
        SELECT DATE_EMB
            FROM EMPLOYEE
            WHERE EMP_NOM = "JEAN"
      )
    ORDER BY DATE_EMB;
--**********************************************************************
--*                    A4:  EXERCICE 11                                *  
--**********************************************************************
  

--**********************************************************************
--*                    A4:  EXERCICE 11                                *  
--**********************************************************************
