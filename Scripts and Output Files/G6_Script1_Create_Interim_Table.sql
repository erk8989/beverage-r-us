#Study Group 6: Erika Manning, Marcel Dinga, Ilya Mruz

#Step 1: Run assignment-6.1-category-and-org-table.sql 

#Step 2: Import raw data files as tables (beverageorders2021, beverageorders2022, beverageorders2023) using the Table Data Import Wizard
#Note: each of the raw data files were renamed to simplify the import process
#After importing, run the entire script below.

#Step 3: Use beverages database
USE beverages;

#Step 4: Add Order_Year column to each of the 2021, 2022, and 2023 order tables
#2021
ALTER TABLE beverageorders2021
	ADD COLUMN Order_Year INT DEFAULT 2021;
#2022
ALTER TABLE beverageorders2022
	ADD COLUMN Order_Year INT DEFAULT 2022;
#2023
ALTER TABLE beverageorders2023
	ADD COLUMN Order_Year INT DEFAULT 2023;

#Step 5: Get rid of unnecessary Coupon_Code column in beverageorders2022
ALTER TABLE beverageorders2022 
	DROP COLUMN Coupon_Code;
    
#Step 6: Add an empty caffeine column to beverageorders2021
ALTER TABLE beverageorders2021 
	ADD Caffeine INT(11);

#Step 7: Create empty beverageorders table to consolidate 2021, 2022, and 2023 orders tables
CREATE TABLE `beverageorders` (
   `Product` text,
   `Weight` int(11) DEFAULT NULL,
   `Volume` int(11) DEFAULT NULL,
   `Caffeine` int(11) DEFAULT NULL,
   `Per_Unit_Price` int(11) DEFAULT NULL,
   `Quantity` int(11) DEFAULT NULL,
   `Region` text,
   `State` text,
   `Country` text,
   `Order_Year` int(11) DEFAULT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
 
#Step 8: Insert 2021 order values into beverageorders table
INSERT INTO beverageorders 
	SELECT Product, Weight, Volume, Caffeine, Per_Unit_Price, Quantity, Region, State, Country, Order_Year
	FROM beverageorders2021;
    
#Step 9: Insert 2022 order values into beverageorders table
INSERT INTO beverageorders 
	SELECT Product, Weight, Volume, Caffeine, Per_Unit_Price, Quantity, Region, State, Country, Order_Year
	FROM beverageorders2022;

#Step 10: Insert 2023 order values into beverageorders table
INSERT INTO beverageorders 
	SELECT Product, Weight, Volume, Caffeine, Per_Unit_Price, Quantity, Region, State, Country, Order_Year
	FROM beverageorders2023;

#Step 11: Insert values for missing caffeine values (2021 orders) using 2022 and 2023 order info in beverageorders table
SET SQL_SAFE_UPDATES = 0;    #Turn off safe_updates to be able to run the UPDATE command
UPDATE beverageorders b
INNER JOIN (
    SELECT DISTINCT Product, Caffeine
    FROM beverageorders
    WHERE Caffeine IS NOT NULL
) t ON b.Product = t.Product
SET b.Caffeine = t.Caffeine
WHERE b.Caffeine IS NULL; 
#Note: Sapped and Maple Mash UP do not have caffeine information because they were not ordered in 2022 and 2023
	#Gemini helped generate this code

#Enable safe update again
SET SQL_SAFE_UPDATES = 1; 

#Step 12: Below are the final query steps to join the beverageorders and org_chart_table to the category table and create calculated columns
#This step results in the interim table

SELECT b.Product, b.Weight, b.Volume, b.Caffeine, b.Per_Unit_Price, b.Quantity, 
(b.Volume * b.Quantity) AS Volume_Quantity, (b.Weight * b.Quantity) AS Weight_Quantity, (b.Per_Unit_Price * b.Quantity) AS Revenue_Quantity, b.Region, b.State, b.Country, 
c.Category_Name, o.First_Name, o.Last_Name, b.Order_Year
	FROM ((category c 
    RIGHT JOIN org_chart_table o ON c.Category_Name = o.Category_Name)
    RIGHT JOIN beverageorders b ON c.Product_name = b.Product)
    WHERE o.First_Name IN ('Remi', 'Buford', 'Bodhi', 'Rowan');
    
#Step 13: Export resulting table as G6_consolidated_beverage_data.csv

#No categories are assigned to Bodhi Perry. As a result, Bodhi Perry is not included in the consolidated interim database.
#Per the assignment instructions, the interim consolidated table does not include an ID column for either orders or products. 
#However, for data integrity purposes, we advise that future database users/administers add 
#orderID and ProductID columns, where applicable, to the beverageorders, interim, and final output tables. 