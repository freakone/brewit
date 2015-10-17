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
    * Ale (0)
    * Lager(1)
    * Wine(2)
    * Champagne (3)
    * Wheat(4)
* Form (exclusive)
    * Liquid (0)
    * Dry (1)
    * Slant
    * Culture
* Flocculation (exclusive)
    * Low (0)
    * Medium (1)
    * High (2)
* Min. Attenuation (float)
* Max. Attenuation (float)
* Min. Temperature (float)
* Max. Temperature (float)
* Best for (Styles list)
* Notes (string)

### Miscs ###
* Name (string)
* Type (exclusive)
    * Spice (0)
    * Fining (1)
    * Herb (2)
    * Flavor (3)
    * Other (4)
    * Water Agent (5)
* Unit
    * grams (1)
    * liters (2 * 0.0295735)
    * teaspoon (6)
    * tablespoon (7)
    * pieces (13)
    * cups
* Notes
* Qty/l
* Use
    * Boil (0)
    * Mash (1)
    * Primary (2)
    * Secondary (3)
    * Bottling (4)
* Use for (string)
* Time
* Time Unit
    * minutes (0)
    * hours (1)
    * days (2)