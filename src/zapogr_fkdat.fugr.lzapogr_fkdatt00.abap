*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZMMPUR_TT_FKDAT.................................*
DATA:  BEGIN OF STATUS_ZMMPUR_TT_FKDAT               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZMMPUR_TT_FKDAT               .
CONTROLS: TCTRL_ZMMPUR_TT_FKDAT
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZMMPUR_TT_FKDAT               .
TABLES: ZMMPUR_TT_FKDAT                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
