//transfer access id to url
UPDATE User_access u JOIN Access a ON(u.user_access_access=a.access_id) SET u.user_access_access = a.access_url;

2020-10-08
ALTER TABLE Participant ADD `participant_secondary_date` date COMMENT '上课/补课日期';
ALTER TABLE Participant ADD `participant_secondary_start` time COMMENT '上课/补课时间';

UPDATE Participant p JOIN Lesson l ON(p.participant_lesson=l.lesson_id) SET p.participant_secondary_date=l.lesson_date, p.participant_secondary_start=l.lesson_start;
