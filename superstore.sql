SELECT 
    *
FROM
    superstore.superstore;
    
SELECT 
    id, year_birth, education, marital_status
FROM
    superstore.superstore
WHERE
    year_birth >= 1970;
    
SELECT 
    kidhome,
    teenhome,
    COUNT(kidhome) AS kid_count,
    COUNT(teenhome) AS teen_count
FROM
    superstore.superstore
GROUP BY kidhome , teenhome;

/*
 For each customer's ID, this query calculate the total
 quantity of different products categories:
   -Total wines quantity
   -Total fruit quantity
   -Total meat quantity 
   -Total fish quantity
   -Total sweet quantity
   -Total gold quantity
   */
SELECT 
    id,
    SUM(mntwines) AS total_wine,
    SUM(mntfruits) AS total_fruit,
    SUM(mntmeatproducts) AS total_meat,
    SUM(mntfishproductS) AS total_fish,
    SUM(mntsweetproducts) AS total_sweet,
    SUM(mntgoldprods) AS total_gold
FROM
    superstore.superstore
GROUP BY id
ORDER BY id DESC;

        SELECT 
    id, education
FROM
    superstore.superstore
WHERE
    education IN ('Graduation', 'PhD')
    ORDER BY id DESC
    LIMIT 1000;
    
    SELECT 
    id, education, income
FROM
    superstore.superstore 
UNION SELECT 
    id, education, income
FROM
    superstore.superstore
GROUP BY id , education , income
HAVING income >= 1500
ORDER BY income DESC
LIMIT 1500;

    /*
     For each customer's ID, This query retrieve the numbers of purchases made with discount, 
    numbers of purchases made with catalog (buying goods to be shipped through the mail),
    numbers of purchases made directly in store.
    */
     
     SELECT 
    id,
    COUNT(numdealspurchases) AS purchases_with_discount,
    COUNT(numcatalogpurchases) AS purchases_with_catalog,
    COUNT(numstorepurchases) AS purchases_with_store
FROM
    superstore.superstore
GROUP BY id , numdealspurchases , numcatalogpurchases , numstorepurchases
ORDER BY id;

/*
This query retrieves the following customer's information:
  - customer ID
  - customer year of birth
  - customer marital status
  - customer income 
  - customer date of enrollment with the store(dt_customer)
  - customer number of days (recency)
  Additionally this query order the results by the highest total purchase
  for each customer and limits of 1000 customers
  */
    
SELECT 
    id,
    year_birth,
    marital_status,
    income,
    dt_customer,
    recency,
    SUM(mntwines + mntfruits + mntmeatproducts + mntfishproducts + mntsweetproducts + mntgoldprods) AS total_purchase
FROM
    superstore.superstore
GROUP BY id , year_birth , marital_status , income , dt_customer , recency
ORDER BY SUM(mntwines + mntfruits + mntmeatproducts + mntfishproducts + mntsweetproducts + mntgoldprods) DESC
LIMIT 1000;

/*
For each customer's ID , this query retrieves
-number of purchases made through the store website(numwebpurchases)
-number of visit to the store website in the last month(numwebvisitsmonth)
- number of response and complain.
*/ 

SELECT 
id,
numwebpurchases,
numwebvisitsmonth,
response,
complain
FROM 
    superstore.superstore;


    /* 
    This query counts the number of customer 
    registered on each unique date.
    */
    SELECT 
    dt_customer, COUNT(*) AS customer_count
FROM
    superstore.superstore
GROUP BY dt_customer
ORDER BY dt_customer;

SELECT 
marital_status,
COUNT(*) AS marital_counts
FROM
 superstore.superstore
GROUP BY marital_status;

