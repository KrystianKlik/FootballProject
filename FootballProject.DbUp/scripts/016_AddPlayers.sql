INSERT INTO Players (firstname, lastname, dateofbirth, position, jerseynumber, contactinfo, contractstart, contractend, salary, teamid)
SELECT firstname, lastname, dateofbirth, position, jerseynumber, contactinfo, contractstart, contractend, salary, teamid
FROM (
         SELECT 'Bartosz' AS firstname, 'Kapustka' AS lastname, DATE '1996-12-23' AS dateofbirth, 'Midfielder' AS position, 67 AS jerseynumber, 'bartosz.kapustka@legia.pl' AS contactinfo, DATE '2022-07-01' AS contractstart, DATE '2025-06-30' AS contractend, 2000000.00 AS salary, 1 AS teamid FROM dual UNION ALL
         SELECT 'Filip', 'Mladenović', DATE '1991-08-15', 'Defender', 25, 'filip.mladenovic@legia.pl', DATE '2021-01-01', DATE '2024-12-31', 1500000.00, 1 FROM dual UNION ALL
         SELECT 'Artur', 'Jędrzejczyk', DATE '1987-11-04', 'Defender', 55, 'artur.jedrzejczyk@legia.pl', DATE '2017-07-01', DATE '2024-06-30', 1700000.00, 1 FROM dual UNION ALL
         SELECT 'Radosław', 'Cierzniak', DATE '1983-04-24', 'Goalkeeper', 33, 'radoslaw.cierzniak@legia.pl', DATE '2016-07-01', DATE '2024-06-30', 800000.00, 1 FROM dual UNION ALL
         SELECT 'Josué', 'Pesqueira', DATE '1990-09-17', 'Midfielder', 8, 'josue.pesqueira@legia.pl', DATE '2021-07-01', DATE '2024-06-30', 1900000.00, 1 FROM dual UNION ALL

         SELECT 'Michał', 'Skóraś', DATE '2000-02-15', 'Midfielder', 21, 'michal.skoras@lechpoznan.pl', DATE '2020-07-01', DATE '2024-06-30', 1200000.00, 2 FROM dual UNION ALL
         SELECT 'Pedro', 'Rebocho', DATE '1995-01-23', 'Defender', 3, 'pedro.rebocho@lechpoznan.pl', DATE '2021-07-01', DATE '2025-06-30', 1400000.00, 2 FROM dual UNION ALL
         SELECT 'Mikael', 'Ishak', DATE '1993-03-31', 'Forward', 9, 'mikael.ishak@lechpoznan.pl', DATE '2020-07-01', DATE '2024-06-30', 2000000.00, 2 FROM dual UNION ALL
         SELECT 'Joel', 'Pereira', DATE '1996-03-28', 'Defender', 2, 'joel.pereira@lechpoznan.pl', DATE '2021-07-01', DATE '2025-06-30', 1300000.00, 2 FROM dual UNION ALL
         SELECT 'Filip', 'Marchwiński', DATE '2002-01-10', 'Midfielder', 11, 'filip.marchwinski@lechpoznan.pl', DATE '2019-07-01', DATE '2025-06-30', 900000.00, 2 FROM dual UNION ALL

         SELECT 'Vladan', 'Kovacevic', DATE '1998-03-11', 'Goalkeeper', 1, 'vladan.kovacevic@rakow.pl', DATE '2022-01-01', DATE '2025-12-31', 1100000.00, 3 FROM dual UNION ALL
         SELECT 'Ivi', 'Lopez', DATE '1994-06-29', 'Forward', 7, 'ivi.lopez@rakow.pl', DATE '2020-07-01', DATE '2024-06-30', 1700000.00, 3 FROM dual UNION ALL
         SELECT 'Fran', 'Tudor', DATE '1995-09-27', 'Midfielder', 92, 'fran.tudor@rakow.pl', DATE '2019-01-01', DATE '2025-06-30', 1200000.00, 3 FROM dual UNION ALL
         SELECT 'Zoran', 'Arsenic', DATE '1994-06-02', 'Defender', 5, 'zoran.arsenic@rakow.pl', DATE '2021-07-01', DATE '2024-06-30', 1300000.00, 3 FROM dual UNION ALL
         SELECT 'Sebastian', 'Musiolik', DATE '1996-05-19', 'Forward', 99, 'sebastian.musiolik@rakow.pl', DATE '2019-07-01', DATE '2024-06-30', 800000.00, 3 FROM dual UNION ALL

         SELECT 'Kamil', 'Grosicki', DATE '1988-06-08', 'Forward', 11, 'kamil.grosicki@pogon.pl', DATE '2021-07-01', DATE '2024-06-30', 2000000.00, 4 FROM dual UNION ALL
         SELECT 'Mateusz', 'Łęgowski', DATE '2003-01-27', 'Midfielder', 18, 'mateusz.legowski@pogon.pl', DATE '2022-07-01', DATE '2026-06-30', 800000.00, 4 FROM dual UNION ALL
         SELECT 'Damian', 'Dąbrowski', DATE '1992-08-27', 'Midfielder', 16, 'damian.dabrowski@pogon.pl', DATE '2019-07-01', DATE '2024-06-30', 1100000.00, 4 FROM dual UNION ALL
         SELECT 'Mariusz', 'Fornalczyk', DATE '2003-03-14', 'Forward', 77, 'mariusz.fornalczyk@pogon.pl', DATE '2021-07-01', DATE '2025-06-30', 500000.00, 4 FROM dual UNION ALL
         SELECT 'Dante', 'Stipica', DATE '1991-12-30', 'Goalkeeper', 1, 'dante.stipica@pogon.pl', DATE '2019-07-01', DATE '2024-06-30', 1300000.00, 4 FROM dual UNION ALL

         SELECT 'Jarosław', 'Kubicki', DATE '1995-08-07', 'Midfielder', 14, 'jaroslaw.kubicki@lechia.pl', DATE '2018-07-01', DATE '2025-06-30', 1200000.00, 5 FROM dual UNION ALL
         SELECT 'Flavio', 'Paixao', DATE '1984-09-19', 'Forward', 28, 'flavio.paixao@lechia.pl', DATE '2016-07-01', DATE '2024-06-30', 1100000.00, 5 FROM dual UNION ALL
         SELECT 'Dusan', 'Kuciak', DATE '1985-05-21', 'Goalkeeper', 1, 'dusan.kuciak@lechia.pl', DATE '2017-07-01', DATE '2024-06-30', 900000.00, 5 FROM dual UNION ALL
         SELECT 'Jakub', 'Kałuziński', DATE '2002-10-01', 'Midfielder', 23, 'jakub.kaluzinski@lechia.pl', DATE '2020-07-01', DATE '2025-06-30', 600000.00, 5 FROM dual UNION ALL
         SELECT 'Rafał', 'Pietrzak', DATE '1992-01-30', 'Defender', 3, 'rafal.pietrzak@lechia.pl', DATE '2019-07-01', DATE '2024-06-30', 700000.00, 5 FROM dual
     )
