-- Uppgift 3b: Beviljandegrad per studieform
-- Fråga: Har distansutbildningar eller bundna utbildningar
-- högst beviljandegrav?
-- Syfte: Hjälpa The Skool att välja studieform
-- utifrån tidigare beviljade ansökningar.

SELECT
    studieform,
    COUNT(*) AS antal_ansokningar,
    SUM(CASE WHEN beslut = 'Beviljad' THEN 1 ELSE 0 END) AS antal_beviljade,
    ROUND(
        SUM(CASE WHEN beslut = 'Beviljad' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 1
    ) AS beviljandegrad_procent
FROM the_skool_2025
GROUP BY studieform
ORDER BY beviljandegrad_procent DESC;
