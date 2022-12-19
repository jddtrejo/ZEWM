*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_ZAPOGR_FKDAT
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_ZAPOGR_FKDAT       .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
