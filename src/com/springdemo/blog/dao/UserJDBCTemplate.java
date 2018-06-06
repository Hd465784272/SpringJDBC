package com.springdemo.blog.dao;

import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.springdemo.blog.po.Article;
import com.springdemo.blog.po.User;

public class UserJDBCTemplate implements UserDao{
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;
	
	@Override
	public void setDataSource(DataSource ds) {
		// TODO Auto-generated method stub
		this.dataSource = ds;
		this.jdbcTemplateObject = new JdbcTemplate(ds);
	}

	@Override
	public void create(String username, String pwd, String nickname, String question, String answer) {
		// TODO Auto-generated method stub
		String SQL = "insert into user(username,pwd,nickname,question,answer) values(?,?,?,?,?)";
		jdbcTemplateObject.update(SQL,username,pwd,nickname,question,answer);
//		System.out.println(SQL);
	}

	@Override
	public List<User> userLogin(String username, String pwd) {
		// TODO Auto-generated method stub
		String SQL = "select * from user WHERE username= ?  AND  pwd = ? ";
		List<User> list = jdbcTemplateObject.query(SQL, new Object[]{username,pwd}, new BeanPropertyRowMapper<User>(User.class));
		return list;
	}

	@Override
	public List<Article> readAllArticle(int initcount, int percount) {
		// TODO Auto-generated method stub
		String SQL = "Select * from Article where flag=0 limit ?, ?";
		List<Article> listArticle = jdbcTemplateObject.query(SQL,new Object[]{initcount,percount},
				new BeanPropertyRowMapper<Article>(Article.class));
		return listArticle;
	}

	@Override
	public List<Article> readArticleByCondition(int type ,int initcount ,int percount) {
		// TODO Auto-generated method stub
		String SQL = "Select title ,username,date from Article where flag = 0 and type = ? limit ?, ?";
		List<Article> list = jdbcTemplateObject.query(SQL, new Object[]{type,initcount,percount}, 
				new BeanPropertyRowMapper<Article>(Article.class));
		return list;
	}

	@Override
	public List<Article> recycle(int flag) {
		// TODO Auto-generated method stub
		String SQL = "Select title,username,date from Article where flag =?";
		List<Article> list = jdbcTemplateObject.query(SQL, new Object[]{flag},
				new BeanPropertyRowMapper<Article>(Article.class));
		return list;
	}
	
	@Override
	public boolean checkTheUsername(String username) {
		// TODO Auto-generated method stub
		String SQL ="Select * from user u where u.username=?";
		List<User> list = 
		jdbcTemplateObject.query(SQL, new Object[]{username}, new BeanPropertyRowMapper<User>(User.class));
		if(list.size() == 0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public void addArticle(int id, String title, String content, String username, Date date, Integer hasread, int flag,
			Integer type) {
		// TODO Auto-generated method stub
		String SQL = "insert into Article(id,title,content,username,date,hasread,flag,type)"
				+ " values(?,?,?,?,?,?,?,?)";
		jdbcTemplateObject.update(SQL, id,title,content,username,date,hasread,flag,type);
	}

	@Override
	public int PaginationCountNum() {
		// TODO Auto-generated method stub
		String Sql ="select * from Article";
		List<Article> list  = jdbcTemplateObject.query(Sql, new BeanPropertyRowMapper<Article>(Article.class));
		int countnum = list.size();
		return countnum;
	}

	@Override
	public int PaginationCountNumByType(Integer type) {
		// TODO Auto-generated method stub
		String Sql = "select * from Article where type = ?";
		List<Article> list = jdbcTemplateObject.query(Sql, new Object[]{type} ,new BeanPropertyRowMapper<Article>(Article.class));
		int countnum = list.size();
		return countnum;
	}
	
}
