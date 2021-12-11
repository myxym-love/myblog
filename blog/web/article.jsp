<%--
  Created by IntelliJ IDEA.
  User: skd
  Date: 2020/10/15
  Time: 19:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>skd的博客-文章</title>
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/editormd.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/editormd.preview.min.css"/>
    <script src="${pageContext.request.contextPath}/static/src/editormd.js"></script>
    <script src="${pageContext.request.contextPath}/static/lib/marked.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/lib/prettify.min.js"></script>
    <style>
        body {
            background-color: #fdfcf8;
        }

    </style>
</head>
<body>
<jsp:include page="components/header.jsp"></jsp:include>

<!--文章列表-->
<div class="flex flex-col mb-6 mx-40 text-center">
    <div class="relative">
        <h2>${article.article_title}</h2>
        <h5>作者：${user.username} 创作日期：${article.article_date}</h5>
        <hr/>
    </div>
    <div class="relative">
        <%-- <p><pre class=".pre-scrollable">${article.article_context}</pre></p>--%>
        <div id="test-editormd-view">
            <textarea style="background-color:#fdfcf8;  display:none;"
                      name="test-editormd-markdown-doc">${article.article_context}</textarea>
        </div>
        <h4>评论区</h4>
        <hr/>
    </div>

    <c:forEach items="${review}" var="review" varStatus="s">
        <div class="relative">
            <h4><strong>${review.username}</strong><small>发布日期：${review.review_date}</small></h4>
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-3"><p>${review.review_context}</p></div>
            </div>
            <hr/>
        </div>
    </c:forEach>
    <%--评论框--%>
    <div class="relative">
        <form action="${pageContext.request.contextPath}/adreviewServlet?article_id=${article.article_id}&username=${username}"
              method="post">
            <h5>请输入你想发表的评论，注意文明用语哦~</h5>
            <textarea name="review_context" class="w-full" rows="3"></textarea>
            <input class="btn btn-default" type="submit" value="提交">
        </form>
    </div>
</div>
<!--页脚-->
<jsp:include page="components/footer.jsp"></jsp:include>


<!-- Editor markdown转html -->
<script type="text/javascript">
    $(function () {
        var testEditormdView, testEditormdView2;
        editormd.markdownToHTML("test-editormd-view"), {
            emoji: true,
            htmlDecode: "style,script,iframe"  // you can filter tags decode
        };
        testEditormdView = editormd.markdownToHTML("test-editormd-view", {
            markdown: markdown,//+ "\r\n" + $("#append-test").text(),
            //htmlDecode      : true,       // 开启 HTML 标签解析，为了安全性，默认不开启
            htmlDecode: "style,script,iframe",  // you can filter tags decode
            //toc             : false,
            tocm: true,    // Using [TOCM]
            //tocContainer    : "#custom-toc-container", // 自定义 ToC 容器层
            //gfm             : false,
            //tocDropdown     : true,
            // markdownSourceCode : true, // 是否保留 Markdown 源码，即是否删除保存源码的 Textarea 标签
            emoji: true,
            taskList: true,
            tex: true,  // 默认不解析
            flowChart: true,  // 默认不解析
            sequenceDiagram: true,  // 默认不解析
        });

        //console.log("返回一个 jQuery 实例 =>", testEditormdView);

        // 获取Markdown源码
        //console.log(testEditormdView.getMarkdown());

        //alert(testEditormdView.getMarkdown());


        /* testEditormdView2 = editormd.markdownToHTML("test-editormd-view2", {
             htmlDecode      : "style,script,iframe",  // you can filter tags decode
             emoji           : true,
             taskList        : true,
             tex             : true,  // 默认不解析
             flowChart       : true,  // 默认不解析
             sequenceDiagram : true,  // 默认不解析
         });*/
    });
    /*$(function(){
        alert("1");
        alert(editormd.markdownToHTML("test-editormd-view"),{emoji : true});
    })*/
</script>


</body>
</html>
