<%@ page import="java.sql.*"%>
<% 
String email=request.getParameter("email");
String cmnt=request.getParameter("cmnt");

try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cyc","root","soumya");
    out.println("connected");
    Statement st=conn.createStatement();
    int i=st.executeUpdate("insert into subprocmnt(email,cmnt) values('"+email+"','"+cmnt+"')");
    out.println("Data is successfully inserted!");
    }
    catch(Exception e)
    {
    System.out.print(e);
    e.printStackTrace();
    }
    String redirectURL = "http://localhost:8090/cyc/subpro.jsp";
    response.sendRedirect(redirectURL);

%>