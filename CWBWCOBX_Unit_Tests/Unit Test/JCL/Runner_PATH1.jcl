//PFHSXK0X  JOB ('CWTXCSXK'),'TESTER',       
//       CLASS=A,MSGCLASS=R,NOTIFY=&SYSUID,REGION=0M     
/*JOBPARM S=*
//*** SPECIFY JOBCARD IN TOTALTEST PREFERENCES TO SUBSTITUTE
//***
//*** THE JOB CARD MUST INCLUDE A NOTIFY STATEMENT SUCH 
//*** AS NOTIFY=&SYSUID and also a REGION=0M parameter
//*
//********************************************************************
//* Execute Target Runner
//********************************************************************
//RUNNER EXEC PGM=TTTRUNNR
//*
//* You need to modify the following DD statements.
//*
//* The first DD statement should be changed to the ECC SLCXLOAD 
//* dataset that contains the Topaz for Total Test TTTRUNNR program.
//*
//* The second DD statement should be changed to the loadlib
//* containing the programs to run during the test.
//*
//* The third DD statement is only required if running the JCL 
//* from Topaz for Total Test CLI with Code Coverage support.
//* If testing an LE application it should be changed to the
//* loadlib containing the COBOL runtime(CEE.SCEERUN), otherwise 
//* it can be removed.
//*
//STEPLIB  DD DSN=SYS2.CW.&CWGACX..SLCXLOAD,DISP=SHR
//*  where MLCXnnn is MLCX170 OR HIGHER
//        DD DISP=SHR,DSN=SALESSUP.SXK1.DEV1.LOAD
//        DD DISP=SHR,DSN=SALESSUP.SXK1.QA1.LOAD
//        DD DISP=SHR,DSN=SALESSUP.SXK1.STG.LOAD
//*       DD DISP=SHR,DSN=<COBOL RUNTIME LOADLIB>
//*
//EMPFILE  DD   DSN=SYS2.CW.&CWGAXT..SLXTSAMP(CWXTDATA),
//         DISP=SHR
//RPTFILE  DD   SYSOUT=X
//SYSOUT   DD   SYSOUT=X
//SLSF002 DD DSN=SALESSUP.SXK1.DEV1.SSD,DISP=SHR
//SLSF004 DD DSN=SALESSUP.SXK1.QA1.SSD,DISP=SHR
//SLSF008 DD DSN=SALESSUP.SXK1.STG.SSD,DISP=SHR
//TRPARM DD *
*
*        Optionally set your custom exit program here:
* 
EXIT(NONE)
*
REPEAT(${TOTALTEST_REPEAT}),STUBS(${TOTALTEST_STUBS}),
DEBUG(OFF)
/* 
//BININP DD DSN=${TOTALTEST_BININP},DISP=OLD
//BINREF DD DSN=${TOTALTEST_BINREF},DISP=OLD
//BINRES DD DSN=${TOTALTEST_BINRES},DISP=OLD
//*
//*      Optionally add your custom DD statements
//SYSPRINT DD SYSOUT=*
//*
