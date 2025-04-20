CREATE DATABASE internship;
USE internship;

CREATE TABLE content_reactions (
    id INT PRIMARY KEY,
    content_id VARCHAR(50),
    reaction_type VARCHAR(50),
    datetime_str VARCHAR(50),
    content_type VARCHAR(50),
    category VARCHAR(50),
    sentiment VARCHAR(20),
    score INT
);

INSERT INTO content_reactions (id, content_id, reaction_type, datetime_str, content_type, category, sentiment, score) VALUES
(0, '97522e57-d9ab-4bd6-97bf-c24d952602d2', 'disgust', '7/11/20 9:43', 'photo', 'studying', 'negative', 0),
(1, '97522e57-d9ab-4bd6-97bf-c24d952602d2', 'dislike', '17/6/21 12:22', 'photo', 'studying', 'negative', 10),
(2, '97522e57-d9ab-4bd6-97bf-c24d952602d2', 'scared', '18/4/21 5:13', 'photo', 'studying', 'negative', 15),
(3, '97522e57-d9ab-4bd6-97bf-c24d952602d2', 'disgust', '6/1/21 19:13', 'photo', 'studying', 'negative', 0),
(4, '97522e57-d9ab-4bd6-97bf-c24d952602d2', 'interested', '23/8/20 12:25', 'photo', 'studying', 'positive', 30),
(5, '97522e57-d9ab-4bd6-97bf-c24d952602d2', 'like', '23/8/20 14:25', 'photo', 'studying', 'positive', 35),
(6, '97522e57-d9ab-4bd6-97bf-c24d952602d2', 'happy', '24/8/20 8:00', 'photo', 'studying', 'positive', 40),
(7, '97522e57-d9ab-4bd6-97bf-c24d952602d2', 'angry', '25/8/20 10:00', 'photo', 'studying', 'negative', 5),
(8, '97522e57-d9ab-4bd6-97bf-c24d952602d2', 'surprised', '25/8/20 15:00', 'photo', 'studying', 'positive', 50),
(9, '97522e57-d9ab-4bd6-97bf-c24d952602d2', 'confused', '26/8/20 10:45', 'photo', 'studying', 'neutral', 20);
SHOW TABLES;
SELECT * FROM content_reactions;

SELECT sentiment, COUNT(*) 
FROM content_reactions 
GROUP BY sentiment;

SELECT * 
FROM content_reactions 
WHERE score > 10 
ORDER BY score DESC;

SELECT sentiment, COUNT(*) AS total_reactions
FROM content_reactions
GROUP BY sentiment;

CREATE TABLE content_info (
    content_id VARCHAR(50) PRIMARY KEY,
    uploader_name VARCHAR(100),
    topic VARCHAR(50)
);

-- INNER JOIN: Get reaction + uploader info
SELECT r.*, i.uploader_name, i.topic
FROM content_reactions r
INNER JOIN content_info i ON r.content_id = i.content_id;

-- reactions that scored above the average score
SELECT * 
FROM content_reactions
WHERE score > (
    SELECT AVG(score) FROM content_reactions
);

-- Average score per sentiment
SELECT sentiment, AVG(score) AS avg_score
FROM content_reactions
GROUP BY sentiment;

-- Total score per category
SELECT category, SUM(score) AS total_score
FROM content_reactions
GROUP BY category;

-- Create a view for positive reactions
CREATE VIEW positive_reactions AS
SELECT * 
FROM content_reactions 
WHERE sentiment = 'positive';

-- view
SELECT * FROM positive_reactions;

CREATE INDEX idx_content_id ON content_reactions(content_id);

CREATE INDEX idx_sentiment_category ON content_reactions(sentiment, category);

