*-----------------------------------------------------------------------
*-----------------------------------------------------------------------
* SAP JCO tutorial
*-----------------------------------------------------------------------
*-----------------------------------------------------------------------

*-----------------------------------------------------------------------
* First: create a Function Group:
* https://www.codejobs.biz/es/blog/2013/12/04/continuacion-aprendiendo-a-desarrollar-en-abap-para-sap-funciones
*-----------------------------------------------------------------------
* Second: create a Function Module on SE37
* http://3.bp.blogspot.com/_AoRAvF7ubXw/SkT_PsOmLBI/AAAAAAAAAJ8/pN-5IAKi3rQ/s1600/java_sap_jco_connector_cfloresj1.gif
* http://2.bp.blogspot.com/_AoRAvF7ubXw/SkT_sxlIHCI/AAAAAAAAAKE/1gCmPkEDuNA/s1600/java_sap_jco_connector_cfloresj2.gif
* http://3.bp.blogspot.com/_AoRAvF7ubXw/SkUAYj-FWwI/AAAAAAAAAKM/vQy0PvYD-18/s1600/java_sap_jco_connector_cfloresj3.gif
* (If you have a warning message, just press Enter)
* Tab "Source code":

FUNCTION Z_DPS_MODULOFX.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(CARRID) TYPE  SPFLI-CARRID OPTIONAL
*"  TABLES
*"      FLIGHT_LIST TYPE  SPFLI_TAB OPTIONAL
*"----------------------------------------------------------------------

RANGES r_carrid FOR SPFLI-CARRID.

IF CARRID NE SPACE.
  r_carrid-sign   = 'I'.
  r_carrid-option = 'EQ'.
  r_carrid-low    = CARRID.
  r_carrid-high   = ''.
  APPEND r_carrid.
ENDIF.

SELECT * FROM SPFLI
  INTO TABLE FLIGHT_LIST
    WHERE CARRID IN r_carrid.

ENDFUNCTION.

* http://4.bp.blogspot.com/_AoRAvF7ubXw/SkUBFSYjL_I/AAAAAAAAAKc/HIXAKTRUj8c/s1600/java_sap_jco_connector_cfloresj5.gif
* Record an activate the function
*-----------------------------------------------------------------------