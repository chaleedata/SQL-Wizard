/*The university wants to have a list of all oral exams in which students got
more than 20 points. They want it in a new table,
report_good_oral_exams*/

INSERT INTO report_good_oral_exams(exam_id, student_id, subject)
SELECT id, student_id, subject
FROM exam
WHERE oral_exam_score > 20;