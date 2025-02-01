INSERT INTO matches (matchdate, hometeamid, awayteamid, homescore, awayscore, stadiumid, refereeid)
SELECT matchdate, hometeamid, awayteamid, homescore, awayscore, stadiumid, refereeid
FROM (
         -- Round 1
         SELECT TO_DATE('2023-08-01 18:00:00', 'YYYY-MM-DD HH24:MI:SS') AS matchdate, 1 AS hometeamid, 2 AS awayteamid, 2 AS homescore, 1 AS awayscore, 1 AS stadiumid, 1 AS refereeid FROM dual UNION ALL
         SELECT TO_DATE('2023-08-02 20:30:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 4, 3, 2, 3, 2 FROM dual UNION ALL
         SELECT TO_DATE('2023-08-03 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 6, 1, 1, 5, 3 FROM dual UNION ALL
         SELECT TO_DATE('2023-08-04 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 7, 8, 0, 0, 7, 4 FROM dual UNION ALL
         SELECT TO_DATE('2023-08-05 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 9, 10, 1, 2, 9, 5 FROM dual UNION ALL
         SELECT TO_DATE('2023-08-06 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 11, 12, 3, 3, 11, 6 FROM dual UNION ALL
         SELECT TO_DATE('2023-08-07 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 13, 14, 2, 1, 13, 7 FROM dual UNION ALL
         SELECT TO_DATE('2023-08-08 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), 15, 16, 0, 4, 15, 8 FROM dual UNION ALL

         -- Round 2
         SELECT TO_DATE('2023-08-12 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 3, 1, 1, 2, 9 FROM dual UNION ALL
         SELECT TO_DATE('2023-08-13 20:30:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 1, 2, 2, 4, 10 FROM dual UNION ALL
         SELECT TO_DATE('2023-08-14 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 6, 7, 0, 1, 6, 11 FROM dual UNION ALL
         SELECT TO_DATE('2023-08-15 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 8, 5, 2, 0, 8, 12 FROM dual UNION ALL
         SELECT TO_DATE('2023-08-16 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 10, 11, 1, 3, 10, 13 FROM dual UNION ALL
         SELECT TO_DATE('2023-08-17 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 9, 1, 0, 12, 14 FROM dual UNION ALL
         SELECT TO_DATE('2023-08-18 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 14, 15, 0, 2, 14, 15 FROM dual UNION ALL
         SELECT TO_DATE('2023-08-19 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), 16, 13, 1, 2, 16, 1 FROM dual
     )
