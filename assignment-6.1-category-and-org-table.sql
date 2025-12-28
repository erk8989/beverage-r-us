# UMGC DATA 635
# Assignment 6.1 Beverages R Us Create


Drop Database if exists beverages;

Create Database beverages;
use beverages;
DROP TABLE if exists category;
DROP TABLE if exists org_chart_table;

CREATE TABLE Category (
    ID INT,
    Category_Name VARCHAR(25),
    Product_name VARCHAR(25)
);

ALTER TABLE `Category` ADD INDEX `Category_Name_index` (`Category_Name`);

CREATE TABLE Org_Chart_Table (
    ID INT PRIMARY KEY,
    First_Name VARCHAR(25),
    Last_Name VARCHAR(25),
    Category_Name VARCHAR(25),
    FOREIGN KEY (Category_Name) REFERENCES Category(Category_Name)
);


INSERT INTO Category (ID, Category_Name, Product_Name) VALUES
(1, 'Soft Drinks', 'Dreamy Droplets'),
(2, 'Vitamin Drinks', 'Berry Blush'),
(3, 'Hot Beverages', 'Electric Elixir'),
(4, 'Smoothies', 'Blissful Bubbles'),
(5, 'Iced Teas', 'Moonbeam Brew'),
(6, 'Juices', 'Frosty Fizz'),
(7, 'Sports Drinks', 'Twilight Tonic'),
(8, 'Mocktails', 'Secret Synergy'),
(9, 'Iced Teas', 'Mystic Mist'),
(10, 'Milkshakes', 'Health Potion'),
(11, 'Potions', 'Velvet Vortex'),
(12, 'Energy Drinks', 'Oceanic Oasis'),
(13, 'Vitamin Drinks', 'Citrus Sizzle'),
(14, 'Soft Drinks', 'Frosted Flare'),
(15, 'Soft Drinks', 'Sparkle Splash'),
(16, 'Mocktails', 'Enchanted Euphoria'),
(17, 'Energy Drinks', 'Rainbow Rush'),
(18, 'Vitamin Drinks', 'Luminous Liquid'),
(19, 'Potions', 'Celestial Crush'),
(20, 'Maple Drinks', 'Sapped'),
(21, 'Maple Drinks', 'Maple Mash UP'),
(22, 'Hot Beverages', 'Eggs Benedict Expresso'),
(23, 'Hot Beverages', 'Pecan Pie Latte'),
(24, 'Smoothies', 'Pancake Flip Frappe');


INSERT INTO org_chart_table (ID, First_Name, Last_Name, Category_Name) VALUES
(1, 'Silas', 'Fiddlesticks', 'Milkshakes'),
(2, 'Buford', 'Jackson', 'Soft Drinks'),
(3, 'Buford', 'Jackson', 'Mocktails'),
(4, 'Rowan', 'Walsh', 'Juices'),
(5, 'Bodhi', 'Perry', NULL),
(6, 'Marley', 'Price', 'Energy Drinks'),
(7, 'Harley', 'Withers', 'Sports Drinks'),
(8, 'Journey', 'Nguyen', 'Potions'),
(9, 'Remi', 'Olson', 'Vitamin Drinks'),
(10, 'Remi', 'Olson', 'Hot Beverages'),
(11, 'Remi', 'Olson', 'Smoothies'),
(12, 'Remi', 'Olson', 'Iced Teas'),
(13, 'Marlowe', 'Walsh', NULL),
(14, 'Winnie', 'Winnette', NULL),
(15, 'Buford', 'Jackson', 'Maple Drinks');
