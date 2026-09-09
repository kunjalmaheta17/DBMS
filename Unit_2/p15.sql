/*
Write a PACKAGE which includes Package Declaration, Package
Body and call the individual object from the Package.
*/

SET SERVEROUTPUT ON
SET VERIFY OFF
SET FEEDBACK OFF


CREATE OR REPLACE PACKAGE my_package
AS
    PROCEDURE greet;
END my_package;
/


CREATE OR REPLACE PACKAGE BODY my_package
AS
    PROCEDURE greet
    IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Package successfullly created..');
    END greet;
END my_package;
/


BEGIN
    my_package.greet;
END;
/

SET SERVEROUTPUT OFF
SET VERIFY ON
SET FEEDBACK ON