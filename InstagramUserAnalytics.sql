use ig_clone;
/*Query for Loyal User Reward[Loyal User Reward: Identify the five oldest users on Instagram from the
provided database.]*/
SELECT *
FROM users
ORDER BY created_at ASC
LIMIT 5; 

/*Query for Inactive User Engagement[Inactive User Engagement: Identify users who have never posted a single
photo on Instagram.]*/
SELECT username
FROM users u
LEFT JOIN photos p
ON u.id = p.user_id
WHERE p.id IS NULL;

/* Query for contest winner details [Contest Winner Declaration:: Determine the winner of the contest and
provide their details to the team.]*/
SELECT u.username, p.id AS photo_id, p.image_url,
COUNT(l.user_id) AS total_likes
FROM photos p
INNER JOIN likes l ON l.photo_id = p.id
INNER JOIN users u ON u.id = p.user_id
GROUP BY p.id, u.username, p.image_url
ORDER BY total_likes DESC
LIMIT 1;


/* Query to identify the top five most commonly used hashtags [Hashtag Research: Identify and suggest the top five most commonly used
hashtags on the platform]*/
SELECT t.tag_name , COUNT(*) AS usage_count
FROM photo_tags pt
JOIN tags t
ON t.id = pt.tag_id
GROUP BY tag_name
ORDER BY usage_count DESC
LIMIT 5;


/*Ad Campaign Launch Query[Ad Campaign Launch: Determine the day of the week when most users
register on Instagram. Provide insights on when to schedule an ad campaign.]*/
SELECT dayname(created_at) AS cam_day, count(*) as count_total
FROM users
GROUP BY cam_day
ORDER BY count_total DESC
LIMIT 1