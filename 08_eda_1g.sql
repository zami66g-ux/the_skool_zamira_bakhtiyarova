-- Uppgift 1g: De fem län med flest beviljade ansökningar

SELECT
    län,
    COUNT(*) AS antal_beviljade
FROM the_skool_2025
WHERE beslut = 'Beviljad'
AND län <> 'Flera kommuner'
GROUP BY län
ORDER BY antal_beviljade DESC
FETCH FIRST 5 ROWS ONLY;
