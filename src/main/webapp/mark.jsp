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
			String s1=request.getParameter("roll");
			
			session.setAttribute("s1",s1);
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexamination","root","");
			Statement stm=conn.createStatement();
			ResultSet rs=stm.executeQuery("select * from result where roll='"+s1+"'");
			while(rs.next()){
				out.print("Name is "+rs.getString("name")+"</br>");
				out.print("roll number is "+rs.getString("roll")+"</br>");
				out.print("Marks is "+rs.getString("mark")+"</br>");
				out.print("Percentage is "+rs.getString("percentage")+"</br>");
				out.print("Result is "+rs.getString("result")+"</br>");
			}
			
			
		}
	catch(Exception e3){
		out.println(e3);
	}
	%>
	<a href="marks_homepage.html">Go back</a>
</body>
</html>