<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sun.corba.se.impl.oa.poa.AOMEntry"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
</head>
<%@include file="header.jsp" %>
<%!

// 获取所有的问题
List<Question> getAllQuestion()
{
	List<Question> list = new ArrayList();
	try {
		String sql = "select qid, link, question from Question;";
		state = conn.createStatement();
		resultSet = state.executeQuery(sql);
		while (resultSet.next()) {
			String qid = resultSet.getString("qid");
			String question = resultSet.getString("question");
			String link = resultSet.getString("link");
			list.add(new Question(qid, question, null, link));
		}
	}
	catch (SQLException e)
	{
	}
	return list;
}

//连接数据库
ResultSet resultSet = null;
Statement state = null;
Connection conn = null;
int resultInt;
boolean resultBoolean;
boolean connect(){
	String connectString = "jdbc:mysql://localhost:3306/company"
			+ "?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(connectString, "root", "");
	} catch (Exception e) {
		return false;
	}
	String sqlSentence = "select * from Question;";
	try {
		state = conn.createStatement();
		resultSet = state.executeQuery(sqlSentence);
	}
	catch (Exception e) {return false;}
	return true;
}
%>
<body>
<%
request.setCharacterEncoding("utf-8"); 
response.setContentType("text/html;charset=utf-8");
connect();
List<Question> list_question = getAllQuestion();
%>
<h1 id="codedex"><font face="微软雅黑">codeDEX</font></h1>

<p>将平时自己改的codeDEX进行总结。</p>

<ul>
<li><strong>这里显示问题的类别</strong></li>
<%
Iterator<Question> iterator = list_question.iterator();
while (iterator.hasNext())
{
	Question question = iterator.next();
%>
<li><strong>
<a href="<%=question.link%>?qid=<%=question.qid%>" >
<%
	out.print(question.question);
%>
</a>
</strong></li>
<%
}
%>
</ul>
</body>
</html>