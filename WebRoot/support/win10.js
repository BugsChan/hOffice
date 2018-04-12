/**
 * Created by Yuri2 on 2017/7/10.
 */
window.Win10 = {
    _version:'v1.1.2.4',
    _bgs:{
        main:'',
        mobile:'',
    },
    _if_canCheck:true,
    _animated_classes:[],
    _animated_liveness:0,
    _switchMenuTooHurry:false,
    _lang:'unknown',
    _iframes:[],
    _countTask:function(){
    	return Win10._iframes.length;
    },
    _renderBar:function(){//调整任务栏项目的宽度
        if(this._countTask()<=0){return;} //防止除以0
        var btns=$("#win10_btn_group_middle>.btn");
        btns.css('width',('calc('+(1/this._countTask()*100)+'% - 1px )'))
    },
    _handleReady:[],
    _hideShortcut:function(){//隐藏图标
        var that=$("#win10 #win10-shortcuts .shortcut");
        that.removeClass('animated flipInX');
        that.addClass('animated flipOutX');
    },
    _showShortcut:function(){//展示图标
        var that=$("#win10 #win10-shortcuts .shortcut");
        that.removeClass('animated flipOutX');
        that.addClass('animated flipInX');
    },
    _checkBgUrls:function(){//使背景图片大小适中
        var loaders=$('#win10>.img-loader');
        var flag=false;
        if(Win10.isSmallScreen()){
                if(Win10._bgs.mobile){
                    loaders.each(function () {
                        var loader=$(this);
                        if(loader.attr('src')===Win10._bgs.mobile && loader.hasClass('loaded')){
                            Win10._setBackgroundImg(Win10._bgs.mobile);
                            flag=true;
                        }
                    });
                    if(!flag){
                        //没找到加载完毕的图片
                        var img=$('<img class="img-loader" src="'+Win10._bgs.mobile+'" />');
                        $('#win10').append(img);
                        Win10._onImgComplete(img[0],function () {
                            img.addClass('loaded');
                            Win10._setBackgroundImg(Win10._bgs.mobile);
                        })
                    }
                }
            }else{
                if(Win10._bgs.main){
                    loaders.each(function () {
                        var loader=$(this);
                        if(loader.attr('src')===Win10._bgs.main && loader.hasClass('loaded')){
                            Win10._setBackgroundImg(Win10._bgs.main);
                            flag=true;
                        }
                    });
                    if(!flag){
                        //没找到加载完毕的图片
                        var img=$('<img class="img-loader" src="'+Win10._bgs.main+'" />');
                        $('#win10').append(img);
                        Win10._onImgComplete(img[0],function () {
                            img.addClass('loaded');
                            Win10._setBackgroundImg(Win10._bgs.main);
                        })
                    }
                }
        }
    },
    _startAnimate:function () {//开始渲染
        setInterval(function () {
            var classes_lenth=Win10._animated_classes.length;
            var animated_liveness=Win10._animated_liveness;
            if(animated_liveness===0 || classes_lenth===0 || !$("#win10-menu").hasClass('opened')){return;}
            $('#win10-menu>.blocks>.menu_group>.block').each(function () {
                if(!$(this).hasClass('onAnimate') && Math.random()<=animated_liveness){
                    var that=$(this);
                    var class_animate = Win10._animated_classes[Math.floor((Math.random()*classes_lenth))];
                    that.addClass('onAnimate');
                    setTimeout(function () {
                        that.addClass(class_animate);
                        setTimeout(function () {
                            that.removeClass('onAnimate');
                            that.removeClass(class_animate);
                        },3000);
                    },Math.random()*2*1000)
                }
            })
        },1000);
    },
    _onImgComplete:function (img, callback) {//图像加载完成
        if(!img){return;}
        var timer = setInterval(function() {
            if (img.complete) {
                callback(img);
                clearInterval(timer);
            }
        }, 50)
    },
    _setBackgroundImg:function (img) {//设置背景图片
        $('#win10').css('background-image','url('+img+')')
    },
    _renderContextMenu:function (x,y,menu,trigger) {//调整点击右键形成的小菜单
        this._removeContextMenu();
        if(menu===true){return;}
        var dom = $("<div class='win10-context-menu'><ul></ul></div>");
        $('#win10').append(dom);
        var ul=dom.find('ul');
        for(var i=0;i<menu.length;i++){
            var item=menu[i];
            if(item==='|'){
                ul.append($('<hr/>'));
                continue;
            }
            if(typeof(item)==='string'){
                ul.append($('<li>'+item+'</li>'));
                continue;
            }
            if(typeof(item)==='object'){
                var sub=$('<li>'+item[0]+'</li>');
                ul.append(sub);
                sub.click(trigger,item[1]);
                continue;
            }
        }
        //修正坐标
        if(x+150>document.body.clientWidth){x-=150}
        if(y+dom.height()>document.body.clientHeight){y-=dom.height()}
        dom.css({
            top:y,
            left:x,
        });
    },
    _removeContextMenu:function () {//ContextMenu:点击右键形成的小菜单
        $('.win10-context-menu').remove();
    },
    _checkIframes:function(){
    	if(Win10._if_canCheck){
    		for(var i=0;i<Win10._iframes.length;i++){
    			if(Win10._iframes[i].closed){//这个窗口已经被关闭了
    				Win10._closeWin(i+1);
    			}
    		}
    	}
    },
    _closeWin:function (index) {
        $("#win10_" + index).remove();
        Win10._if_canCheck=false;
		Win10._iframes[index-1].close();
        for(var i=+index;i<Win10._countTask();i++){
        	Win10._iframes[i-1]=Win10._iframes[i];
        	$("#win10_"+(i+1)).attr("id","win10_"+i).attr("index",i);
        }
        Win10._iframes.pop();
        Win10._if_canCheck=true;
        Win10._renderBar();
    },
    /**
     * 原 win10_bind_open_windows 子窗口事件自动绑定插件
     * @author:vG
     * @修订:Yuri2
     * @version:2.0.1
     * 说明: 所有#win10下的元素加入类win10-open-window即可自动绑定openUrl函数，无须用onclick手动绑定
     */
    _bind_open_windows:function () {
        // 注册事件委派 打开url窗口
        $('#win10').on('click', '.win10-open-window', function() {
            //>> 获取当前点击的对象
            $this = $(this);
            //>> 判断url地址是否为空 如果为空 不予处理
            if($this.data('url') !== "") {
                //>> 获取弹窗标题
                var title = $this.data('title')||'',
                    areaAndOffset;
                //>> 判断是否有标题图片
                var bg=$this.data('icon-bg')?$this.data('icon-bg'):'';
                if($this.data('icon-image')) {
                    //>> 加入到标题中
                    title = '<img class="icon '+bg+'" src="' + $this.data('icon-image') + '"/>' + title;
                }
                if($this.data('icon-font')) {
                    //>> 加入到标题中
                    title = '<i class="fa fa-fw fa-'+$this.data('icon-font')+' icon '+bg+'"></i>' + title;
                }
                if(!title && $this.children('.icon').length===1 && $this.children('.title').length===1){
                    title = $this.children('.icon').prop("outerHTML")+$this.children('.title').html();
                }
                //>> 判断是否需要 设置 区域宽度高度
                if($this.data('area-offset')) {
                    areaAndOffset = $this.data('area-offset');
                    //>> 判断是否有分隔符
                    if(areaAndOffset.indexOf(',')!==-1){
                        areaAndOffset = eval(areaAndOffset);
                    }
                }
                //>> 调用win10打开url方法
                Win10.openUrl($this.data('url'), title, areaAndOffset);
            }
        })
    },
    _init:function () {

        //获取语言
        this._lang=(navigator.language || navigator.browserLanguage).toLowerCase();

        $("#win10_btn_win").click(function () {
            Win10.commandCenterClose();
            Win10.menuToggle();
        });
        $("#win10_btn_command").click(function () {
            Win10.menuClose();
            Win10.commandCenterToggle();
        });
        $("#win10 .desktop").click(function () {
            Win10.menuClose();
            Win10.commandCenterClose();
        });
        $('#win10').on('click',".msg .btn_close_msg", function () {
            var msg = $(this).parent();
            $(msg).addClass('animated slideOutRight');
            setTimeout(function () {
                msg.remove()
            }, 500)
        });
        $('#win10_btn_command_center_clean_all').click(function () {
            var msgs=$('#win10_command_center .msg');
            msgs.addClass('animated slideOutRight');
            setTimeout(function () {
                msgs.remove()
            }, 1500);
            setTimeout(function () {
                Win10.commandCenterClose();
            }, 1000);
        });
        $("#win10_btn_show_desktop").click(function () {
            $("#win10 .desktop").click();
            Win10.hideWins();
        });
        $("#win10-menu-switcher").click(function () {
            if(Win10._switchMenuTooHurry){return;}
            Win10._switchMenuTooHurry=true;
            var class_name='win10-menu-hidden';
            var list=$("#win10-menu>.list");
            var blocks=$("#win10-menu>.blocks");
            var toggleSlide=function (obj) {
                if(obj.hasClass(class_name)){
                    obj.addClass('animated slideInLeft');
                    obj.removeClass('animated slideOutLeft');
                    obj.removeClass(class_name);
                }else{
                    setTimeout(function () {
                        obj.addClass(class_name);
                    },450);
                    obj.addClass('animated slideOutLeft');
                    obj.removeClass('animated slideInLeft');
                }
            };
            toggleSlide(list);
            toggleSlide(blocks);
            setTimeout(function () {
                Win10._switchMenuTooHurry=false;
            },520)
        });
        $("#win10_btn_group_middle").click(function () {
            $("#win10 .desktop").click();
        });
        $(document).on('click', '.win10-btn-refresh', function () {
            var index = $(this).attr('index');
            var iframe = Win10.getLayeroByIndex(index).find('iframe');
            iframe.attr('src', iframe.attr('src'));
        });
        $(document).on('click', '.win10-btn-change-url', function () {
            var index = $(this).attr('index');
            var iframe = Win10.getLayeroByIndex(index).find('iframe');
            layer.prompt({
                title: Win10.lang('编辑网址','Edit URL'),
                formType: 2,
                skin:'win10-layer-open-browser',
                value: iframe.attr('src'),
                area: ['500px', '200px'],
                zIndex:99999999999
            }, function (value, i) {
                layer.close(i);
                layer.msg(Win10.lang('请稍候...','Hold on please...'),{time:1500},function () {
                    iframe.attr('src', value);
                });
            });
        });
        $('#win10_btn_group_middle').on('click','.btn_close',function () {
        	//关闭窗口
            var index=$(this).parent().attr('index');
            Win10._closeWin(index);
        });
        $('#win10-menu .list').on('click','.item',function () {
            var e=$(this);
            if(e.hasClass('has-sub-down')){
                $('#win10-menu .list .item.has-sub-up').toggleClass('has-sub-down').toggleClass('has-sub-up');
                $("#win10-menu .list .sub-item").slideUp();
            }
            if(e.next().hasClass('sub-item')){
                e.toggleClass('has-sub-down').toggleClass('has-sub-up');
            }
            while (e.next().hasClass('sub-item')){
                e.next().slideToggle();
                e=e.next();
            }
        });
        $("#win10-btn-browser").click(function () {
            // var area = ['100%', (document.body.clientHeight - 40) + 'px'];
            // var offset = ['0', '0'];
            layer.prompt({
                title: Win10.lang('访问网址','Visit URL'),
                formType: 2,
                value: '',
                skin:'win10-layer-open-browser',
                area: ['300px', '150px'],
                zIndex:99999999999
            }, function (value, i) {
                layer.close(i);
                layer.msg(Win10.lang('请稍候...','Hold on please...'),{time:1500},function () {
                    Win10.openUrl(value,value);
                });
            });
        });
        setInterval(function () {
            var myDate = new Date();
            var year=myDate.getFullYear();
            var month=myDate.getMonth()+1;
            var date=myDate.getDate();
            var hours=myDate.getHours();
            var mins=myDate.getMinutes();if (mins<10){mins='0'+mins}
            $("#win10_btn_time").html(hours+':'+mins+'<br/>'+year+'/'+month+'/'+date);
        },1000);
        //离开前警告
        document.body.onbeforeunload = function(event){
            var rel = Win10.lang( '系统可能不会保存您所做的更改','The system may not save the changes you have made.');
            if(!window.event){
                event.returnValue=rel;
            }else{
                window.event.returnValue=rel;
            }
        };
        Win10.buildList();//预处理左侧菜单
        Win10._startAnimate();//动画处理
        Win10.renderShortcuts();//渲染图标
        $("#win10-shortcuts").removeClass('shortcuts-hidden');//显示图标
        Win10._showShortcut();//显示图标
        Win10.renderMenuBlocks();//渲染磁贴
        //窗口改大小，重新渲染
        $(window).resize(function() {
            Win10.renderShortcuts();
            Win10._checkBgUrls();
        });
        //细节
        $(document).on('focus',".win10-layer-open-browser textarea",function () {
            $(this).attr('spellcheck','false');
        });
        $(document).on('keyup',".win10-layer-open-browser textarea",function (e) {
            if(e.keyCode===13){
                $(this).parent().parent().find('.layui-layer-btn0').click();
            }
        });
        //打广告
        setTimeout(function () {
            console.log("本页由hOffice提供,鸣谢:Win10-UI,jQuery")
        },2000);
        //点击清空右键菜单
        $(document).click(function (event) {
            if(!event.button)
                Win10._removeContextMenu();
        });
        //禁用右键的右键
        $(document).on('contextmenu','.win10-context-menu',function (e) {
            e.preventDefault();
            e.stopPropagation();
        });
        //设置默认右键菜单
        Win10.setContextMenu('#win10',true);
        Win10.setContextMenu('#win10>.desktop',[
            ['<i class="fa fa-fw fa-star"></i> 收藏本页',function () {
                var url = window.location;
                var title = document.title;
                var ua = navigator.userAgent.toLowerCase();
                if (ua.indexOf("360se") > -1) {
                    layer.alert(Win10.lang('您的浏览器不支持,请按 Ctrl+D 手动收藏!','Your browser does not support, please press Ctrl+D to manual collection!'));
                }
                else if (ua.indexOf("msie 8") > -1) {
                    window.external.AddToFavoritesBar(url, title); //IE8
                }
                else if (document.all) {
                    try{
                        window.external.addFavorite(url, title);
                    }catch(e){
                        layer.alert(Win10.lang('您的浏览器不支持,请按 Ctrl+D 手动收藏!','Your browser does not support, please press Ctrl+D to manual collection!'));
                    }
                }
                else if (window.sidebar) {
                    window.sidebar.addPanel(title, url, "");
                }
                else {
                    layer.alert(Win10.lang('您的浏览器不支持,请按 Ctrl+D 手动收藏!','Your browser does not support, please press Ctrl+D to manual collection!'));
                }
            }],
            ['<i class="fa fa-fw fa-window-maximize"></i> '+Win10.lang('进入全屏','Enable Full Screen'),function () {Win10.enableFullScreen()}],
            ['<i class="fa fa-fw fa-window-restore"></i> '+Win10.lang('退出全屏','Disable Full Screen'),function () {Win10.disableFullScreen()}],
            '|',
            ['<i class="fa fa-fw fa-info-circle"></i> '+Win10.lang('关于','About Us'),function () {Win10.aboutUs()}],
        ]);
        Win10.setContextMenu('#win10_btn_group_middle',[
            ['<i class="fa fa-fw fa-window-maximize"></i> '+Win10.lang('全部显示','Show All Windows'),function () {Win10.showWins()}],
            ['<i class="fa fa-fw fa-window-minimize"></i> '+Win10.lang('全部隐藏','Hide All Windows'),function () {Win10.hideWins()}],
            ['<i class="fa fa-fw fa-window-close"></i> '+Win10.lang('全部关闭','Close All Windows'),function () {Win10.closeAll()}],
        ]);

        //处理消息图标闪烁
        setInterval(function () {
            var btn=$("#win10-msg-nof.on-new-msg");
            if(btn.length>0){
                btn.toggleClass('fa-commenting-o');
            }
        },600);

        //绑定快捷键
        $("body").keyup(function (e) {
            if (e.ctrlKey)
            {
                switch (e.keyCode){
                    case 37://left
                        $("#win10_btn_win").click();
                        break;
                    case 38://up
                        Win10.showWins();
                        break;
                    case 39://right
                        $("#win10_btn_command").click();
                        break;
                    case 40://down
                        Win10.hideWins();
                        break;
                }
            }
        });

        /**
         * WIN10-UI v1.1.2.2 桌面舞台支持补丁
         * WIN10-UI v1.1.2.2之后的版本不需要此补丁
         * @usage 直接引用即可（需要jquery）
         * @author Yuri2
         */
        if($("#win10-desktop-scene").length<1) {
            $("#win10-shortcuts").css({
                position: 'absolute',
                left: 0,
                top: 0,
                'z-index': 100,
            });
            $("#win10 .desktop").append("<div id='win10-desktop-scene' style='width: 100%;height: calc(100% - 40px);position: absolute;left: 0;top: 0; z-index: 0;background-color: transparent;'></div>")
        }

        //属性绑定
        Win10._bind_open_windows();
        
        //绑定窗口判断方法
        setInterval(Win10._checkIframes,3000);
       
    },
    setBgUrl:function (bgs) {
        this._bgs=bgs;
        this._checkBgUrls();
    },
    menuClose: function () {
        $("#win10-menu").removeClass('opened');
        $("#win10-menu").addClass('hidden');
        this._showShortcut();
        $(".win10-open-iframe").removeClass('hide');
    },
    menuOpen: function () {
        $("#win10-menu").addClass('opened');
        $("#win10-menu").removeClass('hidden');
        this._hideShortcut();
        $(".win10-open-iframe").addClass('hide');
    },
    menuToggle: function () {
        if(!$("#win10-menu").hasClass('opened')){
            this.menuOpen();
        }else{
            this.menuClose();
        }
    },
    commandCenterClose: function () {
        $("#win10_command_center").addClass('hidden_right');
        this._showShortcut();
        $(".win10-open-iframe").removeClass('hide');
    },
    commandCenterOpen: function () {
        $("#win10_command_center").removeClass('hidden_right');
        this._hideShortcut();
        $(".win10-open-iframe").addClass('hide');
        $("#win10-msg-nof").removeClass('on-new-msg fa-commenting-o');
    },
    renderShortcuts:function () {
        var h=parseInt($("#win10 #win10-shortcuts")[0].offsetHeight/100);
        var x=0,y=0;
        $("#win10 #win10-shortcuts .shortcut").each(function () {
            $(this).css({
                left:x*82+10,
                top:y*100+10,
            });
            y++;
            if(y>=h){
                y=0;
                x++;
            }
        });
    },
    renderMenuBlocks:function () {
        var cell_width=44;
        var groups=$("#win10-menu .menu_group");
        groups.each(function () {
            var group=$(this);
            var blocks=group.children('.block');
            var max_height=0;
            blocks.each(function () {
                var that=$(this);
                var loc=that.attr('loc').split(',');
                var size=that.attr('size').split(',');
                var top=(loc[1]-1)*cell_width+40;
                var height=size[1]*cell_width;
                var full_height=top+height;
                if (full_height>max_height){max_height=full_height}
                that.css({
                    top:top,
                    left:(loc[0]-1)*cell_width,
                    width:size[0]*cell_width,
                    height:height,
                })

            });
            group.css('height',max_height);
        });
    },
    commandCenterToggle: function () {
        if($("#win10_command_center").hasClass('hidden_right')){
            this.commandCenterOpen();
        }else{
            this.commandCenterClose();
        }
    },
    newMsg: function (title, content,handle_click) {
        var e = $('<div class="msg">' +
            '<div class="title">' + title +'</div>'+
            '<div class="content">' + content + '</div>' +
            '<span class="btn_close_msg fa fa-close"></span>' +
            '</div>');
        $("#win10_command_center .msgs").prepend(e);
        e.find('.content:first,.title:first').click(function () {
            if(handle_click){
                handle_click(e);
            }
        });
        layer.tips(Win10.lang('新消息:','New message:')+title, '#win10_btn_command', {
            tips: [1, '#3c6a4a'],
            time: 3000
        });
        if($("#win10_command_center").hasClass('hidden_right')){
            $("#win10-msg-nof").addClass('on-new-msg');
        }
    },
    isSmallScreen: function (size) {
        if (!size) {
            size = 768
        }
        var width = document.body.clientWidth;
        return width < size;
    },
    enableFullScreen: function () {
        var docElm = document.documentElement;
        //W3C
        if (docElm.requestFullscreen) {
            docElm.requestFullscreen();
        }
        //FireFox
        else if (docElm.mozRequestFullScreen) {
            docElm.mozRequestFullScreen();
        }
        //Chrome等
        else if (docElm.webkitRequestFullScreen) {
            docElm.webkitRequestFullScreen();
        }
        //IE11
        else if (docElm.msRequestFullscreen) {
            document.body.msRequestFullscreen();
        }
    },
    disableFullScreen: function () {
        if (document.exitFullscreen) {
            document.exitFullscreen();
        }
        else if (document.mozCancelFullScreen) {
            document.mozCancelFullScreen();
        }
        else if (document.webkitCancelFullScreen) {
            document.webkitCancelFullScreen();
        }
        else if (document.msExitFullscreen) {
            document.msExitFullscreen();
        }
    },
    buildList:function () {
        $("#win10-menu .list .sub-item").slideUp();
        $("#win10-menu .list .item").each(function () {
            if($(this).next().hasClass('sub-item')){
                $(this).addClass('has-sub-down');
                $(this).removeClass('has-sub-up');
            }
        })
    },
    openUrl: function (url, title,areaAndOffset) {
        if(this._countTask()>12){
            layer.msg("您打开的太多了，歇会儿吧~");
            return false;
        }
        if(!url){url='404'}
        url=url.replace(/(^\s*)|(\s*$)/g, "");
        var preg=/^(https?:\/\/|\.\.?\/|\/\/?)/;
        if(!preg.test(url)){
            url='http://'+url;
        }
        if (!url) {
            url = '//yuri2.cn';
        }
        if (!title) {
            title = url;
        }
        var area,offset;
        if (this.isSmallScreen() || areaAndOffset==='max') {
            area = [parseInt($(window).width()*0.8), (document.body.clientHeight - 40)];
            offset = ['0', '0'];
        }else{
            area = [parseInt($(window).width()*0.8), parseInt($(window).height()*0.6)];
            var topset, leftset;
            topset = parseInt($(window).height());
            topset = (topset - (topset * 0.8)) / 2 - 41;
            leftset = parseInt($(window).width());
            leftset = (leftset - (leftset * 0.8)) / 2 - 120;
            offset = [Math.round((this._countTask() % 10 * 20) + topset) , Math.round((this._countTask() % 10 * 20 + 100) + leftset)];
        }
        var commond="menubar=no,location=no,fullscreen=no,left="+offset[1]+",top="+offset[0]+",width="+area[0]+",height="+area[1];
		var index=Win10._iframes.push(window.open(url,null,commond));
        $('#win10_btn_group_middle .btn.active').removeClass('active');
        var btn = $('<div id="win10_' + index + '" index="' + index + '" class="btn show active"><div class="btn_title">' + title + '</div><div class="btn_close fa fa-close"></div></div>');
        $("#win10_btn_group_middle").append(btn);
        Win10._renderBar();
        btn.click(function () {
            var index = $(this).attr('index');
            var settop=function () {
                //时这个窗口获得焦点
                Win10._iframes[index-1].focus();
            };
            if ($(this).hasClass('show')) {
                if($(this).hasClass('active')){
                    $(this).removeClass('active');
                    $(this).removeClass('show');
                }else{
                    $('#win10_btn_group_middle .btn.active').removeClass('active');
                    $(this).addClass('active');
                }
            } else {
                $(this).addClass('show');
                $('#win10_btn_group_middle .btn.active').removeClass('active');
                $(this).addClass('active');
            }
        });
//		Win10._iframes[index-1].addEventListener("unload",function(){
//			$("#win10_" + index).remove();
//			Win10._checkTop();
//			Win10._renderBar();
//		});

        this.menuClose();
        this.commandCenterClose();
        return index;
    },
    closeAll: function() {
    	while(Win10._iframes.length>0){
    		Win10._closeWin(1);
    	}
    },
    setAnimated:function (animated_classes,animated_liveness) {
        this._animated_classes=animated_classes;
        this._animated_liveness=animated_liveness;
    },
    exit:function () {
        layer.confirm(Win10.lang('确认要关闭本页吗?','Are you sure you want to close this page?'), {icon: 3, title:Win10.lang('提示','Prompt')}, function(index){
            document.body.onbeforeunload = function(){};
            window.location.href="about:blank";
            window.close();
            layer.close(index);
            layer.alert(Win10.lang('哎呀,好像失败了呢。','Ops...There seems to be a little problem.'), {
                skin: 'layui-layer-lan'
                ,closeBtn: 0
            });
        });

    },
    lang:function (cn,en) {
        return this._lang==='zh-cn'||this._lang==='zh-tw'?cn:en;
    },
    aboutUs: function() {
        //关于我们
        layer.open({
            type: 1,
            closeBtn: 1, //不显示关闭按钮
            anim: 2,
            skin: 'layui-layer-molv',
            title: 'WIN10-UI '+this._version,
            shadeClose: true, //开启遮罩关闭
            area: ['320px', '200px'], //宽高
            content: '<div style="padding: 10px;font-size: 12px">' +
            '<p>支持组件:layer、jquery、animated.css、font-awesome</p>' +
            '<p>www.hoffice.com.cn 支持</p>'+
            '<p>鸣谢:Win10-UI(作者:尤里2号,邮箱:yuri2peter@qq.com)</p>' +
            '</div>'
        });
    },
    setContextMenu:function (jq_dom, menu) {//设置右键菜单的方法
        if(typeof (jq_dom)==='string'){
            jq_dom=$(jq_dom);
        }
        jq_dom.unbind('contextmenu');
        jq_dom.on('contextmenu', function(e) {
            if(menu){
                Win10._renderContextMenu(e.clientX,e.clientY,menu,this);
                if (e.cancelable) {
                    // 判断默认行为是否已经被禁用
                    if (!e.defaultPrevented) {
                        e.preventDefault();
                    }
                }
                e.stopPropagation();
            }
        });
    },
    hideWins:function () {//右键"隐藏全部"方法
        $('#win10_btn_group_middle>.btn.show').each(function () {
            var index = $(this).attr('index');
            var layero = Win10.getLayeroByIndex(index);
            $(this).removeClass('show');
            $(this).removeClass('active');
            layero.hide();
        })
    },
    showWins:function () {//右键"全部显示"方法
        $('#win10_btn_group_middle>.btn').each(function () {
            var index = $(this).attr('index');
            var layero = Win10.getLayeroByIndex(index);
            $(this).addClass('show');
            layero.show();
        });
    },
    getDesktopScene:function () {//获取桌面背景
        return $("#win10-desktop-scene");
    },
    onReady:function (handle) {
        Win10._handleReady.push(handle);
    },
    getUserMsg:function(){
		var cookieStr = decodeURI(document.cookie);
		var cookies = cookieStr.split(";");
		for(var i = 0; i < cookies.length; i++) {
			if(/userMsg/.test(cookies[i])) {
				var value = cookies[i].slice(cookies[i].indexOf("=") + 1);
				Win10.setCookie("userMsg", value);
				return JSON.parse(value);
			}
		}
		return !document.userMsg?null:JSON.parse(document.userMsg);
	}
    ,setCookie:function(_key,_value){
		var _date = new Date();
		_date.setDate(_date.getDate() + 120);
		document.cookie = encodeURI(_key + "=" + _value) + ";expires=" + _date.toGMTString() + ";path=/";
		if(_key == "userMsg") document[_key] = _value;
	}
    ,appendApp:function(href,icon,des){
    	$("#win10-shortcuts").append(
    		'<div class="shortcut" onclick="Win10.openUrl(\''+href+'\',\''+des+'\')">'+
            	'<img src="'+icon+'" class="icon" />'+
            	'<div class="title">'+des+'</div>'+
           '</div>'
    	);
    }
};


$(function () {
    Win10._init();
    for(var i in Win10._handleReady){
        var handle=Win10._handleReady[i];
        handle();
    }
});