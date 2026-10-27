-- Uppgift 1c: Antal avslagna ansökningar per utbildningsområde

SELECT
    utbildningsområde,
    COUNT(*) AS antal_avslag
FROM the_skool_2025
WHERE beslut = 'Avslag'
GROUP BY utbildningsområde
ORDER BY antal_avslag DESC;
