--**********************************************************************
--*                    A5:  EXERCICE 01                                *  
--**********************************************************************
  SELECT DEPT_NUM
    FROM DEPT WHERE DEPT_NUM NOT IN (
      SELECT DEPT_NUM FROM EMPLOYEE
    );
--**********************************************************************
--*                    A5:  EXERCICE 02                                *  
--**********************************************************************
  SELECT POST FROM EMPLOYEE                                   
    WHERE DATE_EMB BETWEEN '2021-07-01' AND '2021-12-31'      
  INTERSECT                                                   
  SELECT POST FROM EMPLOYEE                                   
    WHERE DATE_EMB BETWEEN '2025-07-01'AND '2025-12-31' ;     
--**********************************************************************
--*                    A5:  EXERCICE 03                                *  
--**********************************************************************
  SELECT DISTINCT E.POST, E.DEPT_NUM
    FROM EMPLOYEE E
    WHERE E.DEPT_NUM IN (10,20,30)
    ORDER BY E.DEPT_NUM ASC;

  SELECT POST, DEPT_NUM FROM EMPLOYEE WHERE DEPT_NUM = 10
  UNION
  SELECT POST, DEPT_NUM FROM EMPLOYEE WHERE DEPT_NUM = 30
  UNION
  SELECT POST, DEPT_NUM FROM EMPLOYEE WHERE DEPT_NUM = 20
  ORDER BY DEPT_NUM;
--**********************************************************************
--*                    A5:  EXERCICE 04                                *  
--**********************************************************************
  SELECT DISTINCT DEPT_NUM FROM DEPT
  EXCEPT
  SELECT DISTINCT DEPT_NUM FROM EMPLOYEE
  WHERE UPPER(POST) = 'ANALYSTE';
--**********************************************************************
--*                    A5:  EXERCICE 05                                *  
--**********************************************************************
  (SELECT DISTINCT POST FROM EMPLOYEE WHERE DEPT_NUM=10
  EXCEPT
  SELECT DISTINCT POST FROM EMPLOYEE WHERE DEPT_NUM=20)
  UNION
  (SELECT DISTINCT POST FROM EMPLOYEE WHERE DEPT_NUM=20
  EXCEPT
  SELECT DISTINCT POST FROM EMPLOYEE WHERE DEPT_NUM=10);