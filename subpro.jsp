<%@ page import="java.sql.*"%>
<%! public String course,n;%>
<% 
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cyc","root","soumya");

    Cookie []ck=request.getCookies();
    int temp=0;
    for (int i = 0; i < ck.length; i++) 
    {
        if(ck[i].getName().equals("nme"))
        {

            n=ck[i].getValue( );
            temp=1;

        }  
    }   
    if(temp==0)
    {
        out.println("cookie error");
    }
    Statement st=conn.createStatement();
    String sql3 ="select * from subprocmnt";
%>

<html>
    <head>
        <title>profile</title>
        <link rel="stylesheet" type="text/css" href="subpro.css">
    </head>
    <body>
        <script src="subpro.js"></script>
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
            <div class="hd">
                <label><%=n%></label>
            </div>
            <div class="intro">
                 <label>intro about <%=n%></label>
            </div>
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
                    <span><h3><%= rs3.getString("email")%> </h3></span>
                    
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
                <form name="frm" action="subprojsp.jsp" method="post" id="commentform">
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