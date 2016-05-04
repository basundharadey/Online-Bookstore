<%
    session.removeAttribute("username");
    session.removeAttribute("cart");
    response.setStatus(301);
    response.setHeader( "Location", (String)session.getAttribute("filename"));
    response.setHeader( "Connection", "close" );
%>