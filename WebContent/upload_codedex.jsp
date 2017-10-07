<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>提交问题</title>
</head>
<link rel="stylesheet" href="CSS/form.css" type="text/css" />
<body>
<!-- 提交codeDEX，提交的内容包括：名字、描述、解决方式、代码 -->
<form action="upload.jsp" method="post" class="white-pink">
<h1>Contact Form
<span>Please fill all the texts in the fields.</span>
</h1>
<label>
<span>Your Name :</span>
<input id="name" type="text" name="name" placeholder="Your Full Name" />
</label>
<label>
<span>Your Email :</span>
<input id="email" type="email" name="email" placeholder="Valid Email Address" />
</label>
<label>
<span>Message :</span>
<textarea id="message" name="message" placeholder="Your Message to Us"></textarea>
</label>
<label>
<span>Subject :</span><select name="selection">
<option value="Job Inquiry">Job Inquiry</option>
<option value="General Question">General Question</option>
</select>
</label>
<label>
<span>&nbsp;</span>
<input type="button" class="button" value="Send" />
</label>
</form>
</body>
</html>