*&---------------------------------------------------------------------*
*& Report  Z_DPS_001: This is the first example that I'm doing on ABAP.
*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&Section one: Basics and datatypes.
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*

*Every sentence ends with a point (.)
*Diskette icon to save, or CTRL+S
*Must activate the program before running CTRL+F3

*Data types:
*|Type|Default Length | Length            |Default Value|Description  |
*|----|---------------|-------------------|-------------|-------------|
*| C  | 1             |1->32000           | SPACES      |String       |
*| F  | 8             |1E-307->1E+308     | 0.0E+00     |Float        |
*| I  | 4             |-2^(31)->2^(31)-1  | 0           |Int          |
*| N  | 1             |1->32000           | '0000'      |Number Text  |
*| P  | 8             |1->16              | 0           |Packaging Num|
*| X  | 1             |1->29870           | x'00'       |Hex          |
*| D  | 8             |8                  | 00000000    |Date YYYYMMDD|
*| T  | 6             |6                  | 000000      |Time HHMMSS  |

REPORT  Z_DPS_001.

DATA: Name(10)  TYPE I,
      B         TYPE I VALUE 7,
      C         TYPE I VALUE 3,
      Text(10)  TYPE C VALUE 'Res: '.

WRITE:  'Antes de la operación:',
        /'Name01: ',Name.

Name = B + C.

WRITE:  /,/'Después de la operación:'
        ,/ Text,Name,/.

*&---------------------------------------------------------------------*

DATA:
      String(13)  TYPE C VALUE 'Soy un string'
      ,Float      TYPE F VALUE '2.3E+4'
      ,Int        TYPE I VALUE 8
      ,TextNumber TYPE N VALUE '1234'
      ,PackNumber TYPE P VALUE 7
      ,Hex        TYPE X VALUE 'A41E0'
      ,Date       TYPE D VALUE '19870411'
      ,Time       TYPE T VALUE '120000'.

WRITE:
      /,/ 'Tipos de dato con valor:'
      ,/'C: ',String
      ,/'F: ',Float
      ,/'I: ',Int
      ,/'N: ',TextNumber
      ,/'P: ',PackNumber
      ,/'X: ',Hex
      ,/'D: ',Date
      ,/'T: ',Time,/.

*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&Section two: Internal tables
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*

*Internal Table: Dynamic structure that is stored on the RAM. Internal
*Tables has header. All data pass through the header, before being
*stored in the Table. Without header, we can't recover data.

DATA:
      BEGIN OF ti_person
*OCCURS->Header: Indicates the number of records. Zero means no-limit.
        OCCURS 0
        ,Name(16)   TYPE C
        ,LName(16)  TYPE C
        ,Age(3)     TYPE I
        ,Date       TYPE D
        ,END OF ti_person.

ti_person-Name = 'Daniel'.
ti_person-LName = 'Pavez'.
ti_person-Age = 29.
ti_person-Date = SY-DATUM.
APPEND ti_person.

ti_person-Name = 'Juan'.
ti_person-LName = 'Pérez'.
ti_person-Age = 18.
ti_person-Date = SY-DATUM.
APPEND ti_person.

WRITE: /,/ 'Tabla 1:'.

LOOP AT ti_person.
  WRITE:
          / ti_person-Name
          ,ti_person-LName
          ,ti_person-Age
          ,ti_person-Date.
ENDLOOP.

DATA:
*This is a Structure (don't have a header)
      BEGIN OF st_person
        ,Name2(16)  TYPE C
        ,LName2(16) TYPE C
        ,Age2(3)    TYPE I
        ,Date2      TYPE D
        ,END OF st_person.

DATA:
      ti_person2 LIKE TABLE OF st_person WITH HEADER LINE.

ti_person2-Name2 = 'Maria'.
ti_person2-LName2 = 'González'.
ti_person2-Age2 = 20.
ti_person2-Date2 = SY-DATUM.
APPEND ti_person2.

ti_person2-Name2 = 'Camilo'.
ti_person2-LName2 = 'Muñoz'.
ti_person2-Age2 = 25.
ti_person2-Date2 = SY-DATUM.
APPEND ti_person2.

WRITE: /,/ 'Tabla 2:'.

LOOP AT ti_person2.
  WRITE:
          / ti_person2-Name2
          ,ti_person2-LName2
          ,ti_person2-Age2
          ,ti_person2-Date2.
ENDLOOP.