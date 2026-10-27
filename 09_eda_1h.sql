-- Uppgift 1h: Andel distans och bunden per utbildningsområde

SELECT
    utbildningsområde,
    studieform,
    COUNT(*) AS antal,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY utbildningsområde),
        1
    ) AS andel_procent
FROM the_skool_2025
GROUP BY utbildningsområde, studieform
ORDER BY utbildningsområde, studieform;
