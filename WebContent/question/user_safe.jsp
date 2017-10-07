<%@page import="java.io.IOException"%>
<%@page import="java.io.Writer"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User safe</title>
</head>
<%@include file="/header.jsp" %>
<%!

// 根据qid获取问题
Question getQuestionByQid(String qid)
{
	Question q = null;
	try {
		String sql = "select * from Question where qid = " + qid;
		state = conn.createStatement();
		resultSet = state.executeQuery(sql);
		if (resultSet.next()) {
			String question = resultSet.getString("question");
			String description = resultSet.getString("description");
			q = new Question(qid, question, description, null);
		}
// 		else {
// 			out.print("<script>alert('不存在的qid！');window.stop();</script>");
// 		}
	}
	catch (SQLException e) {
	}
	return q;
}

// 获取问题qid对应的所有codeDEX
List<CodeDEX> getCodeDEXByQid(String qid)
{
	List<CodeDEX> list = new ArrayList();
	try {
		String sql = "select cid from Question_CodeDEX where qid = " + qid;
		state = conn.createStatement();
		ResultSet resultSet_question = state.executeQuery(sql);
		while (resultSet_question.next()) {
			String cid = resultSet_question.getString("cid");
			sql = "select * from CodeDEX where cid = " + cid;
			ResultSet resultSet_codeDEX = state.executeQuery(sql);
			while (resultSet_codeDEX.next()) {
				//cid = resultSet_codeDEX.getString("cid");
				String question = resultSet_codeDEX.getString("question");
				String description = resultSet_codeDEX.getString("description");
				String solution = resultSet_codeDEX.getString("solution");
				String code = resultSet_codeDEX.getString("code");
				String link = resultSet_codeDEX.getString("link");
				CodeDEX codeDEX = new CodeDEX(cid, question, description, solution, code, link);
				list.add(codeDEX);
			}
		}
	}
	catch (SQLException e) {
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
String qid = request.getParameter("qid");
Question question = getQuestionByQid(qid);

if (null == question)
{
	out.print("<script>alert('不存在的qid！');</script>");
	return;
}
%>
<h2 id="这里是问题名字"><%=question.question %></h2>

<p><%=question.description%></p>

<ul>
<li><strong>属于这个问题的codeDEX</strong></li>
<%
List<CodeDEX> list = getCodeDEXByQid(qid);
Iterator<CodeDEX> iterator = list.iterator();
while (iterator.hasNext())
{
	CodeDEX codeDEX = iterator.next();
%>

<li><strong>
<a href="<%=codeDEX.link%>?cid=<%=codeDEX.cid%>" >
<%=codeDEX.question %>
</a></strong></li>

<%
}
%>
</ul>
</body>
</html>