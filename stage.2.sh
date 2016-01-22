for series in `curl "http://nfssoundtrack.com/" | hxclean | hxselect "#games" | sed 's/<\/div><div /<\/div>\n<div /g ' | sed 's/ /♂/g'`
do
	processedseries=`echo $series | sed 's/♂/ /g' | hxclean | hxselect ".menu_element" | sed 's/ /♂/g'`
	if [ ! -z $processedseries ]
	then
		seriestitle=`echo $processedseries | sed 's/♂/ /g' | grep -Eo "<span>.*</span> <span" | sed 's/<span>//g' | sed 's/<\/span> <span//g'`
		mkdir "$seriestitle"
		echo "in $seriestitle: "
		for game in `echo $processedseries | sed 's/<\/li><li♂/<\/li>\n<li♂/g '`
		do
			gametitle=`echo $game | sed 's/♂/ /g' | grep -Eo "href=\".*\/\" title" | sed 's/href="http:\/\/nfssoundtrack.com\///g' | sed 's/\/" title//g'`
			echo "	$gametitle"
			wget "http://nfssoundtrack.com/$gametitle/" -O "$seriestitle/$gametitle.html"
		done
		echo "================================================"
	fi
done
