--Deliverable 1 ------------------------------------------------------------------------

--Query 1 - Retirement Titles
select
e.emp_no
e.first_name, 
e.last_name,
t.title,
t.from_date,
t.to_date
into Retirement_Titles
from employees as e
inner join titles as t
on (t.emp_no = e.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no DESC;

--Query 2 - Unique Titles
select distinct on 
(rt.emp_no)
rt.emp_no,
rt.first_name, 
rt.last_name,
rt.title,
t.from_date,
t.to_date
into unique_titles
from retirement_titles as rt
inner join titles as t
on (t.emp_no = rt.emp_no)
WHERE t.to_date = '9999-01-01'
ORDER BY rt.emp_no ASC;


--Query 3 Retiring Titles
select count(*), title
into retiring_titles
from unique_titles
group by title
order by count desc;

--Deliverable 2 ------------------------------------------------------------------------

select distinct on
(e.emp_no)
e.emp_no,
e.first_name, 
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
into mentorship_eligibility
from employees as e
inner join dept_emp as de
on (e.emp_no = de.emp_no)
inner join titles as t
on (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no desc;