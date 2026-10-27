-- Uppgift 1i: Antal unika utbildningsnamn med AI i namnet

SELECT COUNT(DISTINCT utbildningsnamn) AS antal_ai_utbildningar
FROM the_skool_2025
WHERE REGEXP_LIKE(
    utbildningsnamn,
    '(^|[^[:alpha:]])AI([^[:alpha:]]|$)',
    'i'
);
