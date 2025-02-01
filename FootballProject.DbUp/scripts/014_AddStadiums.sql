INSERT INTO stadiums (name, capacity, location)
SELECT name, capacity, location
FROM (
         SELECT 'Stadion Wojska Polskiego' AS name, 31203 AS capacity, 'Warsaw' AS location FROM dual UNION ALL
         SELECT 'Stadion Miejski', 41609, 'Poznań' FROM dual UNION ALL
         SELECT 'Stadion Raków', 5500, 'Częstochowa' FROM dual UNION ALL
         SELECT 'Stadion im. Floriana Krygiera', 21000, 'Szczecin' FROM dual UNION ALL
         SELECT 'Polsat Plus Arena Gdańsk', 41983, 'Gdańsk' FROM dual UNION ALL
         SELECT 'Stadion Miejski', 45318, 'Wrocław' FROM dual UNION ALL
         SELECT 'Stadion Cracovii', 15016, 'Kraków' FROM dual UNION ALL
         SELECT 'Stadion im. Ernesta Pohla', 24764, 'Zabrze' FROM dual UNION ALL
         SELECT 'Stadion Kazimierza Górskiego', 10578, 'Płock' FROM dual UNION ALL
         SELECT 'Stadion Miejski', 22432, 'Białystok' FROM dual UNION ALL
         SELECT 'Stadion Piasta Gliwice', 10200, 'Gliwice' FROM dual UNION ALL
         SELECT 'Stadion Zagłębia Lubin', 16100, 'Lubin' FROM dual UNION ALL
         SELECT 'Stadion MOSiR', 15000, 'Radom' FROM dual UNION ALL
         SELECT 'Stadion Dyskobolii Grodzisk Wielkopolski', 8000, 'Poznań' FROM dual UNION ALL
         SELECT 'Suzuki Arena', 15200, 'Kielce' FROM dual UNION ALL
         SELECT 'Stadion im. Orła Białego', 6200, 'Legnica' FROM dual
     )
