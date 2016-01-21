mkdir video
mkdir music

for line in `cat $1 | hxclean | hxselect "#normal-box" | sed 's/<table id="normal-box"><thead><tr><th>Country<\/th><th>Band<\/th><th>Song<\/th><th>Genre<\/th><th colspan="69"> Actions <\/th><\/tr><\/thead><tbody>//g ' | sed 's/<\/td><\/tr><\/tbody><\/table>//g ' | sed 's/<\/tr><tr /<\/tr>\n<tr /g ' | sed 's/ /♂/g'`
do
	youtubelink=`echo "$line" | sed 's/♂/ /g' | grep -Eo "http:\/\/www.youtube.com\/watch\?v=.*\"><img" | sed 's/"><img//g'`
	init=0
	for segment in `echo "$line" | sed 's/♂/ /g' | html2text |  sed 's/_/♂/g' | sed 's/ /♂/g'`
	do
		let init+=1
		elements[init]=`echo $segment | sed 's/♂/ /g'`
	done
	# elements[1]=country
	# elements[2]=artists
	# elements[3]=title
	# elements[4]=gerne
	# elements[5]=comments
	# echo "youtube-dl -f bestaudio -o \"${elements[2]} - ${elements[3]}.m4a\" \"$youtubelink\""
	youtube-dl -f bestaudio -o "music/${elements[2]} - ${elements[3]}.m4a" "$youtubelink"
	# echo "youtube-dl -f bestvideo+bestaudio -o \"video/${elements[2]} - ${elements[3]}.mp4\" \"$youtubelink\""
	youtube-dl -f bestvideo+bestaudio -o "video/${elements[2]} - ${elements[3]}.mp4" "$youtubelink"
done
