USE wine;
SELECT * FROM wine LIMIT 5;

#Average Attributes of Wines by Quality
SELECT quality, 
AVG(`fixed acidity`) AS `avg_fixed_acidity`,
AVG(`volatile acidity`) AS `avg_volatile_acidity`,
AVG(`citric acid`) AS `avg_citric_acid`,
AVG(`residual sugar`) AS `avg_residual_sugar`,
AVG(alcohol) AS `avg_alcohol`
FROM wine
GROUP BY quality
ORDER BY quality DESC;

#Most Common Attributes for High- vs. Low-Quality Wines
SELECT 
CASE 
WHEN quality >= 7 THEN 'High Quality'
WHEN quality <= 5 THEN 'Low Quality'
ELSE 'Medium Quality'
END AS quality_category,
ROUND(AVG(alcohol), 2) AS avg_alcohol,
ROUND(AVG(`volatile acidity`), 2) AS avg_volatile_acidity,
ROUND(AVG(sulphates), 2) AS avg_sulphates,
ROUND(AVG(`citric acid`), 2) AS avg_citric_acid
FROM wine
GROUP BY quality_category;

#Effect of Alcohol Content on Quality
SELECT quality, AVG(alcohol) AS avg_alcohol_content 
FROM wine
GROUP BY quality
ORDER BY quality DESC;

#Impact of Acidity on Wine Quality
SELECT quality, 
AVG(pH) AS avg_pH, 
AVG(`fixed acidity`) AS avg_fixed_acidity
FROM wine
GROUP BY quality
ORDER BY quality DESC;

#Most Common Characteristics of High-Quality Wines (7+)
SELECT 
ROUND(AVG(`alcohol`), 2) AS `avg alcohol`,
ROUND(AVG(`volatile acidity`), 2) AS `avg volatile acidity`,
ROUND(AVG(`sulphates`), 2) AS `avg sulphates`,
ROUND(AVG(`citric acid`), 2) AS `avg citric acid`,
ROUND(AVG(`pH`), 2) AS `avg pH`,
ROUND(AVG(`density`), 5) AS `avg density`
FROM wine
WHERE quality >= 7;

# Most Common Characteristics of Low-Quality Wines (≤5)
SELECT 
ROUND(AVG(`alcohol`), 2) AS `avg alcohol`,
ROUND(AVG(`volatile acidity`), 2) AS `avg volatile acidity`,
ROUND(AVG(`sulphates`), 2) AS `avg sulphates`,
ROUND(AVG(`citric acid`), 2) AS `avg citric acid`,
ROUND(AVG(`pH`), 2) AS `avg pH`,
ROUND(AVG(`density`), 5) AS `avg density`
FROM wine
WHERE quality <= 5;

