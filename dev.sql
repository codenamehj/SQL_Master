SELECT * FROM tab;

create table student (
student_no VARCHAR2(10) primary key,
student_name VARCHAR2(100) not null,
eng_score NUMBER DEFAULT 80,
math_score NUMBER default 70
);

--등록, 수정, 삭제, 단건조회, 목록
insert into student(student_no, student_name, eng_score, math_score)
values ('23-001', '홍길동', 70, 75);

insert into student(student_no, student_name)--, eng_score, math_score)
values ('23-006', '김민수');

select * from student;

UPDATE student
set eng_score = 85
    , math_score = 75
where student_no = '23-002';

delete from student where student_no = '23-002';

select * from student where student_no = '23-002';

create table book (
book_code VARCHAR2(10) primary key,
book_title VARCHAR2(100) not null,
author VARCHAR2(100),
press VARCHAR2(100),
price NUMBER default 15000
);

--등록
insert into book (book_code, book_title, author, press, price)
values ('B002', 'ORACLE SQL', '예담', 'YD', 20000);

--목록
select * from book order by 1;

--단건조회
select * from book where book_code = 'B002';

--수정
UPDATE book
set price = 30000
where book_code = 'B002';

--삭제
delete from book where book_code = 'B002';                                

select lecture_code, lecture_title, teacher_name, lecture_start, student_num ,TO_CHAR(lecture_price, '9,999,999')lecture_price
from lectures;

select *
from lectures
where teacher_name = '나국어';

select *
from users
where id = 'idt001'
and password = 'pwt001';

select count(select * from enrolment where lecture_code='k001')as d
from lectures;

select * from lectures;

select *
from enrolment;

select count(*) from enrolment where lecture_code='k001';

select l.lecture_code, l.lecture_title, l.teacher_name, l.student_num, l.lecture_start, l.lecture_price
from lectures l, enrolment e
where l.lecture_code = e.lecture_code;

insert into enrolment(lecture_code, user_id)
values ('k001', 'id001');