# README #

### Hop ###
* Name (string)
* Origin (string)
* Type (exclusive)
    * bittering (0)
    * aroma (1)
    * both (2)
* Form (exclusive)
    * pellet (0)
    * plug
    * leaf
* Acids
    * Alpha (float)
    * Beta (float)
* Hop Storing Index (HSI) (float)
* Notes (string)

### Grain ###
* Name (string)
* Origin (string)
* Type (exclusive)
    * Malt (0)
    * Extract (1)
    * Sugar (2)
    * Adjunct (3)
    * Dry extract (4)
* Color (SRM) (integer)
* Yield (float)
* FG/CG (fine grain / coarse grain) (float)
* Moisture (float)
* DP (siastatic power) (float)
* Proteins (float)
* Max in batch (float)
* Notes (string) (float)

### Yeast ###
* Name (string)
* Lab (string)
* ID (string)
* Type (exclusive)
    * Ale
    * Lager
    * Wine
    * Champagne
    * Wheat
* Form (exclusive)
    * Liquid
    * Dry
    * Slant
    * Culture
* Flocculation (exclusive)
    * Low
    * Medium
    * High
* Min. Attenuation (float)
* Max. Attenuation (float)
* Min. Temperature (float)
* Max. Temperature (float)
* Best for (Styles list)
* Notes (string)

### Style ###
* 