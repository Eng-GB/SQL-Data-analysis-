
#SQL Essential Commands & Functions
# Data Retrieving And Filtering 

SELECT * FROM flavors.flavors;

SELECT `Base Flavor` , Liked FROM flavors.flavors;
SELECT `Base Flavor` , `flavor Rating`, Liked  FROM  flavors.flavors where Liked ='Yes';
SELECT `Base Flavor` , `flavor Rating`, Liked  FROM  flavors.flavors where Liked ='Yes' and `flavor Rating`>= 5;
SELECT `Base Flavor` , `flavor Rating`, Liked  FROM  flavors.flavors where Liked ='No' and `flavor Rating`<= 5;


# Grouby Group Rows  and sharing command values;

SELECT * FROM flavors.flavors;

SELECT `Base Flavor`, count(`Base Flavor`) fROM flavors.flavors group by `Base Flavor`;

SELECT Liked, count(Liked) as Total  FROM flavors.flavors group by `Liked`;

SELECT `Base Flavor`, round(SUM(`Total Rating`),1)as Count fROM flavors.flavors group by `Base Flavor`;

# Order By Columns as ASC & DESC ;
SELECT Liked, sum(`Total Rating`) as Total  FROM flavors.flavors group by `Liked` order by Liked asc;
SELECT Liked, sum(`Total Rating`) as Total  FROM flavors.flavors group by `Liked` order by Liked desc;
SELECT 
    `Base Flavor`, 
    COUNT(*) ,Liked AS total
FROM flavors.flavors
GROUP BY `Base Flavor`,Liked;


SELECT 
    `Base Flavor`, Liked,
    COUNT(*) AS total
FROM flavors.flavors
GROUP BY `Base Flavor`, Liked;

SELECT 
    Liked,
    COUNT(*) , Round(avg(`Total Rating`)) AS Total_R , Round(std(`Total Rating`)) Total_R
FROM flavors.flavors
GROUP BY  Liked;

# Data Muniplution 

alter table flavors.`lotr 2` add ID int not null primary key auto_increment;

ALTER TABLE flavors.`lotr 2`
MODIFY COLUMN FellowshipID INT NOT NULL;  -- remove AUTO_INCREMENT
ALTER TABLE flavors.`lotr 2`
DROP PRIMARY KEY;


# Joining to Use and compound multi column from varias Tables ;

SELECT * FROM flavors.`lotr 2`;

select FellowshipID, Age ,id,gender ,country 
 FROM flavors.`lotr 2` AS L join flavors.tallest_people_in_the_world as T
 on L.num_id=T.id;

select * from flavors.tallest_people_in_the_world;

select  name , gender, country , FirstName , Age from
flavors.`lotr 2` as L join flavors.tallest_people_in_the_world as T
on T.ID=L.num_id;

# LEFT JOIN
SELECT name, gender, country, FirstName, Age
FROM flavors.`lotr 2` AS L
LEFT JOIN flavors.tallest_people_in_the_world AS T
ON T.ID = L.num_id;

# RIGHT JOIN

SELECT name, gender, country, FirstName, Age
FROM flavors.`lotr 2` AS L
RIGHT JOIN flavors.tallest_people_in_the_world AS T
ON T.ID = L.num_id;

# Advanced Filtering In SQL
# show unique
SELECT * FROM flavors.flavors;
select distinct liked ,`Base Flavor` from flavors.flavors;
select distinct `Base Flavor` from flavors.flavors;

-- HAVING Filter 

select   liked ,`Total Rating` from flavors.flavors having `Total Rating` > 5;

select  liked, sum(`Total Rating`) from flavors.flavors group by Liked  having sum(`Total Rating`) > 50;

select  liked, count(`Total Rating`) from flavors.flavors group by Liked
  having count(`Total Rating`) order by Liked asc;
  
# Using Case Conditions 

select `Base Flavor` ,`Total Rating`,
case 
   when `Total Rating` >= 10 then 'Hight'
    when  `Total Rating` <= 10 then 'Low'
    end as Rate
 from flavors.flavors  order by `Total Rating` asc ;


