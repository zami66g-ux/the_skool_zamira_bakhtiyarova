-- Uppgift 1e: Antal avslagna ansökningar per utbildningsnamn inom Data/IT

SELECT
    utbildningsnamn,
    COUNT(*) AS antal_avslag
FROM the_skool_2025
WHERE utbildningsområde = 'Data/IT'
    AND beslut = 'Avslag'
GROUP BY utbildningsnamn
ORDER BY antal_avslag DESC;
