SELECT 
ps.PatientId 
,ps.Hospital
,PS.Ward
,ps.AdmittedDate
,ps.DischargeDate
,DATEDIFF(DAY,ps.AdmittedDate,ps.DischargeDate) as LengthOfStay
,DATEADD(WEEK,-2,ps.AdmittedDate) as ReminderDate
,ps.Ethnicity
,ps.Tariff
 FROM PatientStay ps

WHERE ps.Hospital  IN ('Kingston','PRUH')

AND ps.Ward LIKE '%Surgery'

AND ps.AdmittedDate between '2024-02-27' and '2024-03-01'

AND ps.Tariff > 5

order by 
    ps.AdmittedDate desc
    ,ps.PatientId desc

select 
ps.Hospital
,ps.Ward
,COUNT (*) as NumberOfPatients
,SUM(ps.Tariff) as TotalTariff
,AVG(ps.tariff) as AverageTariff
From 
PatientStay ps

GROUP BY 
    ps.Hospital
        ,ps.Ward

        order by 
            NumberOfPatients desc

Select * 

from DimHospitalBad

Select 
     ps.PatientId
    ,ps.AdmittedDate
    ,ps.Hospital
    ,h.Hospital
    ,h.HospitalSize
 from PatientStay ps LEFT JOIN DimHospitalBad H on ps.Hospital = h.Hospital


SELECT
    ps.PatientId 
    ,ps.AdmittedDate 
,h.Hospital
    ,h.HospitalSize
FROM
    PatientStay ps
    LEFT JOIN DimHospitalBad h ON ps.Hospital = h.Hospital
 