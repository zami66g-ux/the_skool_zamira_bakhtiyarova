-- Uppgift 3d: Beviljandegrad per SUN5-inriktning inom Data/IT
-- Fråga: Vilka SUN5-inriktningar inom Data/IT
-- har högst beviljandegrad?
-- Syfte: Hjälpa The Skool att identifiera inriktningar
-- som kan vara intressanta trots låg beviljandegrad inom Data/IT.

SELECT
    sun5_inriktning,
    sun5_inriktning_namn,
    COUNT(*) AS antal_ansokningar,
    SUM(CASE WHEN beslut = 'Beviljad' THEN 1 ELSE 0 END) AS antal_beviljade,
    ROUND(
        SUM(CASE WHEN beslut = 'Beviljad' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 1
    ) AS beviljandegrad_procent
FROM the_skool_2025
WHERE utbildningsområde = 'Data/IT'
GROUP BY sun5_inriktning, sun5_inriktning_namn
ORDER BY beviljandegrad_procent DESC;
