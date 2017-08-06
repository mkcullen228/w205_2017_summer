from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()

        # Create tcount and tweetword count if they do not exist
        conn = psycopg2.connect(database="postgres", user="postgres", password="pass", host="localhost", port="5432")

        #Create the Database
        try:
                # CREATE DATABASE can't run inside a transaction
                conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
                cur = conn.cursor()
                cur.execute("CREATE DATABASE tcount")
                cur.close()
                conn.close()
        except:
                self.log("Could not create tcount database")

        # Connect to tcount
        conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")

        #Create a Table tweetwordcount in tcount
        try:
                cur = conn.cursor()
                cur.execute('''CREATE TABLE tweetwordcount
                        (word TEXT PRIMARY KEY     NOT NULL,
                        count INT     NOT NULL);''')
                conn.commit()
        except:
                self.log("Could not create tweetwordcount table")



    def process(self, tup):
        word = tup.values[0]

        # Increment the local count
        self.counts[word] += 1
        self.emit([word, self.counts[word]])

        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))

	conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
	
	# Increment the word count in Postgres
        cur = conn.cursor()
	cur.execute("UPDATE tweetwordcount SET count=count+1 WHERE word=%s", (word,))
	
	# Add word to table if it is new word
        if cur.rowcount == 0:
                cur.execute("INSERT INTO tweetwordcount (word,count) VALUES (%s, 1)", (word,))

        conn.commit()
	
