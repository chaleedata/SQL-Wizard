/* Create new report table report_average_scores
The new table, report_average_scores consists of the following
columns: subject , avg_written_exam_score , and
avg_oral_exam_score (which are of type DECIMAL(4,2) ).*/

INSERT INTO report_average_scores(subject, avg_written_exam_score, avg_oral_exam_score)
SELECT 
  subject,
  AVG(written_exam_score),
  AVG(oral_exam_score)
FROM exam
GROUP BY subject;