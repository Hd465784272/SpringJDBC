package com.mytest.springjdbc.test;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class StudentController {

	ApplicationContext context = new ClassPathXmlApplicationContext("dbconfig.xml");
	StudentJDBCTemplate studentJDBCTemplate = (StudentJDBCTemplate) context.getBean("studentJDBCTemplate");

	@RequestMapping("/test")
	public ModelAndView test(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("基于全注解、SpringJDBC的CRUD demo");
		return null;
	}

	@RequestMapping("/add")
	public ModelAndView add(HttpServletRequest req, HttpServletResponse resp) {
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String user =req.getParameter("user");
		int age = Integer.parseInt(req.getParameter("age"));
		studentJDBCTemplate.create(user, age);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/readall");
		return mv;
	}
	
	@RequestMapping("/readall")
	public ModelAndView readAll(HttpServletRequest req, HttpServletResponse resp) {
		List<Student> stlist = studentJDBCTemplate.listStudents();
		ModelAndView mv = new ModelAndView("/views/crud/readlist.jsp", "stlist",stlist);
		return mv;
	}
	@RequestMapping("/readbyname")
	public ModelAndView readByName(HttpServletRequest req, HttpServletResponse resp,
			ModelMap model) {
		String name = req.getParameter("name");
		Student stu = studentJDBCTemplate.getStudent(name);
		System.out.println(stu.toString());
		ModelAndView mv = new ModelAndView("/crud/readstu.jsp", "stlist",stu);
		return mv;
	}
	@RequestMapping("/deletebyid")
	public ModelAndView deleteById(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("基于全注解、SpringJDBC的 Delete demo");
		String id = req.getParameter("id");
		int inid =  Integer.parseInt(id);
		studentJDBCTemplate.delete(inid);
		List<Student> stlist = studentJDBCTemplate.listStudents();
		ModelAndView mv = new ModelAndView("/crud/readlist.jsp", "stlist",stlist);
		return mv;
	}
	@RequestMapping("/update")
	public ModelAndView update(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("基于全注解、SpringJDBC的 Delete demo");
		int id =  Integer.parseInt(req.getParameter("id"));
		int age = Integer.parseInt(req.getParameter("age"));
		studentJDBCTemplate.update(id, age);
		List<Student> stlist = studentJDBCTemplate.listStudents();
		ModelAndView mv = new ModelAndView("/crud/readlist.jsp", "stlist",stlist);
		return mv;
	}
}
