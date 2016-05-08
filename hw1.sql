CREATE OR REPLACE PROCEDURE change_manager(P_DEPT_ID INT , P_MAN_ID INT) AS
BEGIN 
UPDATE deptarment

    set manager_id = P_MAN_ID
        where department_id = P_DEPT_ID;
end;




CREATE OR REPLACE FUNCTION get_man_name(P_DEPT_ID INT)
RETURN VARCHAR IS 
v_fname em_table.first_name%type;
v_lname em_table.last_name%type;

BEGIN 


select e.first_name,e.last_name into v_fname,v_lname
from employees e JOIN DEPARTMENT d
ON (d.MANAGER_ID = e.EMPLOYEE_ID)
where d.DEPARTMENT_ID = P_DEPT_ID;

RETURN  v_fname||v_lname;

END;