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

### Adjuncts ###
* Name (string)
* Type (exclusive)
    * Spice (0)
    * Fining (1)
    * Herb (2)
    * Flavor (3)
    * Other (4)
    * Water Agent (5)
* Unit (exclusive)
    * grams (1)
    * mililiters (2 * 29.5735 | 6 * 4,92892 | 7 * 14,7868)
    * pieces (13)
* Notes (string)
* Qty/l (float)
* Use (exclusive)
    * Boil (0)
    * Mash (1)
    * Primary (2)
    * Secondary (3)
    * Bottling (4)
* Use for (string)
* Time (float)
* Time Unit
    * minutes (0)
    * hours (1)
    * days (2)

### Style ###
* Name (string)
* Category (integer)
* Subcategory (string)
* Aroma (string)
* Appearance (string)
* Flavour (string)
* Mouthfeel (string)
* Impression (string)
* Comments (string)
* Ingredients (string)
* IBU max (integer)
* IBU min (integer)
* SRM max (integer)
* SRM min (integer)
* OG max (float)
* OG min (float)
* FG max (float)
* FG min (float)
* ABV max (float)
* ABV min (float)

### Receipe ###
* Name (string)
* Target Volume [liters] (integer)
* Grain (list of grains)
    * ammount [kg]
* Type (exclusive)
    * All Grain
    * Partial-mash
    * Extract
* Hop (list of hops)
    * Ammount [grams] (integer)
    * Use (exclusive)
        * Boil
        * Dry Hop
        * Mash
        * First Wart
    * Boli / Steep time [minutes] (integer)
    * Dry hopping time [days] (integer)
* Yeast (list of yeasts)
    * Ammount [g] (integer)
* Adjunct (List of adjuncts)
    * Use during (exclusive)
        * Boil
        * Mash
        * Primary fermentation
        * Secundary Fermentation
        * Bottling
    * Time [minutes] (integer)