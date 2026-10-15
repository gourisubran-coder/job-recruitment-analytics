USE JobRecruitmentDB

SELECT * FROM Candidates
SELECT * FROM CandidateSkills
SELECT * FROM Skills
SELECT * FROM Jobs
SELECT * FROM JobOffers
SELECT * FROM Applications
SELECT * FROM Interviews
SELECT * FROM Recruiters
SELECT * FROM Companies


select count(*) as TotalCandidate from Candidates
select count(*) as TotalCompany from Companies
select Count(*) as TotalApplication from Applications
select Count(*) as TotalJobs from Jobs
select Count(*) as TotalOffer from JobOffers

--Which education level has the most candidates?
select EducationLevel, COUNT(*) AS CandidateCount from Candidates
group by EducationLevel
order by CandidateCount

--candidate by current job title
select CurrentTitle, count(*) as Candidate from Candidates
group by CurrentTitle

--avg exp
select avg(ExperienceYears) as AverageExperience from Candidates

--resume score statics
select avg(ResumeScore) as AveScore, Min(ResumeScore) AS MinScore, max(ResumeScore) as MaxScore from Candidates

--Resume score category
select CandidateID, FirstName,  ResumeScore,
case 
    when ResumeScore >= 80 then 'Excellent'
    when ResumeScore >= 60 then 'Good'
    when ResumeScore >= 40 then 'Average'
    else 'Low'
    end as ResumeCategory
    from Candidates
    
--------------------------------------------------------------------------------------------
--COMPANY ANALYSIS


select Industry, count(*) as comanycount from Companies
group by Industry

select CompanySize, count(*) as Companycount from Companies
group by CompanySize

select Country, count(*) as CompanyCount from Companies
group by Country

--------------------------------------------------------------------------------------
--job analysis
select * from Jobs
 
select Department, count(*) as JobCount from Jobs
group by Department

SELECT Status, COUNT(*) AS JobCount FROM Jobs
GROUP BY Status
ORDER BY JobCount DESC;

SELECT
    AVG(SalaryMin) AS AverageMinimumSalary,
    AVG(SalaryMax) AS AverageMaximumSalary,
    MIN(SalaryMin) AS LowestSalary,
    MAX(SalaryMax) AS HighestSalary
FROM Jobs;

select Department, avg(SalaryMin) as minavgsalary, avg(SalaryMax) as maxavgsalary from Jobs
group by Department

--------------------------------------------------------------------------------
--joins
--Q25. Display all jobs along with the company name
--Question:
--Which company has posted each job?

select j.JobID, j.Title as JobTitle, j.Department, c.CompanyName from Jobs as j
join Companies as c
on j.CompanyID = c.CompanyID

--Q26. Display all jobs with company name and industry
--Question:
--For each job, show the company and the industry it belongs to.

select j.JobID , j.Title as JobTitle,j.Department ,j.JobType ,c.CompanyName, c.Industry  from Jobs as j
join Companies as c
on j.CompanyID = c.CompanyID

--Q27. Display all applications with candidate names
--Question:
--Which candidate submitted each application?
select a.ApplicationID, a.CandidateID, C.FirstName,A.ApplicationDate ,a.Status, A.Source, C.Country , C.EducationLevel  from Applications as a
join Candidates as c 
on a.CandidateID = c.CandidateID

--Q28. Display applications with candidate name and job title
--Question:
--Which candidate applied for which job?

SELECT a.ApplicationID , c.FirstName, j.Title as jobtitle, a.Status, a.Source, A.ApplicationDate FROM Applications AS A
join Candidates as c
on a.CandidateID = c.CandidateID
join Jobs as j
on a.JobID = j.JobID

----Q29. Display candidate, job and company information
--Question:
--For every application, show the candidate, job and company.

select A.ApplicationID, C.FirstName, C.CurrentTitle, J.JobType, CO.CompanyName, J.Department , CO.Industry, A.Status FROM Applications as a
join Jobs as j
on a.JobID = j.JobID

join Companies as co
on j.CompanyID = co.CompanyID

join Candidates AS C
ON a.CandidateID = c.CandidateID

---Complete candidate recruitment journey
--Question:
--Show the complete journey of each candidate from application to interview to offer.
SELECT
    c.CandidateID,
    c.FirstName + ' ' + c.LastName AS CandidateName,

    j.Title AS JobTitle,
    co.CompanyName,

    a.ApplicationDate,
    a.Status AS ApplicationStatus,

    i.InterviewDate,
    i.Round,
    i.Score,
    i.Status AS InterviewStatus,

    jo.OfferDate,
    jo.SalaryOffered,
    jo.Status AS OfferStatus,
    jo.JoiningDate

FROM Candidates c

LEFT JOIN Applications a
    ON c.CandidateID = a.CandidateID

LEFT JOIN Jobs j
    ON a.JobID = j.JobID

LEFT JOIN Companies co
    ON j.CompanyID = co.CompanyID

LEFT JOIN Interviews i
    ON a.ApplicationID = i.ApplicationID

LEFT JOIN JobOffers jo
    ON a.ApplicationID = jo.ApplicationID

ORDER BY c.CandidateID;

--Q47. Complete recruitment funnel by company 
--Question:
--For each company, how many jobs, applications, interviews and offers are there?

SELECT
    c.CompanyName,

    COUNT(DISTINCT j.JobID) AS JobsPosted,

    COUNT(DISTINCT a.ApplicationID) AS Applications,

    COUNT(DISTINCT i.InterviewID) AS Interviews,

    COUNT(DISTINCT jo.OfferID) AS Offers

FROM Companies c

LEFT JOIN Jobs j
    ON c.CompanyID = j.CompanyID

LEFT JOIN Applications a
    ON j.JobID = a.JobID

LEFT JOIN Interviews i
    ON a.ApplicationID = i.ApplicationID

LEFT JOIN JobOffers jo
    ON a.ApplicationID = jo.ApplicationID

GROUP BY
    c.CompanyName

ORDER BY Applications DESC;
--------------------------------------------------------------------------------------------------
--APPLICATION 
use JobRecruitmentDB
select * from Applications

select ApplicationID, ApplicationDate, Status from Applications

SELECT c.CompanyName , COUNT(*) AS APPLICATIONCOUNT  FROM Applications AS A
JOIN Jobs AS J
ON A.JobID = J.JobID
JOIN Companies AS C 
ON J.CompanyID = C.CompanyID
GROUP BY C.CompanyName

--TOP 10 JOBS
select top 10 j.Title, count(a.ApplicationID) as appliactioncount  from Applications as a
join Jobs as j
on a.JobID = j.JobID
group by j.Title
----------------------------------------------------------------------
--interview analysis
select * from Interviews

select Status, count(*) as InterviewCount from Interviews
group by Status

-------------------------------------------------------------------------------------------------------

SELECT FirstName, LastName, Email, Phone, Country FROM Candidates

SELECT FirstName+' '+LastName AS NAME, Email, Phone, State, CurrentTitle, EducationLevel, ResumeScore FROM Candidates
WHERE ExperienceYears > 3
ORDER BY ResumeScore DESC

SELECT FirstName+' '+LastName AS NAME, Email, Phone, State, CurrentTitle, EducationLevel, ResumeScore, ExperienceYears FROM Candidates
WHERE ExperienceYears >= 2 AND ResumeScore >= 75
ORDER BY ExperienceYears DESC

SELECT FirstName+' '+LastName AS NAME, EducationLevel, ResumeScore FROM Candidates
WHERE EducationLevel ='DIPLOMA' OR EducationLevel = 'HIGH SCHOOL'
ORDER BY ResumeScore DESC

SELECT FirstName+' '+LastName AS NAME, EducationLevel, ResumeScore, ExperienceYears FROM Candidates
WHERE ExperienceYears BETWEEN 2 AND 10
ORDER BY ExperienceYears

SELECT * FROM Candidates
WHERE FirstName+' '+LastName LIKE 'A%'

SELECT * FROM Candidates
WHERE LastName LIKE '%g'

SELECT * FROM Candidates
WHERE city LIKE '%il%'

SELECT FirstName+' '+LastName AS NAME, EducationLevel, ResumeScore, ExperienceYears FROM Candidates
WHERE EducationLevel IN ('DIPLOMA', 'PHD', 'HIGH SCHOOL')
ORDER BY ResumeScore

----------------------------------CASE----------------------------------------
SELECT FirstName+' '+LastName AS NAME, EducationLevel, ResumeScore, ExperienceYears,
CASE 
    WHEN ExperienceYears = 0 THEN 'FRESHER'
    WHEN ExperienceYears between 1 and 2 then 'JUNIOR'
    WHEN ExperienceYears BETWEEN 3 AND 6 THEN 'MID LEVEL'
    ELSE 'SENIOR' END AS EXPLEVEL
    FROM Candidates
ORDER BY ResumeScore


SELECT EducationLevel, COUNT(*) AS CANDIDATE FROM Candidates
GROUP BY EducationLevel


SELECT EducationLevel, COUNT(*) AS CANDIDATE FROM Candidates
GROUP BY EducationLevel
HAVING COUNT(*) < 90

select r.FirstName AS NAME, r.Designation,c.CompanyName, c.FoundedYear from Recruiters as r
JOIN Companies AS C
on r.CompanyID = c.CompanyID
order by c.FoundedYear

SELECT * FROM Candidates
SELECT * FROM Jobs
SELECT * FROM Applications
SELECT * FROM Companies

SELECT C.CompanyID,C.CompanyName, CD.FIRSTNAME, J.TITLE, A.STATUS FROM Companies AS C
JOIN Jobs AS J 
ON C.CompanyID = j.CompanyID

join Applications as a
on a.JobID = j.JobID

join Candidates as cd
on cd.CandidateID = a.ApplicationID
ORDER BY C.CompanyID

--Find candidates whose resume score is above the average.
SELECT * FROM Candidates
WHERE ResumeScore >
(
  SELECT AVG(ResumeScore) FROM Candidates
)

-----COMMON TABLE EXPRESSION 

---------------------------------------------------------------------

--WINDOW FUNCTION--
select FirstName ,EducationLevel, ResumeScore, ExperienceYears,
AVG(ResumeScore) OVER(PARTITION BY EDUCATIONLEVEL) AS EDUACTIONAVGSCORE 
FROM Candidates
ORDER BY ResumeScore

SELECT * FROM Candidates

--row number
select CandidateID, FirstName, LastName, EducationLevel,ResumeScore,
row_number() over(order by ResumeScore desc ) as Candidatenum from Candidates

--rank
select CandidateID, FirstName, LastName, EducationLevel,ResumeScore,
rank() over(order by ResumeScore desc ) as CandidateRank from Candidates

--dense rank with education
select CandidateID, FirstName, LastName, EducationLevel,ResumeScore,
dense_rank() over(order by ResumeScore desc ) as CandidateRank from Candidates
USE JobRecruitmentDB

--TOP 5 candidates for every education level
with RankedCandidate as 
 (
   select CandidateID,
   FirstName,
   LastName,
   EducationLevel, 
   ExperienceYears, 
   ResumeScore, 
   dense_rank() OVER(
      partition by EducationLevel
      order by ResumeScore desc
      )as CandidateRank
   from Candidates
  )

  select * from RankedCandidate
  where CandidateRank <=5 
  order by EducationLevel, CandidateRank

  --NTILE — candidate quartiles

    select CandidateID, FirstName, EducationLevel, ExperienceYears, ResumeScore,
    ntile(4) over(order by ResumeScore desc) as PerformanceQuartile
    from Candidates

    --Candidate segmentation with CTE + NTILE

with Segmentation AS
    (
    select FirstName, LastName, ExperienceYears, EducationLevel, ResumeScore,
    ntile(4) over(order by ResumeScore desc) as Quartile
    from Candidates
    )
    select *,  
    case 
         when Quartile =1 then 'Good'
         when Quartile =2 then 'Above Average'
         when Quartile =3 then 'Below Average'
         else 'Below Expecation'
         end as CandiaiteSegemnatation
from Segmentation

--LAG
--When did this candidate apply previously
select ApplicationID, CandidateID, ApplicationDate,
lag(ApplicationDate) over (partition by CandidateID order by ApplicationDate)
from Applications

--lead
--next application
select ApplicationID, CandidateID, ApplicationDate,
lead(ApplicationDate) over (partition by CandidateID order by ApplicationDate)
from Applications

--Number of applications per candidate
select CandidateID, count(*) AS APPLICATIONCOUNT from Applications
GROUP BY CandidateID
ORDER BY APPLICATIONCOUNT

--Candidates with multiple applications
select CandidateID, count(*) AS APPLICATIONCOUNT from Applications
GROUP BY CandidateID
HAVING COUNT(*) >1
ORDER BY APPLICATIONCOUNT

--PART Q — EXISTS
--60. Candidates who applied for at least one job

SELECT c.CandidateID, c.FirstName, c.LastName FROM Candidates as c
where exists
(
  select 1 from Applications as a
  where a.CandidateID = c.CandidateID
)

--61. Candidates who never applied

SELECT c.CandidateID, c.FirstName, c.LastName FROM Candidates as c
where not exists
(
  select 1 from Applications as a
  where a.CandidateID = c.CandidateID
)
--CHECKING
select * from Applications
WHERE CandidateID = 1

--Recruitment Funnel
WITH Funnel AS
(
    SELECT
        COUNT(DISTINCT a.ApplicationID) AS Applications,

        COUNT(DISTINCT i.ApplicationID) AS Interviews,

        COUNT(DISTINCT jo.ApplicationID) AS Offers,

        COUNT(DISTINCT
            CASE
                WHEN jo.Status = 'Accepted'
                THEN jo.ApplicationID
            END
        ) AS Hires

    FROM Applications a

    LEFT JOIN Interviews i
        ON a.ApplicationID = i.ApplicationID

    LEFT JOIN JobOffers jo
        ON a.ApplicationID = jo.ApplicationID
)

SELECT
    Applications,
    Interviews,
    Offers,
    Hires,

    Interviews * 100.0 /
        NULLIF(Applications, 0) AS InterviewRate,

    Offers * 100.0 /
        NULLIF(Interviews, 0) AS OfferRate,

    Hires * 100.0 /
        NULLIF(Applications, 0) AS HiringRate

FROM Funnel;

----------check if power bi bashborad is working
select * from applications
update applications set status = 'Applied' where applicationid = 1


