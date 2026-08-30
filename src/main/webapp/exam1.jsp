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
			String roll=request.getParameter("roll");
			String ans1=request.getParameter("one");
			String ans2=request.getParameter("two");
			String ans3=request.getParameter("three");
			String ans4=request.getParameter("four");
			String ans5=request.getParameter("five");
			
			Statement stm,stm1,stm2,stm3,stm4,stm5,stm6,stm7;
			int ans=0;
			session.setAttribute("roll",roll);
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexamination","root","");
			stm=conn.createStatement();
			stm1=conn.createStatement();
			stm2=conn.createStatement();
			stm3=conn.createStatement();
			stm4=conn.createStatement();
			stm5=conn.createStatement();
			stm6=conn.createStatement();
			stm7=conn.createStatement();
			String name="";
			ResultSet rs=stm.executeQuery("select * from login where roll='"+roll+"'");
			if(rs.next()){
			    name=rs.getString("name");
			    ResultSet rs2=stm1.executeQuery("Select * from exam_ans where q_id=1");
			    String q1 = ""; // Initialize q1 here
			    while(rs2.next()){
			        q1=rs2.getString("ans");
			    }
			    if(q1.equals(ans1)){ // Use .equals() for string comparison
			        ans++;
			    }
			    ResultSet rs3=stm2.executeQuery("Select * from exam_ans where q_id=2");
			    String q2 = ""; // Initialize q2 here
			    while(rs3.next()){
			        q2=rs3.getString("ans");
			    }
			    if(q2.equals(ans2)){ // Use .equals() for string comparison
			        ans++;
			    }
			    ResultSet rs4=stm3.executeQuery("Select * from exam_ans where q_id=3");
			    String q3 = ""; // Initialize q3 here
			    while(rs4.next()){
			        q3=rs4.getString("ans");
			    }
			    if(q3.equals(ans3)){ // Use .equals() for string comparison
			        ans++;
			    }
			    ResultSet rs5=stm4.executeQuery("Select * from exam_ans where q_id=4");
			    String q4 = ""; // Initialize q4 here
			    while(rs5.next()){
			        q4=rs5.getString("ans");
			    }
			    if(q4.equals(ans4)){ // Use .equals() for string comparison
			        ans++;
			    }
			    ResultSet rs6=stm5.executeQuery("Select * from exam_ans where q_id=5");
			    String q5 = ""; // Initialize q5 here
			    while(rs6.next()){
			        q5=rs6.getString("ans");
			    }
			    if(q5.equals(ans5)){ // Use .equals() for string comparison
			        ans++;
			    }
			    String res="";
			    double result;
			    int mark=ans*10;
			    result=(ans/5.0)*100; // Convert one operand to double for correct division
			    out.println("Marks out of 50: "+mark);
			    out.println("Percentage is: "+result);
			    if(result>35){
			        res="Pass";
			        out.println("Pass!!");
			    }
			    else{
			        res="Fail";
			        out.println("Fail!!");
			    }

			    String sql="insert into result values ('"+name+"','"+roll+"',"+mark+","+result+",'"+res+"')"; // Corrected SQL syntax
			    int k=stm.executeUpdate(sql);
			    if(k>0){
			        out.println("Save successfully");
			    }
			    else{
			        out.print("Invalid data");
			    }
			}
			else{
				out.print("Invalid Roll Number");
			}
		}
		catch(Exception e2){
			out.print(e2);
		}
	%>
	
</body>
</html>