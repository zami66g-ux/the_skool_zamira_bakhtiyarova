-- Uppgift 3c: Beviljandegrad per huvudmannatyp
-- Fråga: Har privata, kommunala eller regionala
-- utbildningsanordnare högst beviljandegrad?
-- Syfte: Undersöka hur privata aktörer, som The Skool,
-- står sig jämfört med offentliga huvudmän.

SELECT
    huvudmannatyp,
    COUNT(*) AS antal_ansokningar,
    SUM(CASE WHEN beslut = 'Beviljad' THEN 1 ELSE 0 END) AS antal_beviljade,
    ROUND(
        SUM(CASE WHEN beslut = 'Beviljad' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 1
    ) AS beviljandegrad_procent
FROM the_skool_2025
GROUP BY huvudmannatyp
ORDER BY beviljandegrad_procent DESC;
