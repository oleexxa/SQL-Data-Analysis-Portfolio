drop table if exists pet_store_sales; 		/*Drop the table if it already exists to ensure a clean start and avoid "already exists" errors.*/
/* 1. Creating the table structure */
create table pet_store_sales
	(
	id int primary key 						/* Unique id for each transaction */
	,product_name varchar(200) 				/* Full name of the product */
	,category varchar(200) 					/* Category (Food, Toys, etc.) */
	,price decimal (10, 2) 					/* Price with two decimal places */
	,sale_date date 							/* Date when the sale happend */
	); 										/* The semicolon ";", tells the database: "This is the end of the command". Without it, the database will keep waiting for more. */
select * from pet_store_sales;				/* View all columns and data in the table to verify the structure */
/* 2. Inserting data into the table */
insert into pet_store_sales (id, product_name, category, price, sale_date)
values
(1, 'Dog Leash Red', 'Accessories', 35.50, '2024-01-10')
,(2, 'Cat Dry Food 2kg', 'Food', 120.00, '2024-02-15')
,(3, 'Rubber Bone Toy', 'Toys', 15.99, '2024-03-20')
,(4, 'Luxury Cat Bed', 'Accessories', 250.00, '2024-05-12')
,(5, 'Hamster Cage', 'Housing', 180.00, '2024-06-01')
,(6, 'Bird Seed Mix', 'Food', 25.00, '2024-07-14')
,(7, 'Aquarium Filter', 'Equipment', 95.00, '2024-08-24')
,(8, 'Dog Shampoo', 'Grooming', 42.00, '2024-10-05')
,(9, 'Cat Nip Spray', 'Toys', 12.50, '2024-11-12')
,(10, 'Rabbit Hutch Large', 'Housing', 450.00, '2024-12-20')
,(11, 'Leather Dog Collar', 'Accessories', 65.00, '2025-01-15')
,(12, 'Fish Flakes 100g', 'Food', 18.90, '2025-03-10')
,(13, 'Reptile Heat Lamp', 'Equipment', 110.00, '2025-05-22')
,(14, 'Dog Treats Bag', 'Food', 9.99, '2025-07-30')
,(15, 'Cat Scratching Post', 'Accessories', 130.00, '2025-09-15')
,(16, 'Tennis Ball Set', 'Toys', 20.00, '2025-11-05')
,(17, 'Flea Collar for Cats', 'Grooming', 35.00, '2025-12-28')
,(18, 'Turtle Dock', 'Housing', 55.00, '2026-01-12')
,(19, 'Parrot Stand', 'Accessories', 210.00, '2026-01-25')
,(20, 'Wet Cat Food Tin', 'Food', 4.50, '2026-02-04');
