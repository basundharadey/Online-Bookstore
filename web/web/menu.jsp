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
                		<li>
                			<a href="home.jsp" <%= isActive("home.jsp", filename, 0) %> ><span class="l"></span><span class="r"></span><span class="t">Home</span></a>
                		</li>
                		<li>
                			<a href="about.jsp" <%= isActive("contact us.jsp", filename, 0) %> ><span class="l"></span><span class="r"></span><span class="t">Contact Us</span></a>
                		</li>

                		<li>
                			<a href="contact.jsp" <%= isActive("cart.jsp", filename, 0) %> ><span class="l"></span><span class="r"></span><span class="t">Cart</span></a>
                		</li>
                            </ul>
                        </div>
