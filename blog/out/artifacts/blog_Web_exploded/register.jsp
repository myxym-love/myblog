<%--
  Created by IntelliJ IDEA.
  User: skd
  Date: 2020/10/13
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" errorPage="error.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>skd的博客-注册界面</title>
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>

    <script>
        function checkUsername() {
            const v = $("#username")
            const username = v.val();
            //8-20位单词
            const reg_username = /^\w{8,20}$/;
            const flag = reg_username.test(username);
            if (flag) {
                //用户名合法
                v.css("border", "");

            } else {
                //用户名非法
                v.css("border", "1px solid red");
            }
            return flag;
        }

        function checkPassword() {
            const v = $("#password")
            const password = v.val();
            //8-20位单词
            const reg_password = /^\w{8,20}$/;
            const flag = reg_password.test(password);
            if (flag) {
                //用户名合法
                v.css("border", "");

            } else {
                //用户名非法
                v.css("border", "1px solid red");
            }
            return flag;
        }

        function checkEmail() {
            const v = $("#email")
            const email = v.val();
            const reg_email = /^\w+@\w+\.\w+$/;
            const flag = reg_email.test(email);
            if (flag) {
                v.css("border", "");
            } else {
                v.css("border", "1px solid red");
            }
            return flag;

        }

        function checkname() {
            const v = $("#name")
            const name = v.val();
            // 验证姓名，汉字和字母
            const reg_name = /^[a-zA-Z\u4e00-\u9fa5]+$/;
            const flag = reg_name.test(name);
            if (flag) {
                v.css("border", "");
            } else {
                v.css("border", "1px solid red");
            }
            return flag;
        }

        function checkphone() {
            const v = $("#phone")
            const phone = v.val();
            // 验证手机号码
            const reg_phone = /^1[3|4|5|8][0-9]\d{4,8}$/;
            const flag = reg_phone.test(phone);
            if (flag) {
                v.css("border", "");
            } else {
                v.css("border", "1px solid red");
            }
            return flag;
        }


        $(function () {
            $("#registerForm").submit(function () {
                return checkUsername() && checkPassword() && checkEmail() && checkname();
                //如果方法没有返回值或为true，提交表单
            });

            //当某一个组件失去焦点的时候，调用校验方法
            $("#username").blur(checkUsername);
            $("#password").blur(checkPassword);
            $("#email").blur(checkEmail);
            $("#name").blur(checkname);
            $("#phone").blur(checkphone);
        });
    </script>
</head>
<body>

<jsp:include page="/components/header.jsp"></jsp:include>
<!--注册表单-->
<div class="min-h-screen flex flex-col items-center justify-center bg-gray-100">
    <div class="flex flex-col bg-white shadow-md px-4 sm:px-6 md:px-8 lg:px-10 py-10 rounded-md w-full max-w-md">
        <div class="font-medium self-center text-xl sm:text-2xl uppercase text-gray-800">欢迎注册</div>

        <div class="mt-10">
            <form action="${pageContext.request.contextPath}/registerServlet" method="post">
                <div class="flex flex-col mb-6">
                    <label for="username" class="mb-1 text-xs sm:text-sm tracking-wide text-gray-600">用户名:</label>
                    <div class="relative">
                        <div class="inline-flex items-center justify-center absolute left-0 top-0 h-full w-10 text-gray-400">
                            <svg class="h-6 w-6" fill="none" stroke-linecap="round" stroke-linejoin="round"
                                 stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                                <path d="M16 12a4 4 0 10-8 0 4 4 0 008 0zm0 0v1.5a2.5 2.5 0 005 0V12a9 9 0 10-9 9m4.5-1.206a8.959 8.959 0 01-4.5 1.207"></path>
                            </svg>
                        </div>

                        <input id="username" type="text" name="username"
                               class="text-sm sm:text-base placeholder-gray-500 pl-10 pr-4 rounded-lg border border-gray-400 w-full py-2 focus:outline-none focus:border-blue-400"
                               placeholder="请输入用户名"/>
                    </div>
                </div>
                <div class="flex flex-col mb-6">
                    <label for="password" class="mb-1 text-xs sm:text-sm tracking-wide text-gray-600">密码:</label>
                    <div class="relative">
                        <div class="inline-flex items-center justify-center absolute left-0 top-0 h-full w-10 text-gray-400">
              <span>
                <svg class="h-6 w-6" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                     viewBox="0 0 24 24" stroke="currentColor">
                  <path d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path>
                </svg>
              </span>
                        </div>
                        <input id="password" type="password" name="password"
                               class="text-sm sm:text-base placeholder-gray-500 pl-10 pr-4 rounded-lg border border-gray-400 w-full py-2 focus:outline-none focus:border-blue-400"
                               placeholder="请输入密码"/>
                    </div>
                </div>

                <!-邮箱->
                <div class="flex flex-col mb-6">
                    <label for="email" class="mb-1 text-xs sm:text-sm tracking-wide text-gray-600">邮箱:</label>
                    <div class="relative">
                        <div class="inline-flex items-center justify-center absolute left-0 top-0 h-full w-10 text-gray-400">
                            <svg class="h-6 w-6" fill="none" stroke-linecap="round" stroke-linejoin="round"
                                 stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                                <path d="M16 12a4 4 0 10-8 0 4 4 0 008 0zm0 0v1.5a2.5 2.5 0 005 0V12a9 9 0 10-9 9m4.5-1.206a8.959 8.959 0 01-4.5 1.207"/>
                            </svg>
                        </div>
                        <input id="email" type="email" name="user_email"
                               class="text-sm sm:text-base placeholder-gray-500 pl-10 pr-4 rounded-lg border border-gray-400 w-full py-2 focus:outline-none focus:border-blue-400"
                               placeholder="请输入Email"/>
                    </div>
                </div>
                <!-真实姓名->
                <div class="flex flex-col mb-6">
                    <label for="name" class="mb-1 text-xs sm:text-sm tracking-wide text-gray-600">真实姓名:</label>
                    <div class="relative">
                        <div class="inline-flex items-center justify-center absolute left-0 top-0 h-full w-10 text-gray-400">
                            <svg class="h-6 w-6" fill="none" stroke-linecap="round" stroke-linejoin="round"
                                 stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                                <path d="M16 12a4 4 0 10-8 0 4 4 0 008 0zm0 0v1.5a2.5 2.5 0 005 0V12a9 9 0 10-9 9m4.5-1.206a8.959 8.959 0 01-4.5 1.207"/>
                            </svg>
                        </div>
                        <input id="name" type="text" name="user_realname"
                               class="text-sm sm:text-base placeholder-gray-500 pl-10 pr-4 rounded-lg border border-gray-400 w-full py-2 focus:outline-none focus:border-blue-400"
                               placeholder="请输入真实姓名"/>
                    </div>
                </div>
                <!-手机号->
                <div class="flex flex-col mb-6">
                    <label for="phone" class="mb-1 text-xs sm:text-sm tracking-wide text-gray-600">手机号码:</label>
                    <div class="relative">
                        <div class="inline-flex items-center justify-center absolute left-0 top-0 h-full w-10 text-gray-400">
                            <svg class="h-6 w-6" fill="none" stroke-linecap="round" stroke-linejoin="round"
                                 stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                                <path d="M16 12a4 4 0 10-8 0 4 4 0 008 0zm0 0v1.5a2.5 2.5 0 005 0V12a9 9 0 10-9 9m4.5-1.206a8.959 8.959 0 01-4.5 1.207"/>
                            </svg>
                        </div>
                        <input id="phone" type="text" name="user_phone"
                               class="text-sm sm:text-base placeholder-gray-500 pl-10 pr-4 rounded-lg border border-gray-400 w-full py-2 focus:outline-none focus:border-blue-400"
                               placeholder="请输入手机号"/>
                    </div>
                </div>
                <!-性别->
                <div>
                    <label class="mb-1 text-xs sm:text-sm tracking-wide text-gray-600">性别:</label>
                    <input type="radio" name="user_sex" value="male">男
                    <input type="radio" name="user_sex" value="female">女
                </div>
                <!-出生日期->
                <div>
                    <lable class="mb-1 text-xs sm:text-sm tracking-wide text-gray-600">出生日期</lable>
                    <input type="date" name="user_bir">
                </div>
                <div class="flex flex-col mb-6">
                    <label for="ide" class="mb-1 text-xs sm:text-sm tracking-wide text-gray-600">验证码:</label>
                    <div class="relative">
                        <div class="inline-flex items-center justify-center absolute left-0 top-0 h-full w-10 text-gray-400">
                            <svg class="h-6 w-6" fill="none" stroke-linecap="round" stroke-linejoin="round"
                                 stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                                <path d="M16 12a4 4 0 10-8 0 4 4 0 008 0zm0 0v1.5a2.5 2.5 0 005 0V12a9 9 0 10-9 9m4.5-1.206a8.959 8.959 0 01-4.5 1.207"/>
                            </svg>

                        </div>

                        <input id="ide" type="text" name="image"
                               class="text-sm sm:text-base placeholder-gray-500 pl-10 pr-4 rounded-lg border border-gray-400 w-full py-2 focus:outline-none focus:border-blue-400"
                               placeholder="验证码"/>
                    </div>
                    <div class="flex items-center justify-center ">
                        <img id="img" src="${pageContext.request.contextPath}/VerifyCodeServlet" class="">
                        <input type="button" value="看不清? 换一张." id="btn">
                        <div class="col-md-4 "><font color="red">${requestScope.imageMess}</font></div>
                    </div>
                </div>


                <div class="flex w-full">
                    <button type="submit"
                            class="flex items-center justify-center focus:outline-none text-white text-sm sm:text-base bg-blue-600 hover:bg-blue-700 rounded py-2 w-full transition duration-150 ease-in">
                        <span class="mr-2 uppercase">注册</span>
                        <span>
              <svg class="h-6 w-6" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                   viewBox="0 0 24 24" stroke="currentColor">
                <path d="M13 9l3 3m0 0l-3 3m3-3H8m13 0a9 9 0 11-18 0 9 9 0 0118 0z"/>
              </svg>
            </span>
                    </button>
                </div>
            </form>
        </div>
        <div class="flex justify-center items-center mt-6">
            <a href="${pageContext.request.contextPath}/login.jsp" target="_blank"
               class="inline-flex items-center font-bold text-blue-500 hover:text-blue-700 text-xs text-center">
        <span>
          <svg class="h-6 w-6" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
               viewBox="0 0 24 24" stroke="currentColor">
            <path d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"/>
          </svg>
        </span>
                <span class="ml-2">已经拥有账号?</span>
            </a>
        </div>
    </div>
</div>
<!--页脚-->
<jsp:include page="components/footer.jsp"></jsp:include>
<script type="text/javascript">

    document.getElementById("btn").onclick = function () {
        // 获取img元素
        // 为了让浏览器发送请求到servlet, 所以一定要改变src
        document.getElementsByTagName("img")[0].src =
            "${pageContext.request.contextPath}/VerifyCodeServlet?time=" + new Date().getTime();
    };
    document.getElementById("img").onclick = function () {
        this.src = "${pageContext.request.contextPath}/VerifyCodeServlet?time" + new Date().getTime();
    };
</script>
</body>
</html>
