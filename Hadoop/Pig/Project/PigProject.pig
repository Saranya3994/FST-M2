inputFile1 = LOAD 'hdfs:///user/saranya/input/episodeIV_dialogues.txt' USING PigStorage('\t') AS (name:chararray,line:chararray);
inputFile2 = LOAD 'hdfs:///user/saranya/input/episodeV_dialogues.txt' USING PigStorage('\t') AS (name:chararray,line:chararray);
inputFile3 = LOAD 'hdfs:///user/saranya/input/episodeVI_dialogues.txt' USING PigStorage('\t') AS (name:chararray,line:chararray);

InputFile = UNION inputFile1,inputFile2,inputFile3;

--Group by
grouped_lines = GROUP InputFile BY name;

--Count the number of lines spoken by each character 
character_line_count = FOREACH grouped_lines GENERATE $0 AS character, COUNT($1) AS line_count;

--Order the results in descending order
ordered_character_line_count = ORDER character_line_count BY line_count DESC;

--Store the result
STORE ordered_character_line_count INTO 'hdfs:///user/saranya/PigProjectOutput' USING PigStorage(',');
