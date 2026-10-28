-- Uppgift 4: Fyll den normaliserade datamodellen
-- Data hämtas från THE_SKOOL_2025

-- 1. Utbildningsområden
INSERT INTO utbildningsomrade (utbildningomrade_name)
SELECT DISTINCT UTBILDNINGSOMRÅDE
FROM THE_SKOOL_2025
WHERE UTBILDNINGSOMRÅDE IS NOT NULL;

-- 2. SUN5-inriktningar
INSERT INTO sun5_inriktning (
    sun5_kod, utbildningomrade_id, sun5_namn
)
SELECT DISTINCT
    t.SUN5_INRIKTNING,
    u.utbildningomrade_id,
    t.SUN5_INRIKTNING_NAMN
FROM THE_SKOOL_2025 t
JOIN utbildningsomrade u
    ON t.UTBILDNINGSOMRÅDE = u.utbildningomrade_name
WHERE t.SUN5_INRIKTNING IS NOT NULL;

-- 3. SEQF-nivåer
INSERT INTO seqf (seqf_kod, examenstyp)
SELECT DISTINCT SEQF_NIVÅ, EXAMENSTYP
FROM THE_SKOOL_2025
WHERE SEQF_NIVÅ IS NOT NULL;

-- 4. Utbildningsanordnare
INSERT INTO utbildningsanordnare (name, huvudmannatyp)
SELECT DISTINCT
    UTBILDNINGSANORDNARE_ADMINISTR,
    HUVUDMANNATYP
FROM THE_SKOOL_2025
WHERE UTBILDNINGSANORDNARE_ADMINISTR IS NOT NULL;


-- 5. Län
INSERT INTO lan (lan_name)
SELECT DISTINCT LÄN
FROM THE_SKOOL_2025
WHERE LÄN IS NOT NULL;

-- 6. Kommuner
INSERT INTO kommun (kommun_name, lan_id)
SELECT DISTINCT t.KOMMUN, l.lan_id
FROM THE_SKOOL_2025 t
JOIN lan l ON t.LÄN = l.lan_name
WHERE t.KOMMUN IS NOT NULL;

-- 7. Ansökningar
INSERT INTO ansokan (
    diarienummer, sun5_kod, seqf_kod, anordnare_id,
    utbildningsnamn, beslut, yh_poang, studieform,
    studietakt_procent, smalt_yrkesomrade,
    sokta_utbildningsomgangar, beviljade_utbildningsomgangar,
    sokta_platser_totalt, beviljade_platser_totalt
)
SELECT
    t.DIARIENUMMER,
    t.SUN5_INRIKTNING,
    t.SEQF_NIVÅ,
    a.anordnare_id,
    t.UTBILDNINGSNAMN,
    t.BESLUT,
    t.YH_POÄNG,
    t.STUDIEFORM,
    t."STUDIETAKT_#",
    t.SMALT_YRKESOMRÅDE,
    t.SÖKTA_UTBILDNINGSOMGÅNGAR,
    t.BEVILJADE_UTBILDNINGSOMGÅNGAR,
    t.SÖKTA_PLATSER_TOTALT,
    t.BEVILJADE_PLATSER_TOTALT
FROM THE_SKOOL_2025 t
LEFT JOIN utbildningsanordnare a
    ON t.UTBILDNINGSANORDNARE_ADMINISTR = a.name
    AND t.HUVUDMANNATYP = a.huvudmannatyp;

-- 8. Koppling mellan ansökningar och kommuner
INSERT INTO ansokan_kommun (diarienummer, kommun_id)
SELECT t.DIARIENUMMER, k.kommun_id
FROM THE_SKOOL_2025 t
JOIN lan l ON t.LÄN = l.lan_name
JOIN kommun k
    ON t.KOMMUN = k.kommun_name
    AND k.lan_id = l.lan_id;

COMMIT;

