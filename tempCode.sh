search(){
	read line < names_t.txt
	
	#echo $line
	#echo "searchList.html http://www.imdb.com/find?q=$line&s=all"
	wget -O tmp/searchList.html http://www.imdb.com/find?q=$line&s=all & 
	proc_id=$!
	while kill -0"$proc_id" > /dev/null 2 > $1
	do 
		echo "------------------------------process is running-------------------------------------" 
	done
		echo "-----------------------------process ends-----------------------------"
	while true
	do
		if [[ -e tmp/searchList.html ]]; then
#			sleep 10
		  	grep -E -o 'tt[0-9]{7}' tmp/searchList.html > id.txt
		  	read movID < id.txt
			echo $movID
			echo "curl -o tmp/mov.html http://www.imdb.com/title/$movID/"
#			sleep 10
#			echo "http://www.imdb.com/title/$movID/"
			echo "true loop breaking"
#			`rm -f tmp/searchList.html`
			break
		else
	  		echo "not found!"
		fi
	done


#	rm searchList.html
	# Done! here i got all the links for search page
	#Done! grep -E -o 'tt[0-9]{7}' search.html > link.txt
	#method to handle html parsing for search page
		#get the movie link
		#downlaod the movie page
		#another mathod for the parsing the rating
}

ls t_movie > movieNames.txt | cp names.txt imdbSearch.txt
sed -i 's/ /+/g' imdbSearch.txt
search

