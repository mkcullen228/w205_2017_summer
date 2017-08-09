"""
Create Bar chart for top 20 words in Twitter stream

"""
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import psycopg2

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

cur.execute("SELECT word, count from tweetwordcount ORDER BY count DESC LIMIT 20")
rows = cur.fetchall()

# Create array with Data
counts = []
words = []
for row in rows:
	words.append(row[0])
	counts.append(row[1])

# Plot Data
ind = np.arange(len(counts))
width = 0.50

fig, ax  = plt.subplots()
rects = ax.bar(ind, counts, width, color='b', align = 'center')

ax.set_ylabel('Count of Word Occurances')
ax.set_xlabel('Words')
ax.set_title('Top 20 Words by Count of Occurances from Twitter Stream')
ax.set_xticks(ind + width/2)
ax.set_xticklabels(words, rotation = 45)

# Export the Plot to PNG 
fig.savefig('plot.png')
plt.close(fig)


