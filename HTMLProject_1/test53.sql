-- 프로시저 / 트리거 = 보안 / 가독성 (분석이 어렵다) => ERP (관리)
/*
     FUNCTION => 리턴형을 가지고 있다 ,SELECT만 사용이 가능 
                          DML 사용이 불가능 
     프로시저 => 리턴형이 없는 함수 
                       SELECT / INSERT / UPDATE / DLETE 가 가능 
        => 컬럼명이나 SQL문장을 볼 수 없다 (보안)
        => 단점 : 웹 개발자는 이해하기 어렵다 
                      SQL문장을 볼 수 없어서 1. 변경이 어렵다 , 분석이 어렵다 
                      => 공기업 프로젝트 
                      => 공기업 / 금융권 => 70%
        프로시저 => 270page
         1. 형식 
            CREATE [OR REPLACE] PROCEDURE pro_name(매개변수...)
            IS 
              변수선언 
            BEGIN 
              처리문장 => SQL 
            END;
         2. 매개변수       
             = IN변수 => 값 대입 / 값 입력 => INSERT/UPDATE/DELETE
                => IN생략이 가능 
                => 형식)
                      변수 IN 데이터형 
             = OUT변수 => 값을 읽어오는 변수 : 리턴형 대신 사용 
                             => 매개변수로 값을 받는다 
                                  CALL BY REFERENCE 
                                    => 메모리 주소를 이용하는 프로그램
                형식)
                      변수 OUT 데이터형  => 목록 / 상세보기 / 검색 
                                                  => SELECT
             = INOUT변수 => IN/OUT도 가능 
                SELECT id,name,sex FROM member
                WHERE id=값

            int[] arr=new int[5];
            public void display(int[] arr)
            {
                 arr[0]=100;
            }

            display(arr) ==> 일반변수도 가능 NUMBER/VARCHAR...

            삭제 : DROP PROCEDURE pro_name
            오류 확인 : show error 
*/
-- IN변수 사용 : INSERT / UPDATE / DELETE
-- OUT변수 사용 : SELECT 
/*
    포트폴리어 : PR 
    ------------------ 
    => JSP프로젝트에서 사용 => 고급 SQL 
    1. 프로시저 : 댓글  => 맛집/레시피/스토어 
    2. 트리거 : 좋아요 / 찜 => 자동으로 증가 
    
*/
/*
     CallableStatement cs;
     String sql="{CALL studentInsert(?,?,?,?)}"; = 함수 호출 
     cs=conn.preparedCall(sql)
     => 오라클의 라이브러리 함수 
     => 반복 => ERP => 반복 70%
*/
-- CALL studentInsert('',100,100,100)
-- INSERT : student
CREATE OR REPLACE PROCEDURE studentInsert(
   pName student.name%TYPE,
   pKor student.kor%TYPE,
   pEng  student.eng%TYPE,
   pMath student.math%TYPE
) 
IS
BEGIN
  INSERT INTO student VALUES(
     (SELECT NVL(MAX(hakbun)+1,1) FROM student),
     pName,pKor,pEng,pMath
  );
  COMMIT;
END;
/
-- UPDATE 
-- CALL studentUpdate(1,'',100,100,100)
CREATE OR REPLACE PROCEDURE studentUpdate(
   pHakbun student.hakbun%TYPE,
   pName student.name%TYPE,
   pKor student.kor%TYPE,
   pEng  student.eng%TYPE,
   pMath student.math%TYPE
) 
IS
BEGIN
  UPDATE student SET 
  name=pName,kor=pKor,eng=pEng,math=pMath
  WHERE hakbun=pHakbun;   
  COMMIT;
END;
/

-- DELETE 
-- CALL studentDelete(1)
/*
CREATE OR REPLACE PROCEDURE studentDelete(pHakbun student.hakbun%TYPE)
IS
BEGIN
   DELETE FROM student
   WHERE hakbun=pHakbun;
   COMMIT;
END;
/
*/
/*
-- OUT 변수 사용 => SYS_REFCURSOR => 자바 
CREATE OR REPLACE PROCEDURE studentDetailData(
    pHakbun IN student.hakbun%TYPE,
    pName OUT student.name%TYPE,
    pKor OUT student.kor%TYPE,
    pEng OUT student.eng%TYPE,
    pMath OUT student.math%TYPE
)
IS
BEGIN 
  SELECT name,kor,eng,math INTO pName,pKor,pEng,pMath
  FROM student
  WHERE hakbun=pHakbun;
END;
/
*/
-- OUT => 매개변수로 값을 받는 경우 
-- CURSOR 
CREATE OR REPLACE PROCEDURE studentAllData(
   pResult OUT SYS_REFCURSOR
)
IS
BEGIN
   OPEN pResult FOR
     SELECT * FROM student;
END;
/
-- CURSOR는 ROW단위로 값을 받는 경우 

DROP PROCEDURE studentDetailData;
CREATE OR REPLACE PROCEDURE studentDetailData(
    pHakbun IN student.hakbun%TYPE,
    pResult OUT SYS_REFCURSOR
)
IS
BEGIN 
  OPEN pResult FOR
   SELECT * 
   FROM student
   WHERE hakbun=pHakbun;
END;
/



