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

DATA: Name(100)   TYPE I,
      B           TYPE I VALUE 7,
      C           TYPE I VALUE 3,
      Text(10) TYPE C VALUE 'Res: '.

WRITE: 'Hola mundo',' | ','Name01: ',Name,' | '.

Name = B + C.

WRITE: Text,Name,' | '.

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
      'C: ',String,' '
      ,'F: ',Float,' '
      ,'I: ',Int,' '
      ,'N: ',TextNumber,' '
      ,'P: ',PackNumber,' '
      ,'X: ',Hex,' '
      ,'D: ',Date,' '
      ,'T: ',Time,' '.

*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&Section two: Internal tables
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*

*Internal Table: Dynamic structure that is stored on the RAM