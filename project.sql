SELECT * FROM ashish.project;

select Outcome, count(Outcome) from project
group by Outcome;

select Outcome, avg(Glucose), avg(bmi), avg(BloodPressure), avg(SkinThickness), avg(Insulin), avg(DiabetesPedigreeFunction), avg(Age) from project
group by Outcome;