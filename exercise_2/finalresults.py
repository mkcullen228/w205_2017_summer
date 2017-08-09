"""
final_results.py
When passed a single word as an argument,returns the total number of word occurrences in the stream
When run without an argument returns all the words in the stream, and their total count of occurrences

Input: 
	blank: 
	or 
	word: single word passed in will to look for in Tweet	
Output: 
	All words in tweets with counts of occurances sorted alphabeticallys, one word per line 
	or
	Total number of occurances of desired word passed in 
"""

import sys

import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

# Connect to database
conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

# Check Number of Arguments and return desire results
if len(sys.argv) != 2:
        print "No word argument passed. Returning all words and occurances"
	cur.execute("SELECT word, count from tweetwordcount ORDER BY word") 
	rows = cur.fetchall()
	for row in rows:
   		print "%s, %s" % (row[0], row[1])	
else: 
	passed_word = sys.argv[1]
	cur.execute("SELECT word, count FROM tweetwordcount WHERE word ILIKE %s",(passed_word,))
	rows = cur.fetchall()
	if len(rows) >= 1:	
		for row in rows:
    			print "Total number of occurrences of %s: %s" % (row[0], row[1])
	else:
		print "Total number of occurrences of %s: 0" % passed_word

