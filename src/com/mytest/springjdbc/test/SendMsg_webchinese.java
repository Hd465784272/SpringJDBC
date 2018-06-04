package com.mytest.springjdbc.test;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

public class SendMsg_webchinese {

	public static void main(String[] args) throws Exception {

		HttpClient client = new HttpClient();
		PostMethod post = new PostMethod("http://gbk.api.smschinese.cn");
		post.addRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=gbk");// 在头文件中设置转码
		NameValuePair[] data = { new NameValuePair("Uid", "Hd465784272"),
				new NameValuePair("Key", "d41d8cd98f00b204e980"),
				new NameValuePair("smsMob", "17718380624"),
				new NameValuePair("smsText", "驗證碼：聽説驗證碼不審核。回來給我帶紅牛，url不能加") };
		post.setRequestBody(data);

		client.executeMethod(post);
		Header[] headers = post.getResponseHeaders();
		int statusCode = post.getStatusCode();
		System.out.println("statusCode:" + statusCode);
		for (Header h : headers) {
			System.out.println(h.toString());
		}
		String result = new String(post.getResponseBodyAsString().getBytes("gbk"));
		System.out.println(result); // 打印返回消息状态

		post.releaseConnection();

	}

}