package cn.edu.hdu.web.servlet;

import cn.edu.hdu.domain.Article;
import cn.edu.hdu.service.ArticleListService;
import cn.edu.hdu.service.impl.ArticleListImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

//管理员添加文章
@WebServlet("/mdAdArticleServlet")
public class MdadArticleServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 编码
        request.setCharacterEncoding("utf-8");
        // 获取请求参数

        //封装对象
        Map<String, String[]> map = request.getParameterMap();
        Article article = new Article();
        try {
            BeanUtils.populate(article,map);//使用工具包
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
        //调用Service保存
        ArticleListService service = new ArticleListImpl();
        int userId = Integer.parseInt(request.getParameter("user_id"));
        article.setUser_id(userId);
        service.addArticle(article);
        //跳转回登录页面
        response.sendRedirect(request.getContextPath()+"/findAdarticleByPageServlet");
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            this.doPost(request,response);
    }
}
