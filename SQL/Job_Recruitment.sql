use JobRecruitmentDB

select table_name from INFORMATION_SCHEMA.tables where TABLE_TYPE = 'base table' order by TABLE_NAME

select 'Applications' as tablename, count(*) as recordcount from Applications$
select 'Candidates' as tablename, count(*) as recordcount from Candidates

select top 10 * from Candidates$

select TABLE_NAME, COLUMN_NAME, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME IN ('applications$','candidates$','CandidateSkills') order by TABLE_NAME

---------------------------------------------------------------------------------------------
select * from Candidates$
select top 10 * from Candidates$
select count(*) as [Total Candidate] from Candidates$


-----EDUCATION COUNT
select EducationLevel, count(*) as TotalCandidiate from Candidates$
group by EducationLevel
ORDER BY TotalCandidiate
----AVG EXP
SELECT AVG(experienceyears) as [Avg Experience] from Candidates$
---exp by education
select EducationLevel, avg(ExperienceYears) as Experience from Candidates$
group by EducationLevel
ORDER BY Experience
---resume score
select avg(ResumeScore) as [Avg Score],
max(ResumeScore) as [Highest Resume Score],
min(ResumeScore) as [Lowest Resume Score]
from Candidates$
--edu vs resume
select EducationLevel, count(*) as candidates, avg(ResumeScore) as avgRESUMEscore from Candidates$
group by EducationLevel
ORDER BY avgRESUMEscore

-------------------------------------------------------------------
SELECT * FROM Applications$

SELECT * FROM Applications$
WHERE Status = 'REJECTED'

SELECT STATUS, COUNT(*) AS REJECTED FROM Applications$
WHERE Status = 'REJECTED'
GROUP BY Status

SELECT SOURCE, COUNT(*) AS Reject FROM Applications$
where Status = 'REJECTED'
GROUP BY SOURCE
ORDER BY Reject

-----------------------------------------------------------
select * from Companies$

-----------------------------------------------------------------------------------
select * from Recruiters$

select r.FirstName AS NAME, r.Designation,c.CompanyName, c.FoundedYear from Recruiters$ as r
JOIN Companies$ AS C
on r.CompanyID = c.CompanyID
order by c.FoundedYear