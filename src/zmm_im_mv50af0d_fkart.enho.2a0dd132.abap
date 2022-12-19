"Name: \PR:SAPMV50A\EX:MV50AF0D_08\EI
ENHANCEMENT 0 ZMM_IM_MV50AF0D_FKART.
*SAMUEL ALVAREZ salvarezv@me.com
  data: vl_LFART type LFART,
        vl_bsart type bsart,
        VL_PSTYV TYPE PSTYV.
  loop at xlikp ASSIGNING FIELD-SYMBOL(<fs_xlikp>).
    read TABLE CVBLS ASSIGNING FIELD-SYMBOL(<fs_CVBLS>) WITH KEY vbeln_lif = <fs_xlikp>-vbeln.
    if <fs_CVBLS>-vbeln is ASSIGNED.
      select single bsart into vl_bsart
        from ekko
        where ebeln = <fs_CVBLS>-vbeln.
      if sy-subrc = 0.
        SELECT SINGLE LFART PSTYV into (vl_LFART, VL_PSTYV)
          from ZMMPUR_TT_FKDAT
          where BSART = vl_bsart.
        if sy-subrc = 0.
          <fs_xlikp>-lfart = vl_LFART.
          LOOP AT XLIPS ASSIGNING FIELD-SYMBOL(<FS_XLIPS>) WHERE VBELN = <fs_xlikp>-vbeln.
            <FS_XLIPS>-PSTYV = VL_PSTYV.
          ENDLOOP.
        endif.
      endif.
    endif.
  endloop.
ENDENHANCEMENT.
