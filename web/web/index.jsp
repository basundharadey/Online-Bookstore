<%
    response.setStatus(301);
    response.setHeader( "Location", "home.jsp");
    response.setHeader( "Connection", "close" );
%>