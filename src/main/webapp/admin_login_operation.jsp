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
		String s1=request.getParameter("username");
		String s2=request.getParameter("password");
		
		session.setAttribute("s1",s1);
		session.setAttribute("s2",s2);
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexamination","root","");
		Statement stm=conn.createStatement();
		
		String stat="";
		ResultSet rs=stm.executeQuery("select * from admin where username='"+s1+"' and password='"+s2+"'");
		if(rs.next()){
			response.sendRedirect("home_page.html");
		}
		else{
			out.print("Invalid username or password");
		}
	}
	catch(Exception e3){
		out.println(e3);
	}
	%>
</body>
</html>