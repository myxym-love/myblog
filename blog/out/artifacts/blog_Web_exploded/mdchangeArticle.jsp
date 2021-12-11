<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: skd
  Date: 2020/11/15
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加文章</title>
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/editormd.css"/>
    <script src="${pageContext.request.contextPath}/static/src/editormd.js"></script>
</head>
<body>

<jsp:include page="/components/header.jsp"></jsp:include>

<div class="flex flex-col mb-6 text-center  mx-40">
    <form action="${pageContext.request.contextPath}/mdAdArticleServlet?user_id=${sessionScope.user.id}" method="post">
        <%--                <div class="relative">--%>
        <%--                    <label for="user_id">用户id</label>--%>
        <%--                    <input type="text" name="user_id" class="text-sm sm:text-base placeholder-gray-500 pl-10 pr-4 rounded-lg border border-gray-400 w-full py-2 focus:outline-none focus:border-blue-400" id="user_id" placeholder="请输入用户名ID" value=""/>--%>
        <%--                </div>--%>

        <div class="relative">
            <label for="article_title">文章标题</label>
            <input type="text" name="article_title"
                   class="text-sm sm:text-base placeholder-gray-500 pl-10 pr-4 rounded-lg border border-gray-400 w-full py-2 focus:outline-none focus:border-blue-400"
                   id="article_title" placeholder="请输入文章标题" value=""/>
        </div>

        <div class="relative">
            <label for="article_ind">文章简介</label>
            <input type="text" name="article_ind"
                   class="text-sm sm:text-base placeholder-gray-500 pl-10 pr-4 rounded-lg border border-gray-400 w-full py-2 focus:outline-none focus:border-blue-400"
                   placeholder="请输入文章简介" id="article_ind">
        </div>
        <div>
            <label>文章内容</label>
            <div id="layout">
                <div id="my-editormd">
                    <textarea id="my-editormd-markdown-doc" name="article_context1"></textarea>
                    <!-- 注意：name属性的值-->
                    <textarea id="article_context" name="article_context" style="display:none;"></textarea>
                </div>

            </div>
        </div>
        <br/>
        <div class="form-group" style="text-align: center;">
            <input class="btn" type="submit" value="添加">
        </div>
    </form>
</div>
<jsp:include page="components/footer.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/static/src/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/src/editormd.js"></script>
<script type="text/javascript">
    <!--为了让editor.md编辑器完整的显示出来-->
    var testEditor;
    $(function () {
        testEditor = editormd("my-editormd", {
            width: "90%",
            height: 640,
            syncScrolling: "single",
            path: "${pageContext.request.contextPath}/static/lib/",//指向markdown的路径
            saveHTMLToTextarea: true,
            toolbarAutoFixed: true,//工具栏自动固定定位的开启与禁用
            imageUpload: false,
            imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL: "${pageContext.request.contextPath}/imageUploadServlet",
        });
    });

</script>

</body>
</html>
