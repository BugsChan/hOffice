/**
 * Created by Yuri2 on 2017/7/31.
 */
//此处代码适合在子页面使用
window.Win10_parent=window.opener.Win10; //获取父级Win10对象的句柄
window.Win10_child={
    close:function () {
        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        Win10_parent._closeWin(index);
    },
    newMsg: function (title, content,handle_click){
        Win10_parent.newMsg(title, content,handle_click)
    },
    openUrl: function (url, title,max){
        var index=Win10_parent.openUrl(url, title,max);
    },
    getUserMsg:function(){
    	return Win10_parent.getUserMsg();
    }
};
//window.alert=function(str){
//	Win10_parent.layer.open({
//      type: 1,
//      closeBtn: 1, //不显示关闭按钮
//      anim: 2,
//      skin: 'layui-layer-molv',
//      title: 'WIN10-UI '+this._version,
//      shadeClose: true, //开启遮罩关闭
//      area: ['420px', '200px'], //宽高
//      content: '<div style="padding: 10px;font-size: 12px">' +
//      'str' +
//      '</div>'
//  });
//};
