<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/12/11
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>头部</title>
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>
<header class="text-gray-100 bg-gray-400 body-font shadow w-full">
    <div class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
        <nav class="flex lg:w-2/5 flex-wrap items-center text-base md:ml-auto">
            <a class="mr-5 hover:text-gray-900 cursor-pointer border-b border-transparent"
               href="${pageContext.request.contextPath}/index.jsp">首页</a>
            <a class="mr-5 hover:text-gray-900 cursor-pointer border-b border-transparent"
               href="${pageContext.request.contextPath}/findArticleByPageServlet">文章列表 <span
                    class="sr-only">(current)</span></a>
            <a class="mr-5 hover:text-gray-900 cursor-pointer border-b border-transparent ">联系我们</a>
            <a class="mr-5 hover:text-gray-900 cursor-pointer border-b border-transparent "
               href="https://github.com/myxym-love">Github</a>
        </nav>
        <div class="pt-2 relative mx-auto text-gray-600">
            <form action="${pageContext.request.contextPath}/findArticleByPageServlet" method="post">
                <label>
                    <input class="border-2 border-gray-300 bg-white h-10 px-5 pr-16 rounded-lg text-sm focus:outline-none"
                           type="text" name="words" placeholder="Search">
                </label>
                <button type="submit" class="absolute right-0 top-0 mt-5 mr-4">
                    <svg class="text-gray-600 h-4 w-4 fill-current" xmlns="http://www.w3.org/2000/svg"
                         version="1.1" id="Capa_1" x="0px" y="0px"
                         viewBox="0 0 56.966 56.966" style="enable-background:new 0 0 56.966 56.966;"
                         xml:space="preserve"
                         width="512px" height="512px">
            <path
                    d="M55.146,51.887L41.588,37.786c3.486-4.144,5.396-9.358,5.396-14.786c0-12.682-10.318-23-23-23s-23,10.318-23,23  s10.318,23,23,23c4.761,0,9.298-1.436,13.177-4.162l13.661,14.208c0.571,0.593,1.339,0.92,2.162,0.92  c0.779,0,1.518-0.297,2.079-0.837C56.255,54.982,56.293,53.08,55.146,51.887z M23.984,6c9.374,0,17,7.626,17,17s-7.626,17-17,17  s-17-7.626-17-17S14.61,6,23.984,6z"></path>
          </svg>
                </button>
            </form>
        </div>
        <c:if test="${sessionScope.user.username == null}">
            <div class="flex lg:w-2/5 flex-wrap items-center text-base md:ml-auto">
                <a class="mr-5 cursor-pointer border-b border-transparent" href="${pageContext.request.contextPath}/login.jsp">未登录</a>
                <a class="mr-5 hover:text-gray-900 cursor-pointer border-b border-transparent"
                   href="${pageContext.request.contextPath}/register.jsp">注册</a>
            </div>
        </c:if>
        <c:if test="${sessionScope.user.username != null}">
            <div class="flex lg:w-2/5 flex-wrap items-center text-base md:ml-auto">
                <a class="mr-5 cursor-pointer border-b border-transparent">欢迎您,${sessionScope.user.username}</a>
                <a class="mr-5 hover:text-gray-900 cursor-pointer border-b border-transparent"
                   href="${pageContext.request.contextPath}/upuser.jsp">账号管理</a>
                <a class="mr-5 hover:text-gray-900 cursor-pointer border-b border-transparent"
                   href="${pageContext.request.contextPath}/mdchangeArticle.jsp">添加文章</a>
                <a class="mr-5 hover:text-gray-900 cursor-pointer border-b border-transparent"
                   href="${pageContext.request.contextPath}/logoutServlet">退出登录</a>
            </div>
        </c:if>
    </div>
</header>
</body>
</html>
