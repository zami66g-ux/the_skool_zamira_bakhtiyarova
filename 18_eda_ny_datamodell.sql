-- BONUS Uppgift 4
-- Uppgift 1a: Antal ansökningar per utbildningsområde
-- Använder den normaliserade datamodellen

SELECT
    u.utbildningomrade_name AS utbildningsomrade,
    COUNT(*) AS antal_ansokningar
FROM ansokan a
JOIN sun5_inriktning s
    ON a.sun5_kod = s.sun5_kod
JOIN utbildningsomrade u
    ON s.utbildningomrade_id = u.utbildningomrade_id
GROUP BY u.utbildningomrade_name
ORDER BY antal_ansokningar DESC;

-- Uppgift 1b: Antal BEVILJADE ansökningar per utbildningsområde

SELECT
    u.utbildningomrade_name AS utbildningsomrade,
    COUNT(*) AS antal_beviljade
FROM ansokan a
JOIN sun5_inriktning s
    ON a.sun5_kod = s.sun5_kod
JOIN utbildningsomrade u
    ON s.utbildningomrade_id = u.utbildningomrade_id
WHERE UPPER(TRIM(a.beslut)) = 'BEVILJAD'
GROUP BY u.utbildningomrade_name
ORDER BY antal_beviljade DESC;

-- Uppgift 1c: Antal AVSLAGNA ansökningar per utbildningsområde

SELECT
    u.utbildningomrade_name AS utbildningsomrade,
    COUNT(*) AS antal_avslag
FROM ansokan a
JOIN sun5_inriktning s
    ON a.sun5_kod = s.sun5_kod
JOIN utbildningsomrade u
    ON s.utbildningomrade_id = u.utbildningomrade_id
WHERE a.beslut = 'Avslag'
GROUP BY u.utbildningomrade_name
ORDER BY antal_avslag DESC;

-- Uppgift 1d: Beviljade ansökningar per utbildningsnamn inom Data/IT

SELECT
    a.utbildningsnamn,
    COUNT(*) AS antal_beviljade
FROM ansokan a
JOIN sun5_inriktning s
    ON a.sun5_kod = s.sun5_kod
JOIN utbildningsomrade u
    ON s.utbildningomrade_id = u.utbildningomrade_id
WHERE u.utbildningomrade_name = 'Data/IT'
    AND a.beslut = 'Beviljad'
GROUP BY a.utbildningsnamn
ORDER BY antal_beviljade DESC;

-- Uppgift 1e: Antal AVSLAGNA ansökningar per utbildningsnamn inom Data/IT

SELECT
    a.utbildningsnamn,
    COUNT(*) AS antal_avslag
FROM ansokan a
JOIN sun5_inriktning s
    ON a.sun5_kod = s.sun5_kod
JOIN utbildningsomrade u
    ON s.utbildningomrade_id = u.utbildningomrade_id
WHERE u.utbildningomrade_name = 'Data/IT'
    AND a.beslut = 'Avslag'
GROUP BY a.utbildningsnamn
ORDER BY antal_avslag DESC;

-- Uppgift 1f: Beviljade ansökningar per utbildningsanordnare
-- och utbildningsnamn inom Data/IT

SELECT
    ua.name AS utbildningsanordnare_administr,
    a.utbildningsnamn,
    COUNT(*) AS antal_beviljade
FROM ansokan a
JOIN utbildningsanordnare ua
    ON a.anordnare_id = ua.anordnare_id
JOIN sun5_inriktning s
    ON a.sun5_kod = s.sun5_kod
JOIN utbildningsomrade u
    ON s.utbildningomrade_id = u.utbildningomrade_id
WHERE u.utbildningomrade_name = 'Data/IT'
    AND a.beslut = 'Beviljad'
GROUP BY
    ua.name,
    a.utbildningsnamn
ORDER BY antal_beviljade DESC;

-- Uppgift 1g: De fem län med flest beviljade ansökningar

SELECT
    l.lan_name AS lan,
    COUNT(*) AS antal_beviljade
FROM ansokan a
JOIN ansokan_kommun ak
    ON a.diarienummer = ak.diarienummer
JOIN kommun k
    ON ak.kommun_id = k.kommun_id
JOIN lan l
    ON k.lan_id = l.lan_id
WHERE a.beslut = 'Beviljad'
    AND l.lan_name <> 'Flera kommuner'
GROUP BY l.lan_name
ORDER BY antal_beviljade DESC
FETCH FIRST 5 ROWS ONLY;

-- Uppgift 1h: Andel distans och bunden per utbildningsområde

SELECT
    u.utbildningomrade_name AS utbildningsomrade,
    a.studieform,
    COUNT(*) AS antal,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (
            PARTITION BY u.utbildningomrade_name
        ),
        1
    ) AS andel_procent
FROM ansokan a
JOIN sun5_inriktning s
    ON a.sun5_kod = s.sun5_kod
JOIN utbildningsomrade u
    ON s.utbildningomrade_id = u.utbildningomrade_id
GROUP BY
    u.utbildningomrade_name,
    a.studieform
ORDER BY
    u.utbildningomrade_name,
    a.studieform;

-- Uppgift 1i: Antal unika utbildningsnamn med AI i namnet

SELECT
    COUNT(DISTINCT utbildningsnamn) AS antal_ai_utbildningar
FROM ansokan
WHERE REGEXP_LIKE(
    utbildningsnamn,
    '(^|[^[:alpha:]])AI([^[:alpha:]]|$)',
    'i'
);
