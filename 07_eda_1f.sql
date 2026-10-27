-- Uppgift 1f: Beviljade ansökningar per utbildningsanordnare
-- och utbildningsnamn inom Data/IT

SELECT
    utbildningsanordnare_administr,
    utbildningsnamn,
    COUNT(*) AS antal_beviljade
FROM the_skool_2025
WHERE utbildningsområde = 'Data/IT'
    AND beslut = 'Beviljad'
GROUP BY
    utbildningsanordnare_administr,
    utbildningsnamn
ORDER BY antal_beviljade DESC;
