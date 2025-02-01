INSERT INTO teams (name, city, stadiumid, coach, sponsorship)
SELECT name, city, stadiumid, coach, sponsorship
FROM (
         SELECT 'Legia Warszawa' AS name, 'Warsaw' AS city, 1 AS stadiumid, 'Kosta Runjaić' AS coach, 'Orlen' AS sponsorship FROM dual UNION ALL
         SELECT 'Lech Poznań', 'Poznań', 2, 'John van den Brom', 'STS Bet' FROM dual UNION ALL
         SELECT 'Raków Częstochowa', 'Częstochowa', 3, 'Dawid Szwarga', 'X-Kom' FROM dual UNION ALL
         SELECT 'Pogoń Szczecin', 'Szczecin', 4, 'Jens Gustafsson', 'Grupa Azoty' FROM dual UNION ALL
         SELECT 'Lechia Gdańsk', 'Gdańsk', 5, 'Marcin Kaczmarek', 'Lotos' FROM dual UNION ALL
         SELECT 'Śląsk Wrocław', 'Wrocław', 6, 'Jacek Magiera', 'KGHM Polska Miedź' FROM dual UNION ALL
         SELECT 'Cracovia', 'Kraków', 7, 'Jacek Zieliński', 'Comarch' FROM dual UNION ALL
         SELECT 'Górnik Zabrze', 'Zabrze', 8, 'Jan Urban', 'Totalbet' FROM dual UNION ALL
         SELECT 'Wisła Płock', 'Płock', 9, 'Pavol Staňo', 'Orlen' FROM dual UNION ALL
         SELECT 'Jagiellonia Białystok', 'Białystok', 10, 'Adrian Siemieniec', 'STS Bet' FROM dual UNION ALL
         SELECT 'Piast Gliwice', 'Gliwice', 11, 'Aleksandar Vuković', 'Eko-Okna' FROM dual UNION ALL
         SELECT 'Zagłębie Lubin', 'Lubin', 12, 'Piotr Stokowiec', 'KGHM Polska Miedź' FROM dual UNION ALL
         SELECT 'Radomiak Radom', 'Radom', 13, 'Mariusz Lewandowski', 'Radomskie Centrum Onkologii' FROM dual UNION ALL
         SELECT 'Warta Poznań', 'Poznań', 14, 'Dawid Szulczek', 'Green Point' FROM dual UNION ALL
         SELECT 'Korona Kielce', 'Kielce', 15, 'Kamil Kuzera', 'Suzuki' FROM dual UNION ALL
         SELECT 'Miedź Legnica', 'Legnica', 16, 'Grzegorz Mokry', 'Legnickie Przedsiębiorstwo Wodociągów' FROM dual
     )
