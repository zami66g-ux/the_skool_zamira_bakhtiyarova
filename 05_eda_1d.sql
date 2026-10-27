-- Uppgift 1d: Beviljade ansökningar per utbildningsnamn inom Data/IT

SELECT
    utbildningsnamn,
    COUNT(*) AS antal_beviljade
FROM the_skool_2025
WHERE utbildningsområde = 'Data/IT'
    AND beslut = 'Beviljad'
GROUP BY utbildningsnamn
ORDER BY antal_beviljade DESC;
