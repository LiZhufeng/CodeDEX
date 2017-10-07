<%@page import="com.sun.corba.se.impl.oa.poa.AOMEntry"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%!
// 定义Class实体
class Question{
	public String qid;
	public String question;
	public String description;
	public String link;
	
	public Question(String qid, String question, String description, String link)
	{
		this.qid = qid;
		this.question = question;
		this.description = description;
		this.link = link;
	}
}

class CodeDEX{
	public String cid;
	public String question;
	public String description;
	public String solution;
	public String code;
	public String link;
	public CodeDEX(String cid, String question, String description, 
			String solution, String code, String link)
	{
		this.cid = cid;
		this.question = question;
		this.description = description;
		this.solution = solution;
		this.code = code;
		this.link = link;
	}
}
%>

</html>