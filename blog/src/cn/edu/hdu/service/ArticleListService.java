package cn.edu.hdu.service;

import cn.edu.hdu.domain.Article;
import cn.edu.hdu.domain.ArticleByName;
import cn.edu.hdu.domain.PageBean;

import java.util.List;

/*
* 文章管理
*
* */
public interface ArticleListService {
    /*
    * 查询文章标题和简介
    *
    * */
    public List<ArticleByName> findAll();
    /*
    实现条件分页查询
    * */
    PageBean<ArticleByName> findArticleByPage(String currentPage, String rows,String words);


    Article findArticle(String article_id);
    /*
    * 用文章id删除文章
    * */
    void delArticle(String article_id);
    /*
    * 添加文章
    * */
    void addArticle(Article article);
    /*
    * 修改文章
    * */
    void updateArticle(Article article);
    //用user_id删除文章
    void delArticleByUserId(String id);
}
