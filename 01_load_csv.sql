-- Importera MYH:s utbildningsdata till Oracle
SET LOAD SCAN_ROWS 5000

-- Visa tabellstrukturen utan att skapa tabellen
LOAD the_skool_2025 /work/the_skool_2025_oracle.csv NEW
