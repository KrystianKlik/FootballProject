INSERT INTO transfers (playerid, fromteamid, toteamid, transferdate, transferfee)
SELECT playerid, fromteamid, toteamid, transferdate, transferfee
FROM (
         SELECT 1 AS playerid, 1 AS fromteamid, 2 AS toteamid, DATE '2023-07-01' AS transferdate, 2000000.00 AS transferfee FROM dual UNION ALL
         SELECT 2, 1, 3, DATE '2023-06-15', 1500000.00 FROM dual UNION ALL
         SELECT 3, 3, 4, DATE '2023-08-01', 1700000.00 FROM dual UNION ALL
         SELECT 4, 2, 5, DATE '2023-06-20', 1300000.00 FROM dual UNION ALL
         SELECT 5, 4, 6, DATE '2023-07-10', 1100000.00 FROM dual UNION ALL
         SELECT 6, 5, 7, DATE '2023-07-25', 850000.00 FROM dual UNION ALL
         SELECT 7, 6, 8, DATE '2023-06-30', 900000.00 FROM dual UNION ALL
         SELECT 8, 8, 1, DATE '2023-07-05', 3000000.00 FROM dual UNION ALL
         SELECT 9, 7, 10, DATE '2023-07-15', 700000.00 FROM dual UNION ALL
         SELECT 10, 9, 11, DATE '2023-08-05', 1100000.00 FROM dual UNION ALL
         SELECT 11, 10, 12, DATE '2023-07-18', 1200000.00 FROM dual UNION ALL
         SELECT 12, 11, 13, DATE '2023-08-01', 500000.00 FROM dual UNION ALL
         SELECT 13, 12, 14, DATE '2023-07-25', 600000.00 FROM dual UNION ALL
         SELECT 14, 13, 16, DATE '2023-08-10', 550000.00 FROM dual UNION ALL
         SELECT 15, 15, 2, DATE '2023-07-01', 450000.00 FROM dual
     )
