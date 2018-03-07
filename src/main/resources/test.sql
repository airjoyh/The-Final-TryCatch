insert into member(member_id, member_pass, member_div, registDate, user_authCode, user_authStatus)
	    values('abc1@naver.com', '1234', 'user', sysdate, '4321', 'N');
insert into member(member_id, member_pass, member_div, registDate, user_authCode, user_authStatus)
	    values('abc2@naver.com', '1234', 'user', sysdate, '4321', 'N');
insert into member(member_id, member_pass, member_div, registDate, user_authCode, user_authStatus)
	    values('abc3@naver.com', '1234', 'user', sysdate, '4321', 'N');
insert into member(member_id, member_pass, member_div, registDate, user_authCode, user_authStatus)
	    values('abc4@naver.com', '1234', 'user', sysdate, '4321', 'N');
insert into member(member_id, member_pass, member_div, registDate, user_authCode, user_authStatus)
	    values('abc5@naver.com', '1234', 'user', sysdate, '4321', 'N');
insert into member(member_id, member_pass, member_div, registDate, user_authCode, user_authStatus)
	    values('abc6@naver.com', '1234', 'user', sysdate, '4321', 'N');
insert into member(member_id, member_pass, member_div, registDate, user_authCode, user_authStatus)
	    values('abc7@naver.com', '1234', 'user', sysdate, '4321', 'N');
insert into member(member_id, member_pass, member_div, registDate, user_authCode, user_authStatus)
	    values('abc8@naver.com', '1234', 'user', sysdate, '4321', 'N');
insert into member(member_id, member_pass, member_div, registDate, user_authCode, user_authStatus)
	    values('abc9@naver.com', '1234', 'user', sysdate, '4321', 'N');
insert into member(member_id, member_pass, member_div, registDate, user_authCode, user_authStatus)
	    values('abc10@naver.com', '1234', 'user', sysdate, '4321', 'N');
	    
	    
	    
select constraint_name, status from all_constraints
where table_name='portfolio';

select table_name,constraint_name,status
from user_constraints
where table_name='member';

select constraint_name,constraint_type,table_name,r_constraint_name from user_constraints;


insert into member(member_id, member_pass, member_type, registDate, user_authCode)
	    values('airjoyh@naver.com', '1234', 'user', sysdate, '4321');

insert into member(member_id, member_pass, member_type, registDate, user_authCode)
	    values('ekwjd72h@naver.com', '1234', 'user', sysdate, '4321');
	
-- 경영진 평점에 따른 순위 구하기     
select company_id, company_name, company_size, company_turnover,
  			   company_line, rank, avg_manager,
		from(select company_info.company_id as company_id, company_name,
					company_size, company_turnover, company_line,
					nvl(round(avg(review_manager),1),0.0) avg_manager,
					RANK() OVER(order by nvl(avg(review_manager),0.0) desc) as rank,	
			from company_info left outer join review 
			on company_info.company_id = review.company_id
			group by company_info.company_id, company_name,
					 company_size, company_turnover, company_line)	    
	    
select * from CONTEST;
select * from COMPANY_INFO;