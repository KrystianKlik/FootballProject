INSERT INTO teamsponsors (teamid, sponsorid, sponsorshipdetails)
SELECT teamid, sponsorid, sponsorshipdetails
FROM (
         -- Legia Warszawa Sponsors
         SELECT 1 AS teamid, 1 AS sponsorid, 'Orlen - Main shirt sponsor' AS sponsorshipdetails FROM dual UNION ALL
         SELECT 1, 5, 'Comarch - IT solutions sponsor' FROM dual UNION ALL

         -- Lech Poznań Sponsors
         SELECT 2, 3, 'STS Bet - Shirt and stadium branding sponsor' FROM dual UNION ALL
         SELECT 2, 10, 'Eko-Okna - Regional sponsor' FROM dual UNION ALL

         -- Raków Częstochowa Sponsors
         SELECT 3, 6, 'X-Kom - Digital branding sponsor' FROM dual UNION ALL
         SELECT 3, 4, 'KGHM Polska Miedź - Main sponsor with stadium branding' FROM dual UNION ALL

         -- Pogoń Szczecin Sponsors
         SELECT 4, 7, 'Grupa Azoty - Local chemical industry partner' FROM dual UNION ALL
         SELECT 4, 11, 'Radomskie Centrum Onkologii - Healthcare sponsor' FROM dual UNION ALL

         -- Lechia Gdańsk Sponsors
         SELECT 5, 2, 'Lotos - Main sponsor and stadium naming rights' FROM dual UNION ALL
         SELECT 5, 9, 'Suzuki - Automotive partner' FROM dual UNION ALL

         -- Śląsk Wrocław Sponsors
         SELECT 6, 4, 'KGHM Polska Miedź - Main sponsor with community outreach' FROM dual UNION ALL
         SELECT 6, 13, 'Green Point - Sustainability initiative sponsor' FROM dual UNION ALL

         -- Cracovia Sponsors
         SELECT 7, 5, 'Comarch - Technology sponsor' FROM dual UNION ALL
         SELECT 7, 8, 'Totalbet - Betting partner' FROM dual UNION ALL

         -- Górnik Zabrze Sponsors
         SELECT 8, 4, 'KGHM Polska Miedź - Community sponsorship agreement' FROM dual UNION ALL
         SELECT 8, 14, 'Polsat Plus - Broadcast sponsor' FROM dual UNION ALL

         -- Wisła Płock Sponsors
         SELECT 9, 1, 'Orlen - Long-term energy partnership' FROM dual UNION ALL
         SELECT 9, 10, 'Eko-Okna - Window manufacturing sponsor' FROM dual UNION ALL

         -- Jagiellonia Białystok Sponsors
         SELECT 10, 3, 'STS Bet - Shirt sponsor and digital branding' FROM dual UNION ALL
         SELECT 10, 11, 'Radomskie Centrum Onkologii - Healthcare initiative partner' FROM dual UNION ALL

         -- Piast Gliwice Sponsors
         SELECT 11, 9, 'Suzuki - Transportation and eco-friendly vehicle sponsor' FROM dual UNION ALL
         SELECT 11, 15, 'DHL - Logistics partnership for events' FROM dual UNION ALL

         -- Zagłębie Lubin Sponsors
         SELECT 12, 4, 'KGHM Polska Miedź - Long-term main sponsor' FROM dual UNION ALL
         SELECT 12, 8, 'Totalbet - Betting partner for local promotions' FROM dual UNION ALL

         -- Radomiak Radom Sponsors
         SELECT 13, 11, 'Radomskie Centrum Onkologii - Local healthcare sponsorship' FROM dual UNION ALL
         SELECT 13, 13, 'Green Point - Sustainability partner with local initiatives' FROM dual UNION ALL

         -- Warta Poznań Sponsors
         SELECT 14, 10, 'Eko-Okna - Regional branding partner' FROM dual UNION ALL
         SELECT 14, 15, 'DHL - Transportation partnership for logistics' FROM dual UNION ALL

         -- Korona Kielce Sponsors
         SELECT 15, 8, 'Totalbet - Shirt branding sponsor' FROM dual UNION ALL
         SELECT 15, 7, 'Grupa Azoty - Regional partnership' FROM dual UNION ALL

         -- Miedź Legnica Sponsors
         SELECT 16, 12, 'Legnickie Przedsiębiorstwo Wodociągów - Local water supply sponsor' FROM dual UNION ALL
         SELECT 16, 9, 'Suzuki - Automotive sponsor and regional branding' FROM dual
     )
