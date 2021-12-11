package cn.edu.hdu.web.servlet;

import cn.edu.hdu.domain.Article;
import cn.edu.hdu.domain.ArticleByName;
import cn.edu.hdu.domain.PageBean;
import cn.edu.hdu.service.ArticleListService;
import cn.edu.hdu.service.impl.ArticleListImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author ASUS
 * @version 1.0
 * @date 2021/12/10
 * @project blog
 */
@WebServlet("/home")
public class IndexServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //获取参数
        String currentPage = request.getParameter("currentPage");//当前页码
        String rows = request.getParameter("rows");//显示每页条数

        if(currentPage==null||"".equals(currentPage)){
            currentPage="1";
        }
        if(rows==null||"".equals(rows)){
            rows="10";
        }
        String words = request.getParameter("words");
        //System.out.println(words);
        //调用service查询
        ArticleListService service = new ArticleListImpl();
        PageBean<ArticleByName> pb = service.findArticleByPage(currentPage,rows,words);
        if(pb.getTotalCount()==0) {
            request.setAttribute("blank","没有查询到文章");
        }
        //将pagebean存入request
        request.setAttribute("pb",pb);
        request.getRequestDispatcher("/home.jsp").forward(request, response);
    }
}
