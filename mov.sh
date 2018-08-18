#!/bin/bash

######################@Assaignment:OperatingSystem310/CSI310##########################
######################@Author:Ameek###################################################

search(){
	while read line
	do
		#wget -O  name.html link
		wget -O ./temp/imdbSearchList.html http://www.imdb.com/find?q=$line&s=all &
		PROC_ID=$!
		while kill -0 "$PROC_ID" > /dev/null 2 > $1
		do
			echo ".............wget is still running for imdb search list.............."
		done
		echo ".............wget finished for imdb search list.............."
		while true
		do
			if [[ -e ./temp/imdbSearchList.html ]]; then
			  	grep -E -o 'tt[0-9]{7}' ./temp/imdbSearchList.html > ./temp/id.txt
			  	read movID < ./temp/id.txt
				echo $movID
				echo "curl -o ./temp/mov.html http://www.imdb.com/title/$movID/" >> ./temp/imdbMovieLinks.txt
#				sleep 10
#				echo "http://www.imdb.com/title/$movID/"
				echo "true loop breaking"
#				`rm -f ./temp/searchList.html`
				break
			fi
			#echo ".................NOT in IF block yet!.................."
		done
		rm -f ./temp/imdbSearchList.html
#	rm searchList.html
	#here i got all the links for search page
	#grep -E -o 'tt[0-9]{7}' search.html > link.txt
	#method to handle html parsing for search page
		#get the movie link
		#downlaod the movie page
		#another mathod for the parsing the rating
		done < ./temp/imdbSearch.txt
}
mkdir temp | sleep 2
ls t_movie > ./temp/movieNames.txt | sleep 2
cp ./temp/movieNames.txt ./temp/imdbSearch.txt |sleep 2
sed -i 's/ /+/g' ./temp/imdbSearch.txt
search


