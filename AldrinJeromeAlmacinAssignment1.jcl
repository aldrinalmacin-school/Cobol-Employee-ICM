//KC03I4DS JOB 1,'ALDRIN ALMACIN',NOTIFY=&SYSUID                
//**************************************************            
//* COMPILE COBOL PROGRAM                                       
//**************************************************            
//STEP1 EXEC IGYWCLG                                            
//COBOL.SYSIN        DD DSN=KC03I4D.COBOL.SOURCE(ASSIGN1),DISP=SHR
//GO.A1IN DD DSN=KC03I4D.A1IN,DISP=SHR                        
//* GO.A1OUT DD DSN=KC03I4D.A1OUT,UNIT=SYSDA,                   
//*           DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(3,3)),        
//*           DCB=(DSORG=PS,RECFM=FB,LRECL=105,BLKSIZE=0)       
//GO.A1OUT DD DSN=KC03I4D.A1OUT,DISP=OLD                        