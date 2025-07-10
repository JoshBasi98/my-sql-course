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

order by 
    ps.AdmittedDate desc
    ,ps.PatientId desc




 