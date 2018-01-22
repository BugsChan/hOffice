function $(nodeName) {
	return !document.getElementById(nodeName) ? document.getElementsByClassName(nodeName)[0] : document.getElementById(nodeName);
}
setInterval(function() {
	try{
	//i think my code is very ugly, if you can, see them less!
		var imgs = $("imgs");
		var fChild = imgs.firstChild;
		while(fChild.nodeName == "#text") {
			fChild = fChild.nextSibling;
		}
	
		function getElementChildNum(node) {
			var c = 0;
			var children = node.childNodes;
			for(var i = 0; i < children.length; i++) {
				if(children[i].nodeName != "#text") c++;
			}
			return c;
		}
		var max = getElementChildNum(fChild) * 518;
		fChild.style.width = max + "px";
		var start = isNaN(parseInt(fChild.style.left)) ? 0 : parseInt(fChild.style.left),
			end = start - 518;
		var timer = setInterval(function() {
			start -= 2;
			fChild.style.left = start + "px";
			if(start <= end) {
				fChild.style.left = end + "px";
				if(-end >= max - 518) {
					fChild.style.left = "0px";
				}
				clearInterval(timer);
			}
		}, 3);
	}catch(e){}
}, 5000);
$("hWord_logo").onclick = $("hExcel_logo").onclick = $("hPPT_logo").onclick = $("help_logo").onclick = function(event) {
	event = event || window.event;
	var target = event.srcElement || event.target;
	if(/logo|img/i.test(target.className) || /span/i.test(target.tagName)) {
		var src = this.id;
		src = src.slice(0, src.indexOf('_')) + ".html";
		location.assign(src);
	}
}

function getURL(relativeURL) {
	var _location = location.pathname;
	_location = /^http/.test(location.toString()) ? _location.slice(0, _location.lastIndexOf("/")) : "http://www.hOffice.com.cn";
	return _location + relativeURL;
}