--1)Pesquise a taxa de mortalidade infantil e de natalidade nos seis menores países da Europa, em termos de extensão territorial (Andorra, Liechtenstein, Malta, Mônaco, San Marino e Vaticano – Holy See), no ano 2000. Utilize as tabelas child_mortality e fertility, nesta ordem, e inclua na consulta os campos tot_deaths e mean_babies. Para isso, utilize a cláusula LEFT JOIN.
SELECT cm.country, 
	   cm.tot_deaths, 
	   f.mean_babies
FROM child_mortality cm
LEFT JOIN fertility f ON cm.country = f.country 
	AND cm.ref_year = f.ref_year
WHERE cm.country IN ('Andorra', 'Holy See', 'Liechtenstein', 'Malta', 'Monaco', 'San Marino')
AND cm.ref_year= 2000;

--2)Pesquise novamente a taxa de mortalidade infantil e de natalidade nos seis menores países da Europa, em termos de extensão territorial, no ano 2000, utilizando as tabelas child_mortality e fertility, nesta ordem, e incluindo na consulta os campos tot_deaths e mean_babies. Além disso, inclua a população total dos países. Para isso, execute dois LEFT JOINs.
SELECT cm.country, 
	cm.tot_deaths, 
	p.tot_pop, 
	f.mean_babies
FROM child_mortality cm
LEFT JOIN population p ON cm.country = p.country 
	AND cm.ref_year = p.ref_year
LEFT JOIN fertility f ON cm.country = f.country 
	AND cm.ref_year = f.ref_year
WHERE cm.country IN ('Andorra', 'Holy See', 'Liechtenstein', 'Malta', 'Monaco', 'San Marino')
AND cm.ref_year= 2000;	

--3)Pesquise novamente a taxa de mortalidade infantil e de natalidade nos seis menores países da Europa, em termos de extensão territorial, no ano 2000. Agora, você deve executar INNER JOIN entre child_mortality e population e LEFT JOIN entre child_mortality e fertility. Explique se esta operação muda o resultado.
SELECT cm.country, 
	cm.tot_deaths, 
	p.tot_pop, 
	f.mean_babies
FROM child_mortality cm
JOIN population p ON cm.country = p.country 
	AND cm.ref_year = p.ref_year
LEFT JOIN fertility f ON cm.country = f.country 
AND cm.ref_year = f.ref_year
WHERE cm.country IN ('Andorra', 'Holy See', 'Liechtenstein', 'Malta', 'Monaco', 'San Marino')
AND cm.ref_year= 2000;

--4)Pesquise novamente a taxa de mortalidade infantil e de natalidade nos seis menores países da Europa, em termos de extensão territorial, no ano 2000. Agora, você deve inverter a ordem das tabelas: utilize primeiro a tabela fertility e, em seguida, child_mortality. Na sequência, utilize a cláusula RIGHT JOIN. Explique se esta operação muda o resultado.
SELECT cm.country, 
	cm.tot_deaths, 
	f.mean_babies
FROM fertility f
RIGHT JOIN child_mortality cm ON cm.country = f.country 
AND cm.ref_year = f.ref_year
WHERE cm.country IN ('Andorra', 'Holy See', 'Liechtenstein', 'Malta', 'Monaco', 'San Marino')
AND cm.ref_year= 2000;	

--5)Consulte a taxa de mortalidade infantil e de natalidade, no ano 2000, de algumas ilhas caribenhas: Aruba, Cuba, Dominica, Martinica (Martinique) e Porto Rico (Puerto Rico). Use as tabelas fertility e child_mortality. Observe que é necessário utilizar um FULL JOIN para retornar todos os países na consulta.
SELECT f.country,
       cm.country,
       cm.tot_deaths,
       f.mean_babies
FROM fertility f
FULL JOIN child_mortality cm
ON cm.country = f.country
AND cm.ref_year = f.ref_year
WHERE (f.country IN ('Aruba', 'Martinique', 'Puerto Rico', 'Dominica', 'Cuba')
OR cm.country IN ('Aruba', 'Martinique', 'Puerto Rico', 'Dominica', 'Cuba'))
AND (f.ref_year = 2000 OR cm.ref_year = 2000);