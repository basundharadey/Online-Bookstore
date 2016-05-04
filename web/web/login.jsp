<%@include file="db_config.jsp" %>
<%
    PreparedStatement ps = con.prepareStatement("select * from members where username=? AND password=?");

    ps.setString(1, request.getParameter("username"));
    ps.setString(2, request.getParameter("password"));
            
    ResultSet rs = ps.executeQuery();

    while(rs.next())
    {
        session.setAttribute("username", rs.getString("username"));
    }

    ArrayList cart = new ArrayList();

    session.setAttribute("cart", cart);

    response.setStatus(301);
    response.setHeader( "Location", (String)session.getAttribute("filename"));
    response.setHeader( "Connection", "close" );
%>