-- Uppgift 3e: Antal beviljade utbildningsomgångar
-- Fråga: Hur många utbildningsomgångar beviljas
-- vanligtvis per godkänd ansökan?
-- Syfte: Hjälpa The Skool att planera verksamheten
-- utifrån hur många omgångar som brukar beviljas.

SELECT
    beviljade_utbildningsomgångar AS antal_omgangar,
    COUNT(*) AS antal_ansokningar,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 1
    ) AS andel_procent
FROM the_skool_2025
WHERE beslut = 'Beviljad'
GROUP BY beviljade_utbildningsomgångar
ORDER BY antal_omgangar;
