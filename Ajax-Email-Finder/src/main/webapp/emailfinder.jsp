<%@ page import="java.sql.*" %>
<%
String email=request.getParameter("email");
if(email.contains("@")&& email.contains(".")){
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://192.168.18.245:3306/javadb_167","javadb_167","ben#u62000");
PreparedStatement ps=con.prepareStatement("select * from emailrecord where email=?");
ps.setString(1,email);
ResultSet rs=ps.executeQuery();
if(rs.next()){
out.print("Unavailable! <img src='unchecked.gif'/>");
}else{
out.print("Available! <img src='checked.gif'/>");
}
}catch(Exception e){out.print(e);}
}else{
out.print("Invalid email!");
}
%>