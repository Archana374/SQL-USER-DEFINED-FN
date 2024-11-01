## Add a new column called DOB in Persons table
ALTER TABLE Persons
ADD DOB DATE;

## Write a user-defined function to calculate age using Dob

DELIMITER //

CREATE FUNCTION CalculateAge(dob DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE age INT;
    SET age = YEAR(CURDATE()) - YEAR(dob);
    IF (MONTH(CURDATE()) < MONTH(dob)) OR (MONTH(CURDATE()) = MONTH(dob) AND DAY(CURDATE()) < DAY(dob)) THEN
        SET age = age - 1;
    END IF;
    RETURN age;
END; //

DELIMITER ;

##Write a select query to fetch the Age of all persons using the function
SELECT Id, Fname, Lname, CalculateAge(DOB) AS Age
FROM Persons;

## Find the length of each country name in the Country table
SELECT Country_name, LENGTH(Country_name) AS Country_Name_Length
FROM Country;

##Extract the first three characters of each country's name in the Country table
SELECT Country_name, LEFT(Country_name, 3) AS Short_Name
FROM Country;

##Convert all country names to uppercase and lowercase in the Country table

SELECT Country_name, 
       UPPER(Country_name) AS Uppercase_Name, 
       LOWER(Country_name) AS Lowercase_Name
FROM Country;