*&---------------------------------------------------------------------*
*& Report  Z_DPS_001
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

*Every sentence ends with a point (.)
*Diskette icon to save, or CTRL+S
*Must activate the program CTRL+F3

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

*Declare Var:
*   Name01  -> Length = 100
*   B       -> Default Value = 500
DATA: Name(100)   TYPE I,
      B           TYPE I VALUE 7,
      C           TYPE I VALUE 3,
      Text(10) TYPE C VALUE 'Res: '.

*Print
WRITE: 'Hola mundo'.
WRITE: ' | '.

WRITE: 'Name01: ',Name.
WRITE: ' | '.

Name = B + C.

WRITE: Text,Name.
WRITE: ' | '.