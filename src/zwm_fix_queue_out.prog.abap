REPORT ZWM_FIX_QUEUE_OUT.
*INCLUDE BDCRECX1.

TABLES: TRFCQOUT.

*DATA: L_ARFCTID  TYPE ARFCTID,
*      DO_NOT_EXE TYPE C.
*SELECT-OPTIONS: S_COLA FOR TRFCQOUT-QNAME NO INTERVALS.
*PARAMETERS: P_DEST TYPE TRFCQOUT-DEST DEFAULT ''.

SELECT-OPTIONS: QNAME FOR TRFCQOUT-QNAME NO INTERVALS NO-EXTENSION.

DATA: BEGIN OF IT_ARFC OCCURS 0,
        ARFCIPID   TYPE TRFCQOUT-ARFCIPID,
        ARFCPID    TYPE TRFCQOUT-ARFCPID,
        ARFCTIME   TYPE TRFCQOUT-ARFCTIME,
        ARFCTIDCNT TYPE TRFCQOUT-ARFCTIDCNT,
      END OF IT_ARFC.


START-OF-SELECTION.

  SELECT ARFCIPID
  ARFCPID
  ARFCTIME
  ARFCTIDCNT
  INTO TABLE IT_ARFC
  FROM  TRFCQOUT
   WHERE QNAME IN QNAME
    AND QSTATE EQ 'READY'.


  LOOP AT IT_ARFC.
    SUBMIT RSARFCSE "VIA SELECTION-SCREEN
    WITH TID EQ IT_ARFC
    WITH FORCED EQ 'X'
    WITH QOUTSKED EQ '' AND RETURN.
  ENDLOOP.


*  LOOP AT S_COLA.

*    CALL FUNCTION 'TRFC_QOUT_GET_FIRST_LUW'
*      EXPORTING
*        QNAME             = S_COLA-LOW
*        DEST              = P_DEST
*        CLIENT            = SY-MANDT
*        NO_READ_LOCK      = ' '
*      IMPORTING
*        TID               = L_ARFCTID
**       QSTATE            =
**       WQNAME            =
**       ERRMESS           =
**       FDATE             =
**       FTIME             =
**       FQCOUNT           =
** TABLES
**       QTABLE            =
*      EXCEPTIONS
*        INVALID_PARAMETER = 1
*        OTHERS            = 2.
*
*
*    CALL FUNCTION 'TRFC_QOUT_EXECUTE_CHECK_LUW'
*      EXPORTING
*        TID                      = L_ARFCTID
*      IMPORTING
*        DO_NOT_EXECUTE_LUW       = DO_NOT_EXE
*      EXCEPTIONS
*        NOTID                    = 1
*        QE_STOP_SELECTED         = 2
*        QE_STOP_GENERIC_SELECTED = 3
*        QE_RESTART_SELECTED      = 4
*        LUW_NO_QOUT_LUW          = 5
*        QE_NOSEND                = 6
*        QS_UPDATE                = 7
*        QS_MODIFY                = 8
*        QE_STOP                  = 9
*        QE_RESTART               = 10
*        QE_PREDECESSOR           = 11
*        QE_GEN_STOP              = 12
*        QE_SINGLE_STOP           = 13
*        QE_GEN_RESTART           = 14
*        QE_QUEUE_RECEIVER        = 15
*        QS_EXECUTED              = 16
*        QS_SENDED                = 17
*        QS_VBERROR               = 18
*        OTHERS                   = 19.
*
*
*    CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
*      EXPORTING
*        WAIT = 'X'.

*  ENDLOOP.
