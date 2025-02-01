INSERT INTO sponsors (name, sponsorshiptype, contractdetails)
SELECT name, sponsorshiptype, contractdetails
FROM (
         SELECT 'Orlen' AS name, 'Main Sponsor' AS sponsorshiptype, '3-year contract, exclusive branding rights' AS contractdetails FROM dual UNION ALL
         SELECT 'Lotos', 'Main Sponsor', '2-year contract, stadium branding included' FROM dual UNION ALL
         SELECT 'STS Bet', 'Betting Partner', '4-year contract, shirt branding rights' FROM dual UNION ALL
         SELECT 'KGHM Polska Miedź', 'Main Sponsor', '5-year contract, stadium name rights' FROM dual UNION ALL
         SELECT 'Comarch', 'Technology Partner', '3-year contract, IT services sponsorship' FROM dual UNION ALL
         SELECT 'X-Kom', 'Technology Partner', '2-year contract, digital branding' FROM dual UNION ALL
         SELECT 'Grupa Azoty', 'Chemical Partner', '3-year contract, local partnership' FROM dual UNION ALL
         SELECT 'Totalbet', 'Betting Partner', '2-year contract, stadium branding rights' FROM dual UNION ALL
         SELECT 'Suzuki', 'Automotive Partner', '3-year contract, vehicle supply agreement' FROM dual UNION ALL
         SELECT 'Eko-Okna', 'Window Manufacturer', '4-year contract, local branding rights' FROM dual UNION ALL
         SELECT 'Radomskie Centrum Onkologii', 'Healthcare Partner', '1-year contract, community support program' FROM dual UNION ALL
         SELECT 'Green Point', 'Sustainability Partner', '3-year contract, eco-friendly initiative branding' FROM dual UNION ALL
         SELECT 'Legnickie Przedsiębiorstwo Wodociągów', 'Utility Partner', '2-year contract, local sponsorship deal' FROM dual UNION ALL
         SELECT 'Polsat Plus', 'Broadcast Partner', '5-year contract, league broadcast rights' FROM dual UNION ALL
         SELECT 'DHL', 'Logistics Partner', '3-year contract, transportation sponsorship' FROM dual
     )
