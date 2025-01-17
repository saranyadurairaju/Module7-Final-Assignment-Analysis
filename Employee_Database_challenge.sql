-- Challenge
-- De1iverable 1

SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles 
FROM employees AS e
JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Checking the table records

SELECT * from retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows

SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Checking the table records
SELECT * from unique_titles;

-- Finding the number of retiring employees in each title

SELECT COUNT(emp_no) AS count, title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

-- Checking the table records
SELECT * from retiring_titles;

-- Deliverable 2

DROP TABLE mentorship_eligibility;

SELECT DISTINCT ON (e.emp_no) e.emp_no, 
					e.first_name, e.last_name, e.birth_date, 
					de.from_date, de.to_date, t.title
INTO mentorship_eligibility
FROM employees AS e
JOIN dept_employees AS de
ON (e.emp_no = de.emp_no)
JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01' AND 
	   (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'))
ORDER BY e.emp_no;

-- Checking the table records
SELECT * from mentorship_eligibility;
