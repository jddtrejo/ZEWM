report ZWMMF_FIX_QUEUE_OUT2
       no standard page heading line-size 255.

include bdcrecx1.

start-of-selection.

perform open_group.

perform bdc_dynpro      using 'RSTRFCM1' '1000'.
perform bdc_field       using 'BDC_CURSOR'
                              'QNAME'.
perform bdc_field       using 'BDC_OKCODE'
                              '=ONLI'.
perform bdc_field       using 'CLIENT'
                              '310'.
perform bdc_field       using 'QNAME'
                              'DLVSPRO310    0180686858'.
perform bdc_field       using 'QDEST'
                              '*'.
perform bdc_dynpro      using 'SAPMSSY0' '0120'.
perform bdc_field       using 'BDC_CURSOR'
                              '04/15'.
perform bdc_field       using 'BDC_OKCODE'
                              '=EXEC'.
perform bdc_dynpro      using 'SAPLSPO4' '0300'.
perform bdc_field       using 'BDC_CURSOR'
                              'SVALD-VALUE(01)'.
perform bdc_field       using 'BDC_OKCODE'
                              '=FURT'.
perform bdc_dynpro      using 'SAPMSSY0' '0120'.
perform bdc_field       using 'BDC_OKCODE'
                              '=ZRCK'.
perform bdc_dynpro      using 'RSTRFCM1' '1000'.
perform bdc_field       using 'BDC_OKCODE'
                              '/EE'.
perform bdc_field       using 'BDC_CURSOR'
                              'CLIENT'.
perform bdc_transaction using 'SMQ1'.

perform close_group.
