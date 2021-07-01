/* Function name : F_COUNT_PROJECTS_BY_DATE
 * Parameter : v_date
 * Description : Retrieve count projects from a date included in accounting_export date
*/

SET SERVEROUTPUT ON;

CREATE FUNCTION F_COUNT_PROJECTS_BY_DATE (v_date IN DATE) RETURNS NUMBER IS
v_accounting_export ACCOUNTING_EXPORT%ROWTYPE;
v_projects_total ACCOUNTING_EXPORT%ROWTYPE;
BEGIN
	SELECT *
		INTO v_accounting_export
		FROM ACCOUNTING_EXPORT AE
		WHERE v_date BETWEEN AE.START_DATE AND AE.END_DATE;
	SELECT COUNT(*)
		INTO v_projects_total
		FROM project P
		WHERE P.END_DATE BETWEEN v_accounting_export.START_DATE AND v_accounting_export.END_DATE;
	RETURN v_projects_total;
END;
/

/* Test function */
dbms_output.put_line(F_COUNT_PROJECTS_BY_DATE("15/05/2021"); 