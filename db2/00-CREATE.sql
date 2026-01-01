--**********************************************************************
--*                     SUPPRIMER LES TABLES                           *  
--**********************************************************************

   DROP TABLE DEPT;  
   DROP TABLE EMPLOYEE;  
   DROP TABLE SAL_GRILLE;  

--**********************************************************************
--*                         CREER LES TABLES                           *  
--**********************************************************************                              
                                        
  CREATE TABLE DEPT(                                        
    DEPT_NUM SMALLINT NOT NULL,                             
    DEPT_NOM VARCHAR(14),                                   
    LOC VARCHAR(13),                                        
    PRIMARY KEY(DEPT_NUM)); 
                        
  CREATE TABLE SAL_GRILLE(                       
    GRADE SMALLINT NOT NULL,                  
    MIN_SAL DECIMAL(7,2),                     
    MAX_SAL DECIMAL(7,2),                     
    PRIMARY KEY(GRADE));  

  CREATE TABLE EMPLOYEE(                                    
    EMP_NUM SMALLINT NOT NULL,                              
    EMP_NOM VARCHAR(10),                                    
    POSTE VARCHAR(09),                                       
    DIR SMALLINT,                                           
    DATE_EMB DATE,                                          
    SAL DECIMAL(7,2),                                       
    COMM DECIMAL(7,2),                                      
    DEPT_NUM SMALLINT NOT NULL                
        REFERENCES DEPT(DEPT_NUM),            
    PRIMARY KEY (EMP_NUM)); 

  CREATE TABLE MOUVEMENT (
    NUM_COMPTE CHAR(3) NOT NULL,
    LIB_MOUV VARCHAR(15),
    MONTANT_MVT DECIMAL(8,2),
    SENS CHAR(2),
    NATURE CHAR(3),
    DATE_MVT DATE,
    FOREIGN KEY (NUM_COMPTE) REFERENCES CLIENT(NUM_COMPTE)
  );
