<%!
    String isActive(String str, String filename, int side)
    {
	if (filename.equals(str))
	{
            if (side != 1)
            {
		return "class=\"active\"";
            }
            else
            {
		return "style=\"color: #09BDDC;\"";
            }
	}
        else
        {
            return null;
        }
    }
%>

                        <div class="deb-nav">
                            <div class="l"></div>
                            <div class="r"></div>
                            <ul class="deb-menu">

                        <%
                            if ( isNull((String)session.getAttribute("username")).equals("administrator") || isNull((String)session.getAttribute("username")).equals("admin") )
                            {
                        %>
                                <li>
                			<a href="home.jsp" <%= isActive("home.jsp", filename, 0) %> ><span class="l"></span><span class="r"></span><span class="t">Home</span></a>
                		</li>

                		<li>
                			<a href="books.jsp" <%= isActive("books.jsp", filename, 0) %> ><span class="l"></span><span class="r"></span><span class="t">Books</span></a>
                		</li>

                                <li>
                			<a href="authors.jsp" <%= isActive("authors.jsp", filename, 0) %> ><span class="l"></span><span class="r"></span><span class="t">Authors</span></a>
                		</li>

                                <li>
                			<a href="publishers.jsp" <%= isActive("publishers.jsp", filename, 0) %> ><span class="l"></span><span class="r"></span><span class="t">Publishers</span></a>
                		</li>

                                <li>
                			<a href="categories.jsp" <%= isActive("categories.jsp", filename, 0) %> ><span class="l"></span><span class="r"></span><span class="t">Categories</span></a>
                		</li>

                                <li>
                			<a href="sales.jsp" <%= isActive("sales.jsp", filename, 0) %> ><span class="l"></span><span class="r"></span><span class="t">Sales</span></a>
                		</li>

                                <li>
                			<a href="user.jsp" <%= isActive("user.jsp", filename, 0) %> ><span class="l"></span><span class="r"></span><span class="t">Users</span></a>
                		</li>
                        <%
                            }
                            else
                            {
                        %>
                                <li>
                			<a href="home.jsp" <%= isActive("home.jsp", filename, 0) %> ><span class="l"></span><span class="r"></span><span class="t">Home</span></a>
                		</li>

                		<li>
                			<a href="about.jsp" <%= isActive("about.jsp", filename, 0) %> ><span class="l"></span><span class="r"></span><span class="t">About Us</span></a>
                		</li>

                		<li>
                			<a href="contact.jsp" <%= isActive("contact.jsp", filename, 0) %> ><span class="l"></span><span class="r"></span><span class="t">Contact Us</span></a>
                		</li>
                        <%
                            }
                        %>
                            </ul>
                        </div>
