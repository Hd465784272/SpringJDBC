package com.springdemo.blog.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.springdemo.blog.dao.UserJDBCTemplate;
import com.springdemo.blog.po.Article;
import com.springdemo.blog.po.User;

@Controller
public class UserController {

	ApplicationContext context = new ClassPathXmlApplicationContext("dbconfig.xml");
	UserJDBCTemplate userJDBCTemplate = (UserJDBCTemplate) context.getBean("userJDBCTemplate");
	// 分页：每页10行
	static final int percount = 10;


	/**
	 * 
	 * @param req
	 * @param resp
	 * @return /userlogin 添加用戶
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value = "/adduser", method = RequestMethod.POST)
	public ModelAndView create(HttpServletRequest req, HttpServletResponse resp, User user ) throws UnsupportedEncodingException {
//		String username = new String(req.getParameter("username").getBytes("ISO-8859-1"), "UTF-8");
//		String pwd = new String(req.getParameter("pwd"));
//		String nickname = new String(req.getParameter("nickname"));
//		String question = new String(req.getParameter("question"));
//		String answer = new String(req.getParameter("answer"));
		
		String username = user.getUsername();
		String pwd = user.getPwd();
		String nickname = user.getNickname();
		String question = user.getQuestion();
		String answer = user.getAnswer();

		boolean flag = userJDBCTemplate.checkTheUsername(username);
		ModelAndView mav = null;
		if (flag == true) {
			// 判断该用户名可以使用，进行登陆。
			userJDBCTemplate.create(username, pwd, nickname, question, answer);
			mav = new ModelAndView("/views/Blog/login.jsp");
			String message = "注册成功，请登陆";
			mav.addObject("message", message);
		} else {
			// 判断该用户名已被占用，发送信息给注册页面。
			System.out.println("该账号已被占用。");
			mav = new ModelAndView("/views/Blog/register.jsp");
			String message = "该账号已被占用。";
			mav.addObject("message_username", message);
		}
		return mav;
	}

	/**
	 * 
	 * @param req
	 * @param resp
	 * @return /readall
	 */
	@RequestMapping(value = "/userlogin" , method = RequestMethod.POST )
	public ModelAndView userLogin(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		List<User> list = userJDBCTemplate.userLogin(req.getParameter("username"), req.getParameter("pwd"));
		ModelAndView mav = null;
		if (list.size() == 1) {
			session.setAttribute("username_session", req.getParameter("username"));
			// 成功登陆，则返回 /readallarticle
			mav = new ModelAndView("/readallarticle");
		} else {
			// 登陆失败，发送提示信息给login.jsp
			mav = new ModelAndView();
			mav.setViewName("/views/Blog/login.jsp");
			String message_pwd = "账号密码有误，请重新检查";
			mav.addObject("message", message_pwd);
		}
		return mav;
	}

	@RequestMapping(value = "/userlogout")
	public ModelAndView logout(HttpSession session) throws Exception {
		// 清除Session
		session.invalidate();
		ModelAndView mav = new ModelAndView("/readallarticle");
		return mav;
	}

	/**
	 * @return /views/blog.jsp 查询 所有文章，加载到页面
	 */
	@RequestMapping(value = "/readallarticle")
	public ModelAndView readAllArticle() {
		int type = 0;
		List<Article> listarticle = userJDBCTemplate.readAllArticle( 0 , percount);
		int listCount = userJDBCTemplate.PaginationCountNum();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/views/blog.jsp");
		mav.addObject("listarticle", listarticle);//查询到的List<Article>
		mav.addObject("listCount", listCount);//页码总数
		mav.addObject("percount", percount);//每页多少条
		mav.addObject("type", type);//标识
		mav.addObject("currentpage", 1);//当前页码
		return mav;
	}

	/**
	 * @param type(type类型 int)
	 * @return /views/blog.jsp 根据type查询处对应type的文章，加载到页面
	 */
	@RequestMapping(value = "/readarticlebycondition" )
	public ModelAndView readArticleByCondition(int type ,int initcount) {
		List<Article> listarticle = null ;
		int listCount = 0;
		if(type != 0){
			//type != 0 根据 type类型，查询文章
			listarticle = userJDBCTemplate.readArticleByCondition
					(type, (initcount-1)*percount, percount);
			listCount = userJDBCTemplate.PaginationCountNumByType(type);
		}else{
			//type = 0   就是查询所有文章
			listarticle = userJDBCTemplate.readAllArticle((initcount-1)*percount , percount);
			listCount = userJDBCTemplate.PaginationCountNum();
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/views/blog.jsp");
		mav.addObject("listarticle", listarticle);//查询到的List<Article>
		mav.addObject("listCount", listCount);//页码总数
		mav.addObject("percount", percount);//每页多少条
		mav.addObject("type", type);//标识
		mav.addObject("currentpage", initcount);//当前页码
		return mav;
	}
	
	/**
	 * 
	 * @param flag
	 * @return "/views/blog.jsp"
	 */
	@RequestMapping(value = "/recycle")
	public ModelAndView recycle(int flag) {
		List<Article> listarticle = userJDBCTemplate.recycle(flag);
		ModelAndView mav = new ModelAndView("/views/blog.jsp", "listarticle", listarticle);
		return mav;
	}

	@RequestMapping(value = "/addArticle")
	public ModelAndView addArticle(HttpServletRequest req, HttpServletResponse resp, HttpSession session)
			throws UnsupportedEncodingException {
		// mysql 主键自增，所以不用管主键，设为0或null,mysql会自己处理
		int id = 0;
		String title = new String(req.getParameter("title").getBytes("ISO-8859-1"), "UTF-8");
		String content = new String(req.getParameter("editorValue").getBytes("ISO-8859-1"), "UTF-8");
		String username = (String) req.getSession().getAttribute("username_session");
		Date date = new Date();
		int hasread = 0;
		int flag = 0;
		int type = Integer.parseInt(req.getParameter("type"));
		userJDBCTemplate.addArticle(id, title, content, username, date, hasread, flag, type);
		ModelAndView mav = new ModelAndView("/readallarticle");
		return mav;
	}

}
