<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>分享管理</title>
</head>

<body>
<script type="text/javascript" src="${ctx}/static/social/js/jquery.masonry.min.js"></script>
<script type="text/javascript" src="${ctx}/static/social/js/jquery.infinitescroll.min.js"></script>


<style type="text/css">
    body{background:url("${ctx}/static/social/images/bodybg.jpg") repeat #f5f6f7;}
    .fl{float:left;}.fr{float:right;}
    #content{color:#666;font-family:Arial;font-size:12px;}
    .demo{width:950px;margin:0 auto;}

    /* item_list */
    .item_list{position:relative;padding:0 0 50px;}
    .item{
        width:226px;background:#fff;overflow:hidden;margin:15px 0 0 0;
        border-radius:4px 4px 4px 4px;
        box-shadow:0 1px 3px rgba(34, 25, 25, 0.2);
    }
    .item_t{padding:10px 8px 0;}
    .item_t .img{background-color:#FFFFFF;margin:0 auto;position:relative;width:210px;min-height:210px;}
    .item_t .img a{display:block;}
    .item_t .img a:hover{background:#000;}
    .item_t .img a:hover img{filter:alpha(opacity=80);-khtml-opacity:0.8;opacity:0.8;-webkit-transition:all 0.3s ease-out;-khtml-transition:all 0.3s ease-out;}
    .item_t .title{padding:8px 0;line-height:18px;}

    .item_b{padding:10px 8px;background-color:rgb(250, 250, 250)}
    .item_b .items_author{color:#999;}
    .item_b .items_createtime{color:#999;}
    /* more */
    #more{display:block;margin:10px auto 20px;}

    /* to_top */
    .to_top a,.to_top a:hover{background:url("${ctx}/static/social/images/gotop.png") no-repeat}
    .to_top a{
        background-position:0 0;float:left;height:50px;overflow:hidden;width:50px;position:fixed;bottom:35px;cursor:pointer;right:20px;
        _position:absolute;
        _right:auto;
        _left:expression(eval(document.documentElement.scrollLeft+document.documentElement.clientWidth-this.offsetWidth)-(parseInt(this.currentStyle.marginLeft, 10)||0)-(parseInt(this.currentStyle.marginRight, 10)||20));
        _top:expression(eval(document.documentElement.scrollTop+document.documentElement.clientHeight-this.offsetHeight-(parseInt(this.currentStyle.marginTop, 10)||20)-(parseInt(this.currentStyle.marginBottom, 10)||20)));
    }
    .to_top a:hover{background-position:-51px 0px;}
</style>

<script type="text/javascript">
    var isWidescreen=screen.width>=1280;
    if(isWidescreen){document.write("<style type='text/css'>.demo{width:1194px;}</style>");}
</script>

<script type="text/javascript">
    function item_masonry(){
        $('.item img').load(function(){
            $('.infinite_scroll').masonry({
                itemSelector: '.masonry_brick',
                columnWidth:226,
                gutterWidth:15
            });
        });

        $('.infinite_scroll').masonry({
            itemSelector: '.masonry_brick',
            columnWidth:226,
            gutterWidth:15
        });
    }
</script>

<script type="text/javascript">

    $(document).ready(function() {
        function item_callback(){
            $('.item').mouseover(function(){
                $(this).css('box-shadow', '0 1px 5px rgba(35,25,25,0.5)');
                $('.btns',this).show();
            }).mouseout(function(){
                        $(this).css('box-shadow', '0 1px 3px rgba(34,25,25,0.2)');
                        $('.btns',this).hide();
            });
            item_masonry();
        }

        item_callback();

        $('.item').fadeIn();

        $('.infinite_scroll').infinitescroll({
            navSelector: "#more", //导航的选择器，会被隐藏
            nextSelector: "#more a", //包含下一页链接的选择器
            itemSelector: ".item", //你将要取回的选项(内容块)
            debug: false, //启用调试信息
            animate: true, //当有新数据加载进来的时候，页面是否有动画效果，默认没有
            extraScrollPx: 150, //滚动条距离底部多少像素的时候开始加载，默认150
            bufferPx: 40, //载入信息的显示时间，时间越大，载入信息显示时间越短
            errorCallback: function() {
                alert('error');
            }, //当出错的时候，比如404页面的时候执行的函数
            loading: {
                img: "${ctx}/static/social/images/masonry_loading_1.gif",
                msgText: "",
                finishedMsg: '没有新数据了...'
            }
        }, function(newElements) {
            //程序执行完的回调函数
            var $newElems = $(newElements);
            $('.infinite_scroll').masonry('appended', $newElems, false);
            $newElems.fadeIn();
            item_callback();
            return;
        });

    });
</script>

<div class="demo clearfix">
<div class="item_list infinite_scroll">
<div class="item masonry_brick">
    <div class="item_t">
        <div class="img">
            <a href="http://www.jsfoot.com/js/images/more/2012-05-15/608.html"><img width="210" height="285" alt="js lazyload实现网页图片延迟加载特效" src="${ctx}/static/social/images/pic/01.jpg" /></a>
        </div>
        <div class="title"><span>js lazyload实现网页图片延迟加载特效</span></div>
    </div>
    <div class="item_b clearfix">
        <div class="items_author fl">
            <a href="http://www.jsfoot.com" class="like_btn"></a>
            <em class="bold">916</em>
        </div>
        <div class="items_createtime fr"><a href="http://www.jsfoot.com">评论</a><em class="bold">(0)</em></div>
    </div>
</div><!--item end-->

<div class="item masonry_brick">
    <div class="item_t">
        <div class="img">
            <a href="http://www.jsfoot.com/js/images/cj/2012-03-14/420.html"><img width="210" height="164" alt="js图片特效制作js焦点图上下滚动slider切换效果" src="${ctx}/static/social/images/pic/02.jpg" /></a>
        </div>
        <div class="title"><span>js图片特效制作js焦点图上下滚动slider切换效果</span></div>
    </div>
    <div class="item_b clearfix">
        <div class="items_author fl">
            <a href="http://www.jsfoot.com" class="like_btn"></a>
            <em class="bold">916</em>
        </div>
        <div class="items_createtime fr"><a href="http://www.jsfoot.com">评论</a><em class="bold">(0)</em></div>
    </div>
</div><!--item end-->

<div class="item masonry_brick">
    <div class="item_t">
        <div class="img">
            <a href="http://www.jsfoot.com/js/menu/sx/2012-03-25/502.html"><img width="210" height="287" alt="js树形导航菜单制作垂直js导航条特效" src="${ctx}/static/social/images/pic/03.jpg" /></a>
           
            <div class="btns">
                <a href="http://www.jsfoot.com/js/menu/sx/2012-03-25/502.html" class="img_album_btn">加入专辑</a>
            </div>
        </div>
        <div class="title"><span>js树形导航菜单制作垂直js导航条特效</span></div>
    </div>
    <div class="item_b clearfix">
        <div class="items_author fl">
            <a href="http://www.jsfoot.com" class="like_btn"></a>
            <em class="bold">916</em>
        </div>
        <div class="items_createtime fr"><a href="http://www.jsfoot.com">评论</a><em class="bold">(0)</em></div>
    </div>
</div><!--item end-->

<div class="item masonry_brick">
    <div class="item_t">
        <div class="img">
            <a href="http://www.jsfoot.com/flash/images/2012-09-06/753.html"><img width="210" height="285" alt="flash图片导航条自动切换轮播焦点图" src="${ctx}/static/social/images/pic/04.jpg" /></a>
           
            <div class="btns">
                <a href="http://www.jsfoot.com/flash/images/2012-09-06/753.html" class="img_album_btn">加入专辑</a>
            </div>
        </div>
        <div class="title"><span>flash图片导航条自动切换轮播焦点图</span></div>
    </div>
    <div class="item_b clearfix">
        <div class="items_author fl">
            <a href="http://www.jsfoot.com" class="like_btn"></a>
            <em class="bold">916</em>
        </div>
        <div class="items_createtime fr"><a href="http://www.jsfoot.com">评论</a><em class="bold">(0)</em></div>
    </div>
</div><!--item end-->

<div class="item masonry_brick">
    <div class="item_t">
        <div class="img">
            <a href="http://www.jsfoot.com/flash/images/2012-06-04/640.html"><img width="210" height="323" alt="flash图片特效左右按钮控制图片折叠切换效果" src="${ctx}/static/social/images/pic/05.jpg" /></a>
           
            <div class="btns">
                <a href="http://www.jsfoot.com/flash/images/2012-06-04/640.html" class="img_album_btn">加入专辑</a>
            </div>
        </div>
        <div class="title"><span>flash图片特效左右按钮控制图片折叠切换效果</span></div>
    </div>
    <div class="item_b clearfix">
        <div class="items_author fl">
            Alex Zhang
        </div>
        <div class="items_createtime fr">2012-12-21 13:41</div>
    </div>
</div><!--item end-->

<div class="item masonry_brick">
    <div class="item_t">
        <div class="img">
            <a href="http://www.jsfoot.com/flash/images/2012-05-08/596.html"><img width="210" height="315" alt="flash焦点图片带内容与按钮的3D动画图片特效" src="${ctx}/static/social/images/pic/06.jpg" /></a>
           
            <div class="btns">
                <a href="http://www.jsfoot.com/flash/images/2012-05-08/596.html" class="img_album_btn">加入专辑</a>
            </div>
        </div>
        <div class="title"><span>flash焦点图片带内容与按钮的3D动画图片特效</span></div>
    </div>
    <div class="item_b clearfix">
        <div class="items_author fl">
            <a href="http://www.jsfoot.com" class="like_btn"></a>
            <em class="bold">916</em>
        </div>
        <div class="items_createtime fr"><a href="http://www.jsfoot.com">评论</a><em class="bold">(0)</em></div>
    </div>
</div><!--item end-->

<div class="item masonry_brick">
    <div class="item_t">
        <div class="img">
            <a href="http://www.jsfoot.com/flash/images/2012-03-11/388.html"><img width="210" height="282" alt="flash特效制作flash图片滚动带按钮控制左右图片滚动" src="${ctx}/static/social/images/pic/07.jpg" /></a>
           
            <div class="btns">
                <a href="http://www.jsfoot.com/flash/images/2012-03-11/388.html" class="img_album_btn">加入专辑</a>
            </div>
        </div>
        <div class="title"><span>flash特效制作flash图片滚动带按钮控制左右图片滚动</span></div>
    </div>
    <div class="item_b clearfix">
        <div class="items_author fl">
            <a href="http://www.jsfoot.com" class="like_btn"></a>
            <em class="bold">916</em>
        </div>
        <div class="items_createtime fr"><a href="http://www.jsfoot.com">评论</a><em class="bold">(0)</em></div>
    </div>
</div><!--item end-->

<div class="item masonry_brick">
    <div class="item_t">
        <div class="img">
            <a href="http://www.jsfoot.com/flash/images/2012-03-03/378.html"><img width="210" height="266" alt="flash焦点图切换特效制作各大网站的焦点图片轮播" src="${ctx}/static/social/images/pic/08.jpg" /></a>
           
            <div class="btns">
                <a href="http://www.jsfoot.com/flash/images/2012-03-03/378.html" class="img_album_btn">加入专辑</a>
            </div>
        </div>
        <div class="title"><span>flash焦点图切换特效制作各大网站的焦点图片轮播</span></div>
    </div>
    <div class="item_b clearfix">
        <div class="items_author fl">
            <a href="http://www.jsfoot.com" class="like_btn"></a>
            <em class="bold">916</em>
        </div>
        <div class="items_createtime fr"><a href="http://www.jsfoot.com">评论</a><em class="bold">(0)</em></div>
    </div>
</div><!--item end-->

<div class="item masonry_brick">
    <div class="item_t">
        <div class="img">
            <a href="http://www.jsfoot.com/flash/images/2012-03-03/374.html"><img width="210" height="254" alt="flash焦点图切换动画图片和标题文字配合显示含flash源码下载" src="${ctx}/static/social/images/pic/09.jpg" /></a>
           
            <div class="btns">
                <a href="http://www.jsfoot.com/flash/images/2012-03-03/374.html" class="img_album_btn">加入专辑</a>
            </div>
        </div>
        <div class="title"><span>flash焦点图切换动画图片和标题文字配合显示含flash源码下载</span></div>
    </div>
    <div class="item_b clearfix">
        <div class="items_author fl">
            <a href="http://www.jsfoot.com" class="like_btn"></a>
            <em class="bold">916</em>
        </div>
        <div class="items_createtime fr"><a href="http://www.jsfoot.com">评论</a><em class="bold">(0)</em></div>
    </div>
</div><!--item end-->

<div class="item masonry_brick">
    <div class="item_t">
        <div class="img">
            <a href="http://www.jsfoot.com/flash/images/2012-03-03/370.html"><img width="210" height="276" alt="flash图片切换左右滚动带序列索引按钮控制flash动画图片特效" src="${ctx}/static/social/images/pic/10.jpg" /></a>
           
            <div class="btns">
                <a href="http://www.jsfoot.com/flash/images/2012-03-03/370.html" class="img_album_btn">加入专辑</a>
            </div>
        </div>
        <div class="title"><span>flash图片切换左右滚动带序列索引按钮控制flash动画图片特效</span></div>
    </div>
    <div class="item_b clearfix">
        <div class="items_author fl">
            <a href="http://www.jsfoot.com" class="like_btn"></a>
            <em class="bold">916</em>
        </div>
        <div class="items_createtime fr"><a href="http://www.jsfoot.com">评论</a><em class="bold">(0)</em></div>
    </div>
</div><!--item end-->

<div class="item masonry_brick">
    <div class="item_t">
        <div class="img">
            <a href="http://www.jsfoot.com/flash/letter/2012-03-04/386.html"><img width="210" height="131" alt="flash文字特效制作数字类似文字打印效果,属于flash动画文字特效一种" src="${ctx}/static/social/images/pic/11.jpg" /></a>
           
            <div class="btns">
                <a href="http://www.jsfoot.com/flash/letter/2012-03-04/386.html" class="img_album_btn">加入专辑</a>
            </div>
        </div>
        <div class="title"><span>flash文字特效制作数字类似文字打印效果,属于flash动画文字特效一种</span></div>
    </div>
    <div class="item_b clearfix">
        <div class="items_author fl">
            <a href="http://www.jsfoot.com" class="like_btn"></a>
            <em class="bold">916</em>
        </div>
        <div class="items_createtime fr"><a href="http://www.jsfoot.com">评论</a><em class="bold">(0)</em></div>
    </div>
</div><!--item end-->

<div class="item masonry_brick">
    <div class="item_t">
        <div class="img">
            <a href="http://www.jsfoot.com/css3/layout/2011-10-13/215.html"><img width="210" height="131" alt="div+css制作在IE6 上用absolute模拟fixed IE6浏览器定位层框不闪动" src="${ctx}/static/social/images/pic/12.jpg" /></a>
           
            <div class="btns">
                <a href="http://www.jsfoot.com/css3/layout/2011-10-13/215.html" class="img_album_btn">加入专辑</a>
            </div>
        </div>
        <div class="title"><span>div+css制作在IE6 上用absolute模拟fixed IE6浏览器定位层框不闪动</span></div>
    </div>
    <div class="item_b clearfix">
        <div class="items_author fl">
            <a href="http://www.jsfoot.com" class="like_btn"></a>
            <em class="bold">916</em>
        </div>
        <div class="items_createtime fr"><a href="http://www.jsfoot.com">评论</a><em class="bold">(0)</em></div>
    </div>
</div><!--item end-->

<div class="item masonry_brick">
    <div class="item_t">
        <div class="img">
            <a href="http://www.jsfoot.com/css3/layout/2011-02-21/36.html"><img width="210" height="287" alt="CSS如何定位工程" src="${ctx}/static/social/images/pic/13.jpg" /></a>
           
            <div class="btns">
                <a href="http://www.jsfoot.com/css3/layout/2011-02-21/36.html" class="img_album_btn">加入专辑</a>
            </div>
        </div>
        <div class="title"><span>CSS如何定位工程</span></div>
    </div>
    <div class="item_b clearfix">
        <div class="items_author fl">
            <a href="http://www.jsfoot.com" class="like_btn"></a>
            <em class="bold">916</em>
        </div>
        <div class="items_createtime fr"><a href="http://www.jsfoot.com">评论</a><em class="bold">(0)</em></div>
    </div>
</div><!--item end-->

<div class="item masonry_brick">
    <div class="item_t">
        <div class="img">
            <a href="http://www.jsfoot.com/css3/menu/2011-09-21/197.html"><img width="210" height="323" alt="用div+css3美化制作动画导航特效鼠标滑过动画显示" src="${ctx}/static/social/images/pic/14.jpg" /></a>
           
            <div class="btns">
                <a href="http://www.jsfoot.com/css3/menu/2011-09-21/197.html" class="img_album_btn">加入专辑</a>
            </div>
        </div>
        <div class="title"><span>用div+css3美化制作动画导航特效鼠标滑过动画显示</span></div>
    </div>
    <div class="item_b clearfix">
        <div class="items_author fl">
            <a href="http://www.jsfoot.com" class="like_btn"></a>
            <em class="bold">916</em>
        </div>
        <div class="items_createtime fr"><a href="http://www.jsfoot.com">评论</a><em class="bold">(0)</em></div>
    </div>
</div><!--item end-->

<div class="item masonry_brick">
    <div class="item_t">
        <div class="img">
            <a href="http://www.jsfoot.com/css3/menu/2011-02-20/22.html"><img width="210" height="304" alt="用div+css制作一个CSS3的简约图标导航菜单" src="${ctx}/static/social/images/pic/15.jpg" /></a>
           
            <div class="btns">
                <a href="http://www.jsfoot.com/css3/menu/2011-02-20/22.html" class="img_album_btn">加入专辑</a>
            </div>
        </div>
        <div class="title"><span>用div+css制作一个CSS3的简约图标导航菜单</span></div>
    </div>
    <div class="item_b clearfix">
        <div class="items_author fl">
            <a href="http://www.jsfoot.com" class="like_btn"></a>
            <em class="bold">916</em>
        </div>
        <div class="items_createtime fr"><a href="http://www.jsfoot.com">评论</a><em class="bold">(0)</em></div>
    </div>
</div><!--item end-->

<div class="item masonry_brick">
    <div class="item_t">
        <div class="img">
            <a href="http://www.jsfoot.com/html5/tx/2011-08-13/120.html"><img width="210" height="315" alt="jquery 图片特效用CSS3和HTML5制作仿动画头条报纸缩小到放大翻转图片展示" src="${ctx}/static/social/images/pic/16.jpg" /></a>
           
            <div class="btns">
                <a href="http://www.jsfoot.com/html5/tx/2011-08-13/120.html" class="img_album_btn">加入专辑</a>
            </div>
        </div>
        <div class="title"><span>jquery 图片特效用CSS3和HTML5制作仿动画头条报纸缩小到放大翻转图片展示</span></div>
    </div>
    <div class="item_b clearfix">
        <div class="items_author fl">
            <a href="http://www.jsfoot.com" class="like_btn"></a>
            <em class="bold">916</em>
        </div>
        <div class="items_createtime fr"><a href="http://www.jsfoot.com">评论</a><em class="bold">(0)</em></div>
    </div>
</div><!--item end-->

<div class="item masonry_brick">
    <div class="item_t">
        <div class="img">
            <a href="http://www.jsfoot.com/html5/tx/2011-02-21/42.html"><img width="210" height="314" alt="jquery 幻灯片切换应用一个HTML5的幻灯片" src="${ctx}/static/social/images/pic/17.jpg" /></a>
           
            <div class="btns">
                <a href="http://www.jsfoot.com/html5/tx/2011-02-21/42.html" class="img_album_btn">加入专辑</a>
            </div>
        </div>
        <div class="title"><span>jquery 幻灯片切换应用一个HTML5的幻灯片</span></div>
    </div>
    <div class="item_b clearfix">
        <div class="items_author fl">
            <a href="http://www.jsfoot.com" class="like_btn"></a>
            <em class="bold">916</em>
        </div>
        <div class="items_createtime fr"><a href="http://www.jsfoot.com">评论</a><em class="bold">(0)</em></div>
    </div>
</div><!--item end-->

</div>


<div id="more"><a href="${ctx}/static/social/page/2.html"></a></div>

<div id="page" class="page" style="display:none;">
    <div class="page_num">
        <span class="unprev"></span>
        <span class="current">1</span>
        <a href="http://www.jsfoot.com">&nbsp;2&nbsp;</a>
        <a href="http://www.jsfoot.com">&nbsp;3&nbsp;</a>
        <a href="http://www.jsfoot.com">&nbsp;4&nbsp;</a>
        <a href="http://www.jsfoot.com">&nbsp;5&nbsp;</a>
        <span class="etc"></span>
        <a href="http://www.jsfoot.com">12</a>
        <a href="http://www.jsfoot.com" class="next"></a>
    </div>
</div>

</div>

<div style="display:none;" id="gotopbtn" class="to_top"><a title="返回顶部" href="javascript:void(0);"></a></div>


<script type="text/javascript">
    $(function(){

        $(window).scroll(function(){
            $(window).scrollTop()>1000 ? $("#gotopbtn").css('display','').click(function(){
                $(window).scrollTop(0);
            }):$("#gotopbtn").css('display','none');
        });

    });
</script>

</body>
</html>
