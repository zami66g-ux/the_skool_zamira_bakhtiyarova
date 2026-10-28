-- Uppgift 3a: Beviljandegrad per utbildningsområde
-- Fråga: Vilka utvimdningsområden har högst beviljandegrad?
-- Syfte: Hjälpa The Skool att identifiera områden,
-- där en större andel ansäkningar har blivit beviljade

SELECT
    utbildningsområde,
    COUNT(*) AS antal_ansokningar,
    SUM(CASE WHEN beslut = 'Beviljad' THEN 1 ELSE 0 END) AS antal_beviljade,
    ROUND(
        SUM(CASE WHEN beslut = 'Beviljad' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 1
    ) AS beviljandegrad_procent
FROM the_skool_2025
GROUP BY utbildningsområde
ORDER BY beviljandegrad_procent DESC;
