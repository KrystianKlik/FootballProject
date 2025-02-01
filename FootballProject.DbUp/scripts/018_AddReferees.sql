INSERT INTO referees (firstname, lastname, experience, matchesofficiated)
SELECT firstname, lastname, experience, matchesofficiated
FROM (
         SELECT 'Szymon' AS firstname, 'Marciniak' AS lastname, 'FIFA Elite' AS experience, 350 AS matchesofficiated FROM dual UNION ALL
         SELECT 'Paweł', 'Raczkowski', 'FIFA', 250 FROM dual UNION ALL
         SELECT 'Tomasz', 'Kwiatkowski', 'FIFA', 200 FROM dual UNION ALL
         SELECT 'Daniel', 'Stefański', 'National Level', 180 FROM dual UNION ALL
         SELECT 'Bartłomiej', 'Marciniak', 'Regional Level', 50 FROM dual UNION ALL
         SELECT 'Krzysztof', 'Jakubik', 'FIFA', 175 FROM dual UNION ALL
         SELECT 'Mariusz', 'Złotek', 'National Level', 150 FROM dual UNION ALL
         SELECT 'Tomasz', 'Musiał', 'National Level', 220 FROM dual UNION ALL
         SELECT 'Paweł', 'Gil', 'FIFA Elite', 300 FROM dual UNION ALL
         SELECT 'Bartosz', 'Frankowski', 'FIFA', 200 FROM dual UNION ALL
         SELECT 'Hubert', 'Siejewicz', 'Regional Level', 60 FROM dual UNION ALL
         SELECT 'Michał', 'Borski', 'National Level', 190 FROM dual UNION ALL
         SELECT 'Wojciech', 'Myć', 'Regional Level', 70 FROM dual UNION ALL
         SELECT 'Jarosław', 'Przybył', 'FIFA', 210 FROM dual UNION ALL
         SELECT 'Marcin', 'Borski', 'FIFA Elite', 280 FROM dual
     )
