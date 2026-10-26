-- ============================================
-- UPPGIFT 4 - INSERT
-- The Skool
-- ============================================

-- 1. UTBILDNINGSOMRADE

INSERT INTO utbildningsomrade (utbildningsomrade_name)
SELECT DISTINCT utbildningsområde
FROM data_lab
WHERE utbildningsområde IS NOT NULL;


-- 2. SEQF

INSERT INTO seqf (seqf_kod, examenstyp)
SELECT
    seqf_nivå,
    MAX(examenstyp)
FROM data_lab
WHERE seqf_nivå IS NOT NULL
GROUP BY seqf_nivå;


-- 3. UTBILDNINGSANORDNARE

INSERT INTO utbildningsanordnare (name, huvudmannatyp)
SELECT
    utbildningsanordnare_administr,
    MAX(huvudmannatyp)
FROM data_lab
WHERE utbildningsanordnare_administr IS NOT NULL
GROUP BY utbildningsanordnare_administr;


-- 4. LAN

INSERT INTO lan (lan_name)
SELECT DISTINCT län
FROM data_lab
WHERE län IS NOT NULL;


-- 5. SUN5_INRIKTNING

INSERT INTO sun5_inriktning (
    sun5_kod,
    utbildningsomrade_id,
    sun5_namn
)
SELECT
    d.sun5_inriktning,
    MIN(u.utbildningsomrade_id),
    MAX(d.sun5_inriktning_namn)
FROM data_lab d
JOIN utbildningsomrade u
    ON d.utbildningsområde = u.utbildningsomrade_name
WHERE d.sun5_inriktning IS NOT NULL
GROUP BY d.sun5_inriktning;


-- 6. KOMMUN

INSERT INTO kommun (kommun_name, lan_id)
SELECT DISTINCT
    d.kommun,
    l.lan_id
FROM data_lab d
JOIN lan l
    ON d.län = l.lan_name
WHERE d.kommun IS NOT NULL;


-- 7. ANSOKAN

INSERT INTO ansokan (
    diarienummer,
    sun5_kod,
    seqf_kod,
    anordnare_id,
    utbildningsnamn,
    beslut,
    yh_poang,
    studieform,
    studietakt_procent,
    smalt_yrkesomrade,
    sokta_utbildningsomgangar,
    beviljade_utbildningsomgangar,
    sokta_platser_totalt,
    beviljade_platser_totalt
)
SELECT
    d.diarienummer,
    d.sun5_inriktning,
    d.seqf_nivå,
    a.anordnare_id,
    d.utbildningsnamn,
    d.beslut,
    d.yh_poäng,
    d.studieform,
    d."STUDIETAKT_#",
    d.smalt_yrkesområde,
    d.sökta_utbildningsomgångar,
    d.beviljade_utbildningsomgångar,
    d.sökta_platser_totalt,
    d.beviljade_platser_totalt
FROM data_lab d
LEFT JOIN utbildningsanordnare a
    ON d.utbildningsanordnare_administr = a.name;


-- 8. ANSOKAN_KOMMUN

INSERT INTO ansokan_kommun (
    diarienummer,
    kommun_id
)
SELECT
    d.diarienummer,
    k.kommun_id
FROM data_lab d
JOIN lan l
    ON d.län = l.lan_name
JOIN kommun k
    ON d.kommun = k.kommun_name
   AND k.lan_id = l.lan_id;


COMMIT;
exit
