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

    if(! isNull(request.getParameter("publisher")).trim().isEmpty())
    {
        value = isNull(request.getParameter("publisher")).trim();
    }

    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("select publisher from publishers");

    while(rs.next())
    {
        if(rs.isNull(getString("publisher")).indexOf(value) != -1)
        {
            match = rs.isNull(getString("publisher")).replace(value, "<strong>"+value+"</strong>");
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