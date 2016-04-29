<%@include file="db_config.jsp" %>

<%
    session.setAttribute("filename", filename);
    ArrayList errors = new ArrayList();
%>

<%!
    String isNull(String str)
    {
        if(str == null)
        {
            return "";
        }
        else
        {
            return str;
        }
    }
%>
