#Study Group 6: Erika Manning, Marcel Dinga, Ilya Mruz

#Step 1: Import G6_consolidated_beverage_data into beverages database using the Table Data Import Wizard.

#Step 2: Use beverages database
USE beverages;

#Step 3: Query G6_consolidated_beverage_data to create final output table.
SELECT Last_Name, First_Name, Order_Year, Category_Name, Product, Country, Region, State, Weight, Caffeine, Per_Unit_Price,
SUM(Quantity) AS Quantity_Sum, SUM(Weight_Quantity) AS Weight_Quantity_Sum, SUM(Volume_Quantity) AS Volume_Quantity_Sum, 
SUM(Revenue_Quantity) AS Revenue_Quantity_Sum 
	FROM  G6_consolidated_beverage_data
    GROUP BY Last_Name, First_Name, Order_Year, Category_Name, Product, Country, Region, State, Weight, Caffeine, Per_Unit_Price
    ORDER BY Last_Name, First_Name, Order_Year, Category_Name, Product, Country, Region, Revenue_Quantity_Sum;
#Although the assignment instructions did not specify that we include the Quantity and Weight_Quantity sums, we thought it would be best to include them.
    
#Step 4: Export resulting table as G6_output_final.csv, then re-import into beverages database as a table using the Table Data Import Wizard.

#As mentioned in Script1, we advise that future database users/administers add 
#orderID and ProductID columns, where applicable, to the beverageorders, interim, and final output tables. 
