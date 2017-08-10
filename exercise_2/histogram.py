"""
Histogram.py - This script gets two integers k1,k2 and returns all the words with a total number of occurrences greater than or equal to k1, and less than or equal to k2. 

input: 
	k1, k2 - two integers. k1 < k2
output:
	Returns all the words and total number of occurances >=k1 and <= k2
"""

import sys

import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

# Check for correct number of inputs 
if len(sys.argv) < 3:
	print("Not enough input arguments")
	print("Must provide two arguments: A minimum value(k1) and maximum value(k2)")
	exit(1)

k1 = int(sys.argv[1])
k2 = int(sys.argv[2])

# Connect to database
conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

if k1 > k2:
	print("k2 must be > k1")
	exit(1)

SQL = "select * from tweetwordcount WHERE count >= %s AND count <= %s ORDER BY count"
cur.execute(SQL, (k1,k2))
rows = cur.fetchall()
if len(rows) > 0:
	for row in rows:
		print "%s: %d" % (row[0], row[1])
else: 
	print "No words with counts between %d and %d in tweetwordcount table" % (k1, k2)
 
