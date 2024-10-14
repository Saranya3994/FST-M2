-- Load input file from HDFS
inputFile = LOAD 'hdfs:///user/saranya/input.txt' AS (line);
-- Tokeize each word in the file (Map)
words = FOREACH inputFile GENERATE FLATTEN(TOKENIZE(line)) AS word;
-- Combine the words from the above stage
grpd = GROUP words BY word;
-- Count the occurence of each word (Reduce)
cntd = FOREACH grpd GENERATE $0, COUNT($1) AS wordCount;
--Delete the output folder
rmf hdfs:///user/saranya/PigResults
-- Store the result in HDFS
STORE cntd INTO 'hdfs:///user/saranya/PigResults';


