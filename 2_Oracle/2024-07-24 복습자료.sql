-- ��������???�������� ������ ���� ���� �� �Ʒ� SQL���� �ۼ����ּ��� ��������???��������
--============================================================================--
-- [1] '240724' ���ڿ��� '2024�� 7�� 24��'�� ǥ���غ���
SELECT TO_CHAR(TO_DATE('240724'), 'YYYY"��" FMMM"��" DD"��"')
FROM DUAL;
--FM�� �տ� ���̸� 0�� �����ؼ� ǥ������!

-- [2] ������ �¾ �� ��ĥ°���� Ȯ���غ��� (���糯¥ - �������)
SELECT CEIL(SYSDATE - TO_DATE('89/01/01'))||'��°' "���� �¾��..."
FROM DUAL;

-- [3] ���� ������ �ٲ㺸��
-- bElIVe iN YoURseLF.      -->  Belive in yourself.
SELECT CONCAT(INITCAP ('bElIVe'), LOWER(' iN YoURseLF'))
FROM DUAL;

-- [4] ������ 7�������� ������� �Ի���� ��� �� ��ȸ (�Ʒ��� ���� ���)
/*
------------------------------------------------------------
    ����     |   �Ի��   |   �Ի� �����|
         7�� |       4�� |          2��|
         7�� |       9�� |          1��|
         ...
         9�� |       6�� |          1��|
------------------------------------------------------------
*/
SELECT LPAD(SUBSTR(EMP_NO, 3, 2) || '��', 8) "����"
        , LPAD(EXTRACT(MONTH FROM HIRE_DATE)||'��', 8) AS "�Ի�� "
        , LPAD(COUNT(*)||'��', 5) "�Ի� �����"
FROM EMPLOYEE
WHERE TO_NUMBER(SUBSTR(EMP_NO, 3, 2)) >= 7      --������ 7�� ������ ����� ����
GROUP BY SUBSTR(EMP_NO, 3, 2), EXTRACT(MONTH FROM HIRE_DATE)
ORDER BY 1,2; --ORDER BY ����, 2;

-- [5] �����μ� ����� ���, �����, �μ���, ���޸� ��ȸ
-- ���(EMPLOYEE), �μ�(DEPARTMENT), ����(JOB) --> JOIN(���� ���̺��� ��ġ�� �۾�)
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME
FROM EMPLOYEE
    JOIN DEPARTMENT ON(DEPT_CODE=DEPT_ID)
    JOIN JOB USING(JOB_CODE)
WHERE DEPT_TITLE LIKE '%����%';
