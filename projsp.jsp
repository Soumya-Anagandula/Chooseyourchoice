<%@ page import="java.sql.*"%>
<%! public String course;%>
<% 
String email=request.getParameter("email");
String cmnt=request.getParameter("cmnt");

Cookie []cks=request.getCookies();
    int temp=0;
    for (int i = 0; i < cks.length; i++) 
    {
        if(cks[i].getName().equals("id"))
        {
            course=cks[i].getValue();
            temp=1;
        }  
    }   
    if(temp==0)
        out.println(" cookie error");
    out.println(course);

try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cyc","root","soumya");
    out.println("connected");
    Statement st=conn.createStatement();
    int i=st.executeUpdate("insert into "+course+"cmnt(email,cmnt) values('"+email+"','"+cmnt+"')");
    out.println("Data is successfully inserted!");
    }
    catch(Exception e)
    {
    System.out.print(e);
    e.printStackTrace();
    }
    String redirectURL = "http://localhost:8090/cyc/profile.jsp";
	response.sendRedirect(redirectURL);

%>