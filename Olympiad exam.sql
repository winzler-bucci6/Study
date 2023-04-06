with cte as(SELECT sl.ï»¿roll_number,sl.student_name,sl.class,sl.section,sl.school_name
 -- ,sr.option_marked,ca.correct_option,pc.subject
 , sum(case when pc.subject='Math' and sr.option_marked=ca.correct_option and sr.option_marked<>'e' 
         then 1 else 0 end) as math_correct
 , sum(case when pc.subject='Math' and sr.option_marked<>ca.correct_option and sr.option_marked<>'e' 
         then 1 else 0 end) as math_wrong    
 , sum(case when pc.subject='Math' and sr.option_marked='e' 
         then 1 else 0 end) as math_yet_to_learn
 , sum(case when pc.subject='Math'  then 1 else 0 end) as Total_Math_Questions 
 , sum(case when pc.subject='Science' and sr.option_marked=ca.correct_option and sr.option_marked<>'e' 
         then 1 else 0 end) as Science_correct
 , sum(case when pc.subject='Science' and sr.option_marked<>ca.correct_option and sr.option_marked<>'e' 
         then 1 else 0 end) as Science_wrong    
 , sum(case when pc.subject='Science' and sr.option_marked='e' 
         then 1 else 0 end) as Science_yet_to_learn
 , sum(case when pc.subject='Science'  then 1 else 0 end) as Total_Science_Questions 
 FROM product_based_company.stustudent_list as sl
 join student_response as sr on sr.roll_number=sl.ï»¿roll_number
 join correct_answer as ca on ca.question_paper_code=sr.question_paper_code 
 and ca.question_number=sr.question_number
 join question_paper_code pc on pc.ï»¿paper_code=ca.question_paper_code
 group by sl.ï»¿roll_number,sl.student_name,sl.class,sl.section,sl.school_name)
select ï»¿roll_number,student_name,class,section,school_name,math_correct,math_wrong,math_yet_to_learn,math_correct as math_score,
round((math_correct/Total_Math_Questions) * 100,2) as math_percentage 
,Science_correct,Science_wrong,Science_yet_to_learn,Science_correct as Science_score,
round((Science_correct/Total_Science_Questions) * 100,2) as Science_percentage
from cte;

