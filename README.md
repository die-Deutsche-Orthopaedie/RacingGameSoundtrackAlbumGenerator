# RacingGameSoundtrackAlbumGenerator
gimmie a game title, the script will generate a rar file containin' almost ALL ingame soundtracks for you. and yes, pure bash magic. 

没错，这个脚本就是用来生♂成赛车游戏背景音乐专辑的。利用[某极品飞车音乐合集站](http://nfssoundtrack.com/)提供的信息（主要是每一首歌后面都有YouTube链接）还有一款叫作youtube-dl的YouTube下载器来实现一整张游戏专辑的自动下载。果然YouTube是这个星球最强的视频网站。

现在已经有潜力可以将全站音乐处理一遍了，而且对table里面的二级信息也能利用起来，将其下的所有歌曲保存在以其命名的子目录里。两部分脚本什么时候合一我也不清楚，到时候还要加上仅下歌曲/仅下视频/两者都下的选项，还有那个站提供的歌词还没有挖掘出来，还有其他一些metadata也没有提取出来，youtube-dl的下载信息也需要输出到哪里以做下载后分析，来确认长时间无人值守的下载过程中哪些歌曲出现了问题。输出也需要优化一下。

需要安装如下依赖项：

- youtube-dl（别用yum/apt下，那里的版本太激霸老了，直接上[官网](http://yt-dl.org/latest/)搞一个可执行文件放/usr/bin）
- html2text（这个可以yum/apt）
- HTML-XML-utils（这玩意还™需要编译安装，[官网](https://www.w3.org/Tools/HTML-XML-utils/)在这儿，我™试了一大堆HTML parsers，只有这个™能用）
- 对了，ffmpeg总得装一个吧，YouTube的视频是音画分离的，需要ffmpeg将音频或者视频+音频转换成正确的格式。

祝dubstep愉快，改日写个拖javfor.me的😂（手动滑稽）
