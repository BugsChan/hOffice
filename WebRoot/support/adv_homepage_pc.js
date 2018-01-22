/**
*this file is for homepageAdv
*/
(function(){
	$("imgs").onclick=function(event){
		event=event||window.event;
		var target=event.target||event.srcElement;
		if(target.parentNode.parentNode!=$("imgs"))return;
		location.assign("/OnlineDoc?method=onlineDocument&uuid=a98d55a0eac14d96beb55d56b2479ee3");
	}
})();