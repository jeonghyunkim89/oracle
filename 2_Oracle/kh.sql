-- ����� ������ �������ּ���. (����ڸ�: C##KH / ��й�ȣ: KH)
--  �ش� ������ ���� ��� �߰� �� kh.sql ��ũ��Ʈ �����Ͽ� �Ʒ� ������ �������ּ���.

-- ��� ���̺��� ��� ���� ��ȸ
SELECT * FROM EMPLOYEE;

-- ���ʽ��� �ִ� ����� �����, �޿�, ���ʽ�, �����ڵ� ��ȸ
SELECT EMP_NAME �����, SALARY �޿�, BONUS ���ʽ�, JOB_CODE �����ڵ�
FROM EMPLOYEE
WHERE BONUS >= 0;
--WHERE BONUS IS NOT NULL; 

-- �̸����� 3��° ���ڰ� m�� ����� ��� ���� ��ȸ
SELECT * FROM EMPLOYEE
WHERE EMAIL LIKE '__m%';
--���ϵ�ī�� ��ȣ�� �����ν� ����ϰ��� �Ѵٸ� LIKE'__\_' ESCAPE '\'�� ���� �ۼ��ؾ���!

-- ���� ��� �� ��ȸ
SELECT COUNT(*)
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) IN('2', '4');

-- ������� ���� ����� �޿� �� ��ȸ
SELECT TO_CHAR(SUM(SALARY), 'L99,999,999') "�޿� ��"
FROM EMPLOYEE
WHERE ENT_YN = 'N';

-- 9���� �Ի��� ��� �� ��ȸ
SELECT COUNT(*)     --3
FROM EMPLOYEE       --1
WHERE EXTRACT(MONTH FROM HIRE_DATE) = 9;    --�Ի��� �÷����� �� ������ �����Ͽ� 9���� ��
                                            --2
----------------------------------------------------------
/*
	* �˻��ϰ��� �ϴ� ���� :
	
		�����ڵ尡 J7�̰ų� J6�̸鼭 SALARY ���� 200���� �̻��̰�
		BONUS�� �ְ� �����̸� �̸����ּҴ� _�տ� 3���ڸ� �ִ� �����
		�����, �ֹε�Ϲ�ȣ, �����ڵ�, �μ��ڵ�, �޿�, ���ʽ��� ��ȸ�ϰ��� �Ѵ�.
		
		(���������� ��ȸ�� �ȴٸ� 2���� ����� Ȯ���� �� ����)
*/

-- �Ʒ� ���������� ���� �� ���ϴ� ����� ������ �ʴ´�. 
--  � ������ �ִ� �� ������ �ľ��Ͽ� �ۼ��� ��, �ذ����ּ���.
SELECT EMP_NAME, EMP_NO, JOB_CODE, DEPT_CODE, SALARY, BONUS, EMAIL
FROM EMPLOYEE
WHERE (JOB_CODE = 'J7' OR JOB_CODE = 'J6') -- JOB_CODE IN('J7','J6')�� ����
     AND SALARY >= 2000000 
     AND EMAIL LIKE '___#_%' ESCAPE '#'
     AND BONUS IS NOT NULL
     AND SUBSTR(EMP_NO, 8, 1) IN( 2, 4);
--WHERE JOB_CODE = 'J7' OR JOB_CODE = 'J6' AND SALARY > 2000000 -- JOB_CODE IN('J7','J6')�� ����
--      AND EMAIL LIKE '____%' AND BONUS IS NULL;
-- ���� : WHERE ���������� �޿� 200���� �̻��̴ϱ� SALARY >= 2000000 ���� ����
        �̸����ּҴ� �տ� 3���ڸ��ִ� ����� �����̴ϱ� EMAIL LIKE '___@'���� ����
        ���ʽ��� �־���ϰ� AND BONUS >=0 ���ڿ����ϴϱ� AND SUBSTR(EMP_NO, 8, 1) IN('2', '4')
        �־�����Ѵ�.
        
    /* 1) �����ڵ忡 ���� ������ �켱������ ���� ����� ������� ����
        => ��ȣ�� �����ְų� IN�����ڷ� ��ü�ؾ���
    2) �ۼ��� ������ SALARY���� 200���� �ʰ�(>)�� �ۼ��Ǿ� ����
        => 200���� �̻��� ������ ��ȣ�� �߰�������� (>=)
    3) �̸����� 4��°�ڸ��� �����(_)�� ���ϵ�ī��� ����
    �����ν� ������ �ְ��� �Ѵٸ� ESCAPE�� ����Ͽ� ������ ���ϵ�ī��� �����������
    4) ���ʽ��� �ִ� ����� ��ȸ�ؾ��ϴµ� ���� ����� ��ȸ�ϰ� ����
    => BONUS IS NULL --> BONUS IS NOT NULL�� �����������
    5) ���ڻ�������� ������
    => ���ڻ�������� �߰��������
    *WHERE (JOB_CODE = 'J7' OR JOB_CODE = 'J6') -- JOB_CODE IN('J7','J6')�� ����
     AND SALARY >= 2000000 
     AND EMAIL LIKE '___#_%' ESCAPE '#'
     AND BONUS IS NOT NULL
     AND SUBSTR(EMP_NO, 8, 1) IN( 2, 4);
    */