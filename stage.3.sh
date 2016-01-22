gamename=`cat $1 | hxclean | hxselect "#game_info" | grep -Eo "<h2>.*</h2>" | sed 's/<h2> *//g' | sed 's/<\/h2>//g'`
mkdir "$gamename"
mkdir "$gamename.video"
for line in `cat $1 | hxclean | hxselect "#normal-box" | sed 's/<table id="normal-box"><thead><tr><th>Country<\/th><th>Band<\/th><th>Song<\/th><th>Genre<\/th><th colspan="69"> Actions <\/th><\/tr><\/thead><tbody>//g ' | sed 's/<\/td><\/tr><\/tbody><\/table>//g ' | sed 's/<\/tr><tr /<\/tr>\n<tr /g ' | sed 's/ /♂/g'`
do
	det1=`echo "$line" | sed 's/♂/ /g' | grep -Eo "tr class=\"mus\""`
	# echo $det1
	if [ ! -z "$det1" ]
	then
		youtubelink=`echo "$line" | sed 's/♂/ /g' | grep -Eo "http:\/\/www.youtube.com\/watch\?v=.*\"><img" | sed 's/"><img//g'`
		id=`echo "$line" | sed 's/♂/ /g' | grep -Eo "http:\/\/www.youtube.com\/watch\?v=.*\"><img" | sed 's/"><img//g'`
		init=0
		for segment in `echo "$line" | sed 's/♂/ /g' | html2text | sed 's/_/♂/g' | sed 's/ /♂/g'`
		do
			let init+=1
			elements[init]=`echo $segment | sed 's/♂/ /g'`
		done
		# elements[1]=country
		# elements[2]=artists
		# elements[3]=title
		# elements[4]=genre
		# elements[5]=comments
		# echo "youtube-dl -f bestaudio -o \"$gamename$subdir/${elements[2]} - ${elements[3]}.m4a\" \"$youtubelink\""
		youtube-dl -f bestaudio -o "$gamename$subdir/${elements[2]} - ${elements[3]}.m4a" "$youtubelink"
		# echo "youtube-dl -f bestvideo+bestaudio -o \"$gamename.video$subdir/${elements[2]} - ${elements[3]}.mp4\" \"$youtubelink\""
		youtube-dl -f bestvideo+bestaudio -o "$gamename.video$subdir/${elements[2]} - ${elements[3]}.mp4" "$youtubelink"
	else
		det2=`echo "$line" | sed 's/♂/ /g' | grep -Eo "tr class=\"seperator_tr\""`
		# echo $det2
		if [ ! -z "$det2" ]
		then
			subdir=`echo "$line" | sed 's/♂/ /g' | sed 's/<tr class="seperator_tr"><td><\/td>//g' | grep -Eo ">.*</td>" | sed 's/<\/td>//g' | sed 's/>//g' | sed 's/\// or /g' | sed 's/:/ /g' `
			mkdir "$gamename/$subdir"
			mkdir "$gamename.video/$subdir"
			subdir="/$subdir"
		fi
	fi
done
