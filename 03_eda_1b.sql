-- Uppgift 1b: Antal beviljade ansökningar per utbildningsområde

SELECT
    utbildningsområde,
    COUNT(*) AS antal_beviljade
FROM the_skool_2025
WHERE beslut = 'Beviljad'
GROUP BY utbildningsområde
ORDER BY antal_beviljade DESC;
