INSERT INTO playerstatistics (playerid, seasonid, goals, assists, minutesplayed, yellowcards, redcards)
SELECT playerid, seasonid, goals, assists, minutesplayed, yellowcards, redcards
FROM (
         -- Season 2022/2023
         SELECT 1 AS playerid, 3 AS seasonid, 10 AS goals, 5 AS assists, 2400 AS minutesplayed, 3 AS yellowcards, 0 AS redcards FROM dual UNION ALL
         SELECT 2, 3, 7, 3, 2200, 4, 1 FROM dual UNION ALL
         SELECT 3, 3, 15, 8, 2700, 2, 0 FROM dual UNION ALL
         SELECT 4, 3, 5, 10, 2300, 1, 0 FROM dual UNION ALL
         SELECT 5, 3, 8, 7, 2500, 3, 0 FROM dual UNION ALL

         -- Season 2023/2024
         SELECT 1, 4, 12, 6, 2500, 2, 0 FROM dual UNION ALL
         SELECT 2, 4, 9, 4, 2300, 5, 1 FROM dual UNION ALL
         SELECT 3, 4, 18, 6, 2800, 1, 0 FROM dual UNION ALL
         SELECT 4, 4, 4, 9, 2400, 2, 0 FROM dual UNION ALL
         SELECT 5, 4, 10, 6, 2600, 2, 0 FROM dual UNION ALL

         -- Additional Players
         SELECT 6, 3, 6, 3, 2000, 2, 0 FROM dual UNION ALL
         SELECT 6, 4, 5, 2, 2100, 1, 0 FROM dual UNION ALL
         SELECT 7, 3, 20, 10, 2900, 4, 0 FROM dual UNION ALL
         SELECT 7, 4, 15, 8, 2700, 3, 0 FROM dual UNION ALL
         SELECT 8, 3, 2, 5, 2200, 1, 0 FROM dual UNION ALL
         SELECT 8, 4, 3, 4, 2300, 1, 0 FROM dual UNION ALL

         -- Randomized Player Stats for Other Players
         SELECT 9, 3, 5, 4, 1800, 3, 0 FROM dual UNION ALL
         SELECT 10, 3, 7, 6, 1900, 2, 0 FROM dual UNION ALL
         SELECT 11, 3, 3, 2, 1500, 1, 0 FROM dual UNION ALL
         SELECT 12, 4, 9, 5, 2400, 3, 1 FROM dual UNION ALL
         SELECT 13, 4, 6, 3, 2100, 2, 0 FROM dual UNION ALL
         SELECT 14, 4, 2, 4, 1500, 0, 0 FROM dual UNION ALL
         SELECT 15, 4, 4, 5, 2000, 1, 0 FROM dual UNION ALL
         SELECT 16, 4, 8, 2, 2200, 1, 0 FROM dual
     )
