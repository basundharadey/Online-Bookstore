<%
    session.removeAttribute("username");
    response.setStatus(301);
    response.setHeader( "Location", (String)session.getAttribute("filename"));
    response.setHeader( "Connection", "close" );
%>