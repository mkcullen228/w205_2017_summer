Exercise 2 
Step-by-Step instructions to running extweetwordcount Applictaion 

Ensure dependencies are installed and/or running 
Dependencies can be found in the Architecture document.


To run extweetwordcount: 
This will parse tweets by word, add each word and count the occurances of each
word in tweets seen while running. 
	1. Navigate to extweetwordcount
	2. Run command: "sparse run" 
	3. To stop: press keys  Command + C



To run finalresults.py 
When passed a single word as an argument,returns the total number of word
occurrences in the stream
When run without an argument returns all the words in the stream, and their
total count of occurrences

	1. Navigate to exercise_2 folder where finalresults.py is located
	2. Run: "python finalresults.py <word>" for specific word count 
	3. Run: "python finalresults.py"  for all words and their counts in the
database 



To run histogram.py 
Returns all the words with a total number of occurrences greater than or 
equal to k1, and less than or equal to k2.

	1. Navigate to exercise_2 folder where histogram.py is located 
	2. Run "python histogram.py <number1> <number2>"


To make a barchart for top 20 words in database
	1. Navigate to exercist_2 folder where create_barChart.py is located 
	2. Run "python create_barChart.py"
	3. plot.png woll be saved in exercise_2 directory
		The location can be edited in the exercise_2/create_barChart.py script



