<%@ page import="java.sql.*"%>
<%!    public String course,pic,ne; %>
<% 
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cyc","root","soumya");
    Cookie []cks=request.getCookies();
    int temp=0;
    for (int i = 0; i < cks.length; i++) 
    {
        if(cks[i].getName().equals("id"))
        {
            course=cks[i].getValue();
            temp=1;
        }  
        else if(cks[i].getName().equals("im"))
        {
            pic=cks[i].getValue();
            temp=1;
        }
    }   
    if(temp==0)
        out.println(" cookie error");
    Statement st=conn.createStatement();
    String sql1 ="select * from introduction";
    String sql2 ="select * from "+course;
    String sql3 ="select * from "+course+"cmnt";

    %>
<html>
    <head>
        <title>profile</title>
        <link rel="stylesheet" type="text/css" href="profile.css">
    </head>
    <body>
        <script src="profile.js"></script>
        <div class="hdr">
            <img src="./img/logo1.png" alt="logo" width="80px" height="60px"/>
                
                <div class="hdr2">
                    <h1>Choose Your Choice</h1>
                        <div class="hdr3">
                            <label>--The best way to predict the future is to create it.    </label>
                        </div>
                </div>
        </div>
        <div class="card">
            <div class="card1">
                <div class="img">
                    <img src="<% out.println(pic);%>" alt="error" width="80%" height="100%">
                </div>
                
            </div>
            <div class="card2">
                <div class="intro">
                    <br><br>
                    <label>
                    <%
                        ResultSet rs1 = st.executeQuery(sql1);
                        while(rs1.next()){
                            if(rs1.getString("courses").equals(course))
                            {
                                out.println(rs1.getString("intro"));
                            }
                        }
                    %>                                          
                    </label>
                </div>
                <div class="hng">
                    <label> COURSES UNDER THIS COURSE </label>
                    <br>
                    <br>
    
                </div>
                <%
                    ResultSet rs2 = st.executeQuery(sql2);
                    while(rs2.next()){
                        ne= rs2.getString("cnames");
                %>
                <div class="types">
                    <div class="lb" id="t<%= rs2.getString("sno")%>" onclick='sub(this.id,"<%= ne%>")'>
                        <label><%= rs2.getString("cnames")%></label>
                    </div>
                    
                </div>
                <%
                    }%>
                
                <div class="hng2">

                    <label>Discuss about this course:</label>
                </div>
                
                <%
                    ResultSet rs3 = st.executeQuery(sql3);
                    while(rs3.next()){

                    %>
                <div class="discuss">
                    <div class="dis" id="d<%= rs3.getString("sno")%>">
                        <img src="./img/avtr1.jpg" alt="Avatar" class="avtr" style="width:40px;height:40px;">
                        <span>  <h3><%= rs3.getString("email")%></h3></span>
                        
                    </div>
                    <hr style="width: 100%;text-align:left;margin-left:0;opacity:0.50;">
                    <label> <%= rs3.getString("cmnt")%></label>
                </div>   
                <% 
                    }
                    %>
                <div class="review">
                    <div class="opa">
                        <label>Share your experience:</label>
                    </div>
                    <form name="frm" action="projsp.jsp" method="post" id="commentform">
                        <div class="frm">
                            <div class="lbl">
                                <label >Your email:</label><br><br>
                                <label >comment:</label>
                            </div>
                            <div class="tb">
                                <input type="email" name="email" id="email" value="" placeholder="enter your email"><br>
                                <textarea id="comment" name="cmnt" rows="5" cols="40" placeholder=" enter your experience"></textarea><br>
                            </div>
                        </div>
                        <div class="btn">
                            <button type="submit" onclick="return don()">
                                POST
                            </button>
                        </div>
                    </form>
                </div>
    
            </div>
        </div>
        <div class="footer">
            <div class="ftr">
                <p> If you are intrested to Share about this course </p>
                <h2>contact</h2>
                <h3>7093531565</h3>
                <h3>soumyaanagandula20@gmail.com</h3>
            </div>
        </div>    
    </body>
</html>