# RacingGameSoundtrackAlbumGenerator
gimmie a game title, the script will generate a rar file containin' almost ALL ingame soundtracks for you. and yes, pure bash magic. 

没错，这个脚本就是用来生♂成赛车游戏背景音乐专辑的。利用[某极品飞车音乐合集站](http://nfssoundtrack.com/)提供的信息（主要是每一首歌后面都有YouTube链接）还有一款叫作youtube-dl的YouTube下载器来实现一整张游戏专辑的自动下载。果然YouTube是这个星球最强的视频网站。

目前只做了针对单页面的，但接下来我要把那整个网站的音乐全处理一遍。

需要安装如下依赖项：

-youtube-dl（别用yum/apt下，那里的版本太激霸老了，直接上[官网](http://yt-dl.org/latest/)搞一个可执行文件放/usr/bin）
-html2text（这个可以yum/apt）
-HTML-XML-utils（这玩意™还需要编译安装，[官网](https://www.w3.org/Tools/HTML-XML-utils/)在这儿，是我试了一大堆HTML parsers里面唯一能用的）

祝dubstep愉快，改日写个拖javfor.me的😂（手动滑稽）
