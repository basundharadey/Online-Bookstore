<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US" xml:lang="en">
<head>
	
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <meta http-equiv="desciption" content="Job Consultancy" />
    <meta http-equiv="keywords" content="Job Consultancy, Infinite Aspirations" />
    <meta http-equiv="authors" content="Debashis Biswas (gotechwithme@gmail.com) - Techbridge Consultants" />
    
    <title>Online Book Shop</title>

    <script type="text/javascript" src="script.js"></script>

    <!-- <script type="text/javascript" src="mootools.js"></script> -->
    <!-- <script type="text/javascript" src="slide.js"></script> -->
    <script type="text/javascript" src="prototype/prototype.js"></script>
    <script type="text/javascript" src="prototype/scriptaculous.js"></script>

    <!-- link calendar files  -->
    <script type="text/javascript" src="calendar_eu.js"></script>
    <link rel="stylesheet" href="calendar.css"  type="text/css" media="screen" />

    <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
    <!--[if IE 6]><link rel="stylesheet" href="style.ie6.css" type="text/css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" href="style.ie7.css" type="text/css" media="screen" /><![endif]-->
</head>

<body>
    <div id="deb-page-background-simple-gradient"></div>
    
    <div id="deb-page-background-glare">
        <div id="deb-page-background-glare-image"></div>
    </div>
    
    <div id="deb-main">
        <div class="deb-Sheet">
            <div class="deb-Sheet-tl"></div>
            <div class="deb-Sheet-tr"></div>
            <div class="deb-Sheet-bl"></div>
            <div class="deb-Sheet-br"></div>
            <div class="deb-Sheet-tc"></div>
            <div class="deb-Sheet-bc"></div>
            <div class="deb-Sheet-cl"></div>
            <div class="deb-Sheet-cr"></div>
            <div class="deb-Sheet-cc"></div>
            <div class="deb-Sheet-body">
                <div class="deb-Header">
                    <div class="deb-Header-jpeg"></div>
                </div>
                
                <%@include file="menu.jsp" %>
                
				<div class="deb-contentLayout">
				
            <%
            	if(!errors.isEmpty())
            	{
            %>	
            		<div class="deb-Block">
                            <div class="deb-Block-tl"></div>
                            <div class="deb-Block-tr"></div>
                            <div class="deb-Block-bl"></div>
                            <div class="deb-Block-br"></div>
                            <div class="deb-Block-tc"></div>
                            <div class="deb-Block-bc"></div>
                            <div class="deb-Block-cl"></div>
                            <div class="deb-Block-cr"></div>
                            <div class="deb-Block-cc"></div>
                            <div class="deb-Block-body">
                    		
                    		<%
                                    Iterator err = errors.iterator();
                                    while(err.hasNext())
                                    {
                                    %>
                    			<p style="text-align: center; color: red;" ><%= (String)err.next() %></p>
                                    <%
                                    }
                    		%>
                    		        		
                            </div>
                   	</div>
            <% 
            	}
            %>
                    		
                    <div class="deb-sidebar1">
                        <div class="deb-Block">
                            <div class="deb-Block-tl"></div>
                            <div class="deb-Block-tr"></div>
                            <div class="deb-Block-bl"></div>
                            <div class="deb-Block-br"></div>
                            <div class="deb-Block-tc"></div>
                            <div class="deb-Block-bc"></div>
                            <div class="deb-Block-cl"></div>
                            <div class="deb-Block-cr"></div>
                            <div class="deb-Block-cc"></div>
                            <div class="deb-Block-body">
                                <div class="deb-BlockHeader">
                                    <div class="l"></div>
                                    <div class="r"></div>
                                    <div class="deb-header-tag-icon">
                                        <div class="t">
                                        	Member's Login
                                        </div>
                                    </div>
                                </div>
                                <p></p>
          		<% 
                            if (session.getAttribute("username") != null)
                            {
                        %>
                                <div class="deb-BlockContent">
                                    <div class="deb-BlockContent-tl"></div>
                                    <div class="deb-BlockContent-tr"></div>
                                    <div class="deb-BlockContent-bl"></div>
                                    <div class="deb-BlockContent-br"></div>
                                    <div class="deb-BlockContent-tc"></div>
                                    <div class="deb-BlockContent-bc"></div>
                                    <div class="deb-BlockContent-cl"></div>
                                    <div class="deb-BlockContent-cr"></div>
                                    <div class="deb-BlockContent-cc"></div>
                                    <div class="deb-BlockContent-body">
                                        <div>
                                            <p>
                                                Welcome <a href="#" style="color: green;">
                                                            <%= (String)session.getAttribute("username") %>
                                        	 	</a>
                                            </p>
                                            Click here to <a href="logout.jsp"> Logout </a>
                                        </div>
                                    </div>
                                </div>
                        <%
                            }
                            else
                            {
                     	%>
                        		<div class="deb-BlockContent">
                                    <div class="deb-BlockContent-tl"></div>
                                    <div class="deb-BlockContent-tr"></div>
                                    <div class="deb-BlockContent-bl"></div>
                                    <div class="deb-BlockContent-br"></div>
                                    <div class="deb-BlockContent-tc"></div>
                                    <div class="deb-BlockContent-bc"></div>
                                    <div class="deb-BlockContent-cl"></div>
                                    <div class="deb-BlockContent-cr"></div>
                                    <div class="deb-BlockContent-cc"></div>
                                    <div class="deb-BlockContent-body">
                                        <div>
                                        	<form method="post" id="loginform" action="login.jsp">
                                        		<input type="text" value="username" name="username" id="username" style="width: 90%; color: graytext; padding-left: 10px;" onfocus="if(this.value == 'username'){ this.value=''; }" onblur="if(this.value == ''){ this.value='username'; }" />
                                        		<input type="password" value="password" name="password" id="password" style="width: 90%; margin-top: 2px; color: graytext; padding-left: 10px;" onfocus="if(this.value == 'password'){ this.value=''; }" onblur="if(this.value == ''){ this.value='password'; }" />
                                        		<span class="deb-button-wrapper" style="margin-top: 3px;" >
                                        			<span class="l"> </span>
                                        			<span class="r"> </span>
                                        			<input class="deb-button" type="submit" name="submit" value="Login" />
                                        		</span>
                                        	</form>
                                        </div>
                                    </div>
                                </div>
                           		
                           		<p></p>
                                
                                <div class="deb-BlockContent">
                                    <div class="deb-BlockContent-tl"></div>
                                    <div class="deb-BlockContent-tr"></div>
                                    <div class="deb-BlockContent-bl"></div>
                                    <div class="deb-BlockContent-br"></div>
                                    <div class="deb-BlockContent-tc"></div>
                                    <div class="deb-BlockContent-bc"></div>
                                    <div class="deb-BlockContent-cl"></div>
                                    <div class="deb-BlockContent-cr"></div>
                                    <div class="deb-BlockContent-cc"></div>
                                    <div class="deb-BlockContent-body">
                                        <div>
                                            Click here for <a href="registration.jsp"> Registration </a>
                                            <br />
                                            Click if you <a href="forgot.jsp"> Forgot Password </a>
                                        </div>
                                    </div>
                                </div>
                  	<% 
                            }
                       	%>
                       	
 
                            </div>
                        </div>
                        
                        <div class="deb-Block">
                            <div class="deb-Block-tl"></div>
                            <div class="deb-Block-tr"></div>
                            <div class="deb-Block-bl"></div>
                            <div class="deb-Block-br"></div>
                            <div class="deb-Block-tc"></div>
                            <div class="deb-Block-bc"></div>
                            <div class="deb-Block-cl"></div>
                            <div class="deb-Block-cr"></div>
                            <div class="deb-Block-cc"></div>
                            <div class="deb-Block-body">
                                <div class="deb-BlockHeader">
                                    <div class="l"></div>
                                    <div class="r"></div>
                                    <div class="deb-header-tag-icon">
                                        <div class="t">
                                        	Important Links
                                        </div>
                                    </div>
                                </div>
                                <p></p>
                                
                                <div class="deb-BlockContent">
                                    <div class="deb-BlockContent-tl"></div>
                                    <div class="deb-BlockContent-tr"></div>
                                    <div class="deb-BlockContent-bl"></div>
                                    <div class="deb-BlockContent-br"></div>
                                    <div class="deb-BlockContent-tc"></div>
                                    <div class="deb-BlockContent-bc"></div>
                                    <div class="deb-BlockContent-cl"></div>
                                    <div class="deb-BlockContent-cr"></div>
                                    <div class="deb-BlockContent-cc"></div>
                                    <div class="deb-BlockContent-body">
                                        <div>
                                        	 	<ul>
                                        	 		<li> <a href="browse.jsp" <%= isActive("browse.jsp", filename, 1) %> > Browse Books </a> </li>
                                                                <li> <a href="cart.jsp" <%= isActive("cart.jsp", filename, 1) %> > View Cart </a> </li>
                                        	 	</ul>
                                        </div>
                                    </div>
                                </div>
                        
                            </div>
                        </div>
                        
                    </div>