/* 
    Q1) find 3 
    second lowest salary 
    from employee table 
    **********************************************************
    Answer 1 below:
*/

SELECT * 
FROM employee 
ORDER BY `salary` ASC 
LIMIT 3  
OFFSET 1 ;

/*
    find second lowest salary 
    from employee table 
    using sub query
    **********************************************************
    Answer 2 below:
*/

SELECT *  
FROM employee  
WHERE salary = (SELECT salary FROM employee ORDER BY `salary` ASC LIMIT 1 OFFSET 1);

/*
    find pending balance from account table where result fulfill following conditions

    a. show average pending balance 
    b. account should be active 
    c. grouping should be on open branch id 
    d. the branches on where PENDING_BALANCE is bellow 4300
    **********************************************************
    Answer 3 below:
*/

SELECT OPEN_BRANCH_ID, AVG(PENDING_BALANCE) 
FROM account 
WHERE PENDING_BALANCE 
AND `STATUS`="ACTIVE" 
AND PENDING_BALANCE > 4300 
GROUP BY OPEN_BRANCH_ID;

/*
    Write a pagination query and explain it.
    **********************************************************
    Answer 4 below:

    Per page 5 rows showing
*/

SET @numberofpage = 2; -- Page Numbe | * If you can enter the page number, then go to this page?
SET @numberofrow = 5;  -- Showing rows per page.

-- Use Dynamic SQL
SET @query = CONCAT('SELECT * FROM account LIMIT ', @numberofrow, ' OFFSET ', (@numberofpage - 1) * @numberofrow);

-- Execute the Query
PREPARE data FROM @query;
EXECUTE data;
DEALLOCATE PREPARE data;

/*
    Think you have a bank and many branches . You have a account table where multiple
    account from multiple branch.
    **********************************************************
    Answer 6 below:
*/
