<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	try{
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String pass=request.getParameter("password");
		String roll=request.getParameter("roll");
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexamination","root","");
		String sql="insert into login values('"+email+"','"+pass+"','"+name+"','"+roll+"')";
		Statement stm=conn.createStatement();
		int k=stm.executeUpdate(sql);
		if(k>0){
			out.println("Save successfully");
		}
		else{
			out.print("Invalid data");
		}
	}
	catch(Exception e3){
		out.print(e3);
	}
	%>
	<a href="home_page.html">Go back</a>
</body>
</html>