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

    if(! isNull(request.getParameter("isbn")).trim().isEmpty())
    {
        value = isNull(request.getParameter("isbn")).trim();
    }

    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("select isbn from books");

    while(rs.next())
    {
        if(isNull(rs.getString("isbn")).indexOf(value) != -1)
        {
            match = isNull(rs.getString("isbn")).replace(value, "<strong>"+value+"</strong>");
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