package com.springdemo.blog.po;
// Generated 2017-5-31 22:29:41 by Hibernate Tools 5.2.0.Beta1

/**
 * Bloginfo generated by hbm2java
 */
public class Bloginfo implements java.io.Serializable {

	private String username;
	private String blogtitle;
	private String idiopraph;

	public Bloginfo() {
	}

	public Bloginfo(String username) {
		this.username = username;
	}

	public Bloginfo(String username, String blogtitle, String idiopraph) {
		this.username = username;
		this.blogtitle = blogtitle;
		this.idiopraph = idiopraph;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getBlogtitle() {
		return this.blogtitle;
	}

	public void setBlogtitle(String blogtitle) {
		this.blogtitle = blogtitle;
	}

	public String getIdiopraph() {
		return this.idiopraph;
	}

	public void setIdiopraph(String idiopraph) {
		this.idiopraph = idiopraph;
	}

}
