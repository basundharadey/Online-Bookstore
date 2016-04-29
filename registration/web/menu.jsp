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
                			<a href="about.jsp" <%= isActive("about.jsp", filename, 0) %> ><span class="l"></span><span class="r"></span><span class="t">About Us</span></a>
                		</li>
                		<li>
                			<a href="services.jsp" <%= isActive("services.jsp", filename, 0) %> ><span class="l"></span><span class="r"></span><span class="t">Our Services</span></a>
                		</li>
                		<li>
                			<a href="franchise.jsp" <%= isActive("franchise.jsp", filename, 0) %> ><span class="l"></span><span class="r"></span><span class="t">Our Franchise</span></a>
                		</li>
                		<li>
                			<a href="benefits.jsp" <%= isActive("benefits.jsp", filename, 0) %> ><span class="l"></span><span class="r"></span><span class="t">Brand Benefits</span></a>
                		</li>
                		<li>
                			<a href="contact.jsp" <%= isActive("contact.jsp", filename, 0) %> ><span class="l"></span><span class="r"></span><span class="t">Contact Us</span></a>
                		</li>
                            </ul>
                        </div>
