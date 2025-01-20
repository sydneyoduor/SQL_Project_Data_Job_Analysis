SELECT
    skills,
    COUNT(job_postings_fact.job_id) as demand_count

FROM
    job_postings_fact

INNER JOIN skills_job_dim
    ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE
    job_title_short = 'Data Analyst' AND
    job_location IN ('Kenya', 'Anywhere')

GROUP BY
    skills

ORDER BY
    demand_count DESC

LIMIT 5