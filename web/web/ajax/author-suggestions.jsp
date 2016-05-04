<%@include file="../db_config.jsp" %>

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

<%
    ArrayList matches = new ArrayList();
    String value = "";
    String match = "";

    if(! isNull(request.getParameter("author1")).trim().isEmpty())
    {
        value = isNull(request.getParameter("author1")).trim();
    }

    if(! isNull(request.getParameter("author2")).trim().isEmpty())
    {
        value = isNull(request.getParameter("author2")).trim();
    }

    if(! isNull(request.getParameter("author3")).trim().isEmpty())
    {
        value = isNull(request.getParameter("author3")).trim();
    }

    if(! isNull(request.getParameter("author4")).trim().isEmpty())
    {
        value = isNull(request.getParameter("author4")).trim();
    }

    if(! isNull(request.getParameter("author5")).trim().isEmpty())
    {
        value = isNull(request.getParameter("author5")).trim();
    }

    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("select author from authors");

    while(rs.next())
    {
        if(isNull(rs.getString("author")).indexOf(value) != -1)
        {
            match = isNull(rs.getString("author")).replace(value, "<strong>"+value+"</strong>");
            matches.add("<li>"+match+"</li>\n");
        }
    }

    Iterator it = matches.iterator();
%>
<ul>
    <%
        while(it.hasNext())
        {
           %>
           <%= (String)it.next() %>
           <%
        }
    %>
</ul>