grep -E -o 'tt[0-9]{7}' searchList.html > id.txt
read line < id.txt
echo "wget -O movie.html http://www.imdb.com/title/$line/" >> movies.txt
#rm id.txt


