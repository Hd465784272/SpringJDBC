package com.springdemo.blog.dao;

import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import com.springdemo.blog.po.Article;
import com.springdemo.blog.po.User;

public interface UserDao {
	/**
	 * This is the method to be used to initialize database resources ie.
	 * connection.
	 */
	public void setDataSource(DataSource ds);

	/**
	 * 
	 * @param username
	 * @param password
	 * @param nickname
	 * @param question
	 * @param answer
	 *            此方法被用于 在User表中插入一条记录
	 */
	public void create(String username, String pwd, String nickname, String question, String answer);
	/**
	 * 
	 * @param username
	 * @return boolean
	 * 此方法用于 判断username是否唯一。
	 */
	public boolean checkTheUsername(String username);

	/**
	 * 
	 * @param username
	 * @param password
	 * @return List<User>
	 * 			 此方法被用于	在USER表中 ，判断账户密码是否正确
	 */
	public List<User> userLogin(String username, String password);
	
	/**
	 * 
	 * @return List<Article>
	 * 		此方法用于     Article表， 读取所有文章
	 */
	public List<Article> readAllArticle(int initcount ,int percount);
	
	/**
	 * @param type 文章类型
	 * @param initcount 第几页
	 * @param type 每页数据条数
	 * @return List<Article> 
	 * 此方法用于根据type查询对应类型的文章
	 * 	Tip:	type:1 普通日志
	 * 			type:2 私密日志
	 * 			type:3 记事本
	 * 			type:4 草稿箱
	 */
	public List<Article> readArticleByCondition(int type ,int initcount ,int percount);
	
	/**
	 * @param flag 是否被删除标识；0：正常|1：被删除。
	 * @return List<Article>
	 * Tip:；0：正常|1：被删除。
	 */
	public List<Article> recycle(int flag);
	
	/**
	 * 添加文章
	 * @param id
	 * @param title
	 * @param content
	 * @param username
	 * @param date
	 * @param hasread
	 * @param flag
	 * @param type
	 */
	public void addArticle(int id, String title, String content, String username, Date date
			, Integer hasread, int flag , Integer type);
	/**
	 * @return int  
	 * 返回所有数据的条数。
	 */
	public int PaginationCountNum();
	/**
	 * 
	 * @return  数据的条数。
	 * 根据文章类型查询有多少条数据。
	 */
	public int PaginationCountNumByType(Integer  type);

}
