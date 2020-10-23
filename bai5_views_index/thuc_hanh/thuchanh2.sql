DELIMITER //

CREATE PROCEDURE findAllCustomers()

BEGIN

  SELECT * FROM classicmodels.customers;

END //

DELIMITER ;

call findAllCustomers();
DELIMITER //

DROP PROCEDURE IF EXISTS `findAllCustomers`//

CREATE PROCEDURE findAllCustomers()

BEGIN

   SELECT *  FROM classicmodels.customers where customerNumber = 175;

END; //

DELIMITER 