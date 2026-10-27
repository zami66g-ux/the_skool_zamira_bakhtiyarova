-- Uppgift 1a: Antal ansökningar per utbildningsområde

SELECT
    utbildningsområde,
    COUNT(*) AS antal_ansokningar
FROM the_skool_2025
GROUP BY utbildningsområde
ORDER BY antal_ansokningar DESC;
