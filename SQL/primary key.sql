use JobRecruitmentDB

alter table Candidates
alter column candidateid int not null

alter table Candidates
add constraint pk_candidate primary key (candidateid)

select candidateid, count(*) as dup from Candidates
group by candidateid
having count(*)>1
--------------------------------------------
alter table applications
alter column applicationid int not null

alter table applications
add constraint pk_application primary key (applicationid)

---------------------------------------------

alter table candidateskills
alter column candidateskillid int not null

alter table candidateskills
add constraint pk_candidateskill primary key (candidateskillid)
------------------------------------------------------
alter table companies
alter column companyid int not null

alter table companies
add constraint pk_company primary key (companyid)

---------------------------------------------------------

alter table interviews
alter column interviewid int not null

alter table interviews
add constraint pk_interview primary key (interviewid)
---------------------------------------------------
alter table joboffers
alter column offerid int not null

alter table joboffers
add constraint pk_offer primary key (offerid)
---------------------------------------------------
alter table jobs
alter column jobid int not null

alter table jobs
add constraint pk_job primary key (jobid)
---------------------------------------------------
alter table recruiters
alter column recruiterid int not null

alter table recruiters
add constraint pk_recruiter primary key (recruiterid)
---------------------------------------------------
alter table skills
alter column skillid int not null

alter table skills
add constraint pk_skill primary key (skillid)
---------------------------------------------------



