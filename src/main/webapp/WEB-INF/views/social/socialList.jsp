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

    .loading{margin-left:auto;margin-right:auto;}

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
                //alert('error');
            }, //当出错的时候，比如404页面的时候执行的函数
            loading: {
                <%--img: "${ctx}/static/social/images/masonry_loading_1.gif",--%>
                msgText: "",
                finishedMsg: '没有新数据了...',
                selector: '.loading' // 显示loading信息的div
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
<%--<div class="item masonry_brick">--%>
    <%--<div class="item_t">--%>
        <%--<div class="img">--%>
            <%--<a href="http://www.jsfoot.com/js/images/more/2012-05-15/608.html"><img width="210" height="285" alt="js lazyload实现网页图片延迟加载特效" src="${ctx}/static/social/images/pic/01.jpg" /></a>--%>
        <%--</div>--%>
        <%--<div class="title"><span>航空事业多美女，速来围观.</span></div>--%>
    <%--</div>--%>
    <%--<div class="item_b clearfix">--%>
        <%--<div class="items_author fl">--%>
            <%--<a href="http://www.jsfoot.com" class="like_btn"></a>--%>
            <%--<em class="bold">916</em>--%>
        <%--</div>--%>
        <%--<div class="items_createtime fr"><a href="http://www.jsfoot.com">评论</a><em class="bold">(0)</em></div>--%>
    <%--</div>--%>
<%--</div>--%>
    <!--item end-->

<c:forEach items="${attaches.content}" var="attach"  varStatus="status">
    <div class="item masonry_brick">
        <div class="item_t">
            <div class="img">
                <a href="#"><img width="210" height="164" alt="${attach.description}" src="${ctx}/${attach.savePath}${attach.saveName}" /></a>
            </div>
            <div class="title"><span>${attach.description}</span></div>
        </div>
        <div class="item_b clearfix">
            <div class="items_author fl">
                    发布by ${attach.user.name}
            </div>
            <div class="items_createtime fr"><em class="bold"><fmt:formatDate value="${attach.ctime}" pattern="yyyy-MM-dd  HH:mm"/></em></div>
        </div>
    </div><!--item end-->
</c:forEach>

</div>
    <div class="loading" style="text-align: center;"></div>
<div id="more"><a href="${ctx}/social/datapage.htm?page=2"></a></div>
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
