      * NAME:   ALDRIN JEROME ALMACIN
      * DATE:   JUNE 6, 2013
      * PURPOSE: TO FORMAT PAYROLL DATA INTO AN OUTPUT FILE.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ASSIGNMENT1.
      ***********************************************************
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT PAYROLL-MASTER
             ASSIGN TO "CH0402.DAT"
             ORGANIZATION IS LINE SEQUENTIAL.
             
           SELECT PAYROLL-OUT
             ASSIGN TO "A1OUTPUT.DAT"
             ORGANIZATION IS LINE SEQUENTIAL.
      ***********************************************************
       DATA DIVISION.
       FILE SECTION.
       FD PAYROLL-MASTER
          LABEL RECORDS ARE STANDARD
          RECORD CONTAINS 80 CHARACTERS
          BLOCK CONTAINS 10 RECORDS.
       01 PAYROLL-RECORD-IN.
        05 EMPLOYEE-NUM-IN     PIC X(5).
        05 EMPLOYEE-NAME-IN    PIC X(20).
        05 LOCATION-CODE.
           10 TERRITORY-NUM-IN   PIC XX.
           10 OFFICE-NUM-IN      PIC XX.
        05 ANNUAL-SALARY-IN    PIC X(6).
        05 SOCIAL-SEC-NUM-IN   PIC X(9).
        05 DEPENDENTS-IN       PIC XX.
        05 JOB-CLASS-CODE-IN   PIC XX.
        05                     PIC X(32).
       
       FD PAYROLL-OUT
          LABEL RECORDS ARE STANDARD
          RECORD CONTAINS 67 CHARACTERS
          BLOCK CONTAINS 10 RECORDS.
       01 PAYROLL-RECORD-OUT.
        05                     PIC X(5).
        05 EMPLOYEE-NUM-OUT    PIC X(5).
        05                     PIC XX.
        05 EMPLOYEE-NAME-OUT   PIC X(20).
        05                     PIC X.
        05 LOCATION-CODE.
           10 TERRITORY-NUM-OUT  PIC XX.
           10                    PIC X(3).
           10 OFFICE-NUM-OUT     PIC XX.
           10                    PIC XX.
        05 ANNUAL-SALARY-OUT   PIC X(6).
        05                     PIC XX.
        05 SOCIAL-SEC-NUM-OUT  PIC X(9).
        05                     PIC XX.
        05 DEPENDENTS-OUT      PIC XX.
        05                     PIC XX.
        05 JOB-CLASS-CODE-OUT  PIC XX.
        
       WORKING-STORAGE SECTION.
       01 WS-MORE-DATA         PIC X(3)   VALUE "YES".
      ***********************************************************
       PROCEDURE DIVISION.
       100-MAIN-MODULE.
           OPEN       INPUT  PAYROLL-MASTER
                      OUTPUT PAYROLL-OUT
           
           PERFORM UNTIL WS-MORE-DATA = "NO"
             READ PAYROLL-MASTER
               AT END
                  MOVE "NO" TO WS-MORE-DATA
               NOT AT END
                   PERFORM 200-OUTPUT-DATA-ROUTINE
             END-READ
           END-PERFORM
           
           CLOSE      PAYROLL-MASTER
                      PAYROLL-OUT
           STOP RUN.
           
       200-OUTPUT-DATA-ROUTINE.
           MOVE SPACES                            TO PAYROLL-RECORD-OUT
           MOVE EMPLOYEE-NUM-IN                   TO EMPLOYEE-NUM-OUT
           MOVE EMPLOYEE-NAME-IN                  TO EMPLOYEE-NAME-OUT
           MOVE TERRITORY-NUM-IN                  TO TERRITORY-NUM-OUT
           MOVE OFFICE-NUM-IN                     TO OFFICE-NUM-OUT
           MOVE ANNUAL-SALARY-IN                  TO ANNUAL-SALARY-OUT
           MOVE SOCIAL-SEC-NUM-IN                 TO SOCIAL-SEC-NUM-OUT
           MOVE DEPENDENTS-IN                     TO DEPENDENTS-OUT
           MOVE JOB-CLASS-CODE-IN                 TO JOB-CLASS-CODE-OUT
           
           WRITE PAYROLL-RECORD-OUT.