---------------------------------------------
-- === �Ʒ� ������ ��ȸ�� �� �ִ� SQL���� �ۼ� ===
-- ��� ���� �� �����ȣ, �̸�, ������ ��ȸ
SELECT EMP_ID "��� ��ȣ", EMP_NAME �̸�, SALARY AS ����
FROM EMPLOYEE;

-- �μ��ڵ尡 'D9'�� ����� �̸�, �μ��ڵ� ��ȸ
SELECT EMP_NAME �̸�, DEPT_CODE �μ��ڵ�  ---(3)
FROM EMPLOYEE           ---(1)
WHERE DEPT_CODE = 'D9'; ---(2)
-- ���� ���� : FROM -> WHERE -> SELECT
/*
SELECT * FROM EMPLOYEE;
SELECT * FROM EMPLOYEE WHERE DEPT_CODE = 'D9';
SELECT EMP_NAME �̸�, DEPT_CODE �μ��ڵ� FROM EMPLOYEE WHERE DEPT_CODE = 'D9';
*/

-- ����ó�� 4��°�ڸ��� 7�� ������ �̸�, ����ó ��ȸ
SELECT EMP_NAME, PHONE
FROM EMPLOYEE
WHERE PHONE LIKE '___7%';
-- LIKE ���� ���ϵ�ī�� : _(1���ڸ� �ǹ�), %(0���� �̻��� �ǹ�)

-- �����ڵ尡 'J7'�� ���� �� �޿��� 200���� �̻��� ������ �̸�, �޿�, �����ڵ� ��ȸ
SELECT EMP_NAME �̸�, SALARY �޿�, JOB_CODE �����ڵ�
FROM EMPLOYEE
WHERE JOB_CODE = 'J7' -- (1) �����ڵ尡 : 'J7' ��
        AND SALARY >= 2000000; -- (2) �޿��� 200���� �̻���

-- ��ü ��� ������ �ֱ� �Ի��� �������� �����Ͽ� ��ȸ
SELECT * 
FROM EMPLOYEE
ORDER BY HIRE_DATE DESC;
-- *�⺻��* ASC NULLS LAST -- NULL���� ���ʿ� ��ġ�Ͽ� ��ȸ
--         DESC NULLS FIRST -- NULL���� ���ʿ� ��ġ�Ͽ� ��ȸ
---------------------------------------------