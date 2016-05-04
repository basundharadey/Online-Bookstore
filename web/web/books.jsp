<%
    String filename = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/")+1);
%>

<%@include file="pre_header.jsp" %>

<%
    if ( !(isNull((String)session.getAttribute("username")).equals("administrator") || isNull((String)session.getAttribute("username")).equals("admin")) )
    {
        response.setStatus(301);
        response.setHeader( "Location", "home.jsp");
        response.setHeader( "Connection", "close" );
    }

    if( request.getParameter("add") != null )
    {
        if( isNull(request.getParameter("isbn")).trim().isEmpty())
        {
            errors.add("ISBN cannot be left blank.");
        }

        if( isNull(request.getParameter("title")).trim().isEmpty())
        {
            errors.add("Title cannot be left blank.");
        }

        if( isNull(request.getParameter("author1")).trim().isEmpty())
        {
            errors.add("Author 1 cannot be left blank.");
        }

        if( isNull(request.getParameter("publisher")).trim().isEmpty())
        {
            errors.add("Publisher cannot be left blank.");
        }

        try
        {
            Float.parseFloat(isNull(request.getParameter("selling_price")).trim());
        }
        catch(Exception e)
        {
            errors.add("Must provide a valid value for Selling Price.");
        }

        try
        {
            Float.parseFloat(isNull(request.getParameter("discount_offered")).trim());
        }
        catch(Exception e)
        {
            errors.add("Must provide a valid value for Discount Offered.");
        }

        try
        {
            Integer.parseInt(isNull(request.getParameter("publication_year")).trim());
        }
        catch(Exception e)
        {
            errors.add("Must provide a valid value for Year of Publication.");
        }

        try
        {
            Integer.parseInt(isNull(request.getParameter("edition")).trim());
        }
        catch(Exception e)
        {
            errors.add("Must provide a valid value for Edition.");
        }

        try
        {
            Integer.parseInt(isNull(request.getParameter("volume")).trim());
        }
        catch(Exception e)
        {
            errors.add("Must provide a valid value for Volume.");
        }

        if( !(isNull(request.getParameter("book_type")).trim().equals("paperback")) && !(isNull(request.getParameter("book_type")).trim().equals("hardbound")) )
        {
            errors.add("Must provide a valid Book Type.");
        }

        try
        {
            Integer.parseInt(isNull(request.getParameter("quantity")).trim());
        }
        catch(Exception e)
        {
            errors.add("Must provide a valid value for Quantity.");
        }

        if ( errors.size() == 0 )
        {
            int author1=1, author2=1, author3=1, author4=1, author5=1;
            int x;
            
            PreparedStatement ps = con.prepareStatement("select * from authors where author=?");
            PreparedStatement ps2 = con.prepareStatement("insert into authors(author) values(?)");

            ps.setString(1, isNull(request.getParameter("author1")).trim());
            
            ResultSet rs = ps.executeQuery();

            if(rs.next())
            {
                author1 = rs.getInt("id");
            }
            else
            {
                ps2.setString(1, isNull(request.getParameter("author1")).trim());
                x = ps2.executeUpdate();

                if(x != 1)
                {
                    errors.add("An error occured while processing your request(author1).");
                }

                ps.setString(1, isNull(request.getParameter("author1")).trim());
                rs = ps.executeQuery();

                if(rs.next())
                {
                    author1 = rs.getInt("id");
                }
            }

            ps.setString(1, isNull(request.getParameter("author2")).trim());
            rs = ps.executeQuery();

            if(rs.next())
            {
                author2 = rs.getInt("id");
            }
            else    if(! isNull(request.getParameter("author2")).trim().isEmpty())
                    {
                        ps2.setString(1, isNull(request.getParameter("author2")).trim());
                        x = ps2.executeUpdate();

                        if(x != 1)
                        {
                            errors.add("An error occured while processing your request(author2).");
                        }

                        ps.setString(1, isNull(request.getParameter("author2")).trim());
                        rs = ps.executeQuery();

                        if(rs.next())
                        {
                            author2 = rs.getInt("id");
                        }
                    }
                    else
                    {
                        author2 = 1;
                    }

            ps.setString(1, isNull(request.getParameter("author3")).trim());
            rs = ps.executeQuery();

            if(rs.next())
            {
                author3 = rs.getInt("id");
            }
            else    if(! isNull(request.getParameter("author3")).trim().isEmpty())
                    {
                        ps2.setString(1, isNull(request.getParameter("author3")).trim());
                        x = ps2.executeUpdate();

                        if(x != 1)
                        {
                            errors.add("An error occured while processing your request(author3).");
                        }

                        ps.setString(1, isNull(request.getParameter("author3")).trim());
                        rs = ps.executeQuery();

                        if(rs.next())
                        {
                            author3 = rs.getInt("id");
                        }
                    }
                    else
                    {
                        author3 = 1;
                    }

            ps.setString(1, isNull(request.getParameter("author4")).trim());
            rs = ps.executeQuery();

            if(rs.next())
            {
                author4 = rs.getInt("id");
            }
            else    if(! isNull(request.getParameter("author4")).trim().isEmpty())
                    {
                        ps2.setString(1, isNull(request.getParameter("author4")).trim());
                        x = ps2.executeUpdate();

                        if(x != 1)
                        {
                            errors.add("An error occured while processing your request(author4).");
                        }

                        ps.setString(1, isNull(request.getParameter("author4")).trim());
                        rs = ps.executeQuery();

                        if(rs.next())
                        {
                            author4 = rs.getInt("id");
                        }
                    }
                    else
                    {
                        author4 = 1;
                    }

            ps.setString(1, isNull(request.getParameter("author5")).trim());
            rs = ps.executeQuery();

            if(rs.next())
            {
                author5 = rs.getInt("id");
            }
            else    if(! isNull(request.getParameter("author5")).trim().isEmpty())
                    {
                        ps2.setString(1, isNull(request.getParameter("author5")).trim());
                        x = ps2.executeUpdate();

                        if(x != 1)
                        {
                            errors.add("An error occured while processing your request(author5).");
                        }

                        ps.setString(1, isNull(request.getParameter("author5")).trim());
                        rs = ps.executeQuery();

                        if(rs.next())
                        {
                            author5 = rs.getInt("id");
                        }
                    }
                    else
                    {
                        author5 = 1;
                    }


            int publisher=0;

            ps = con.prepareStatement("select * from publishers where publisher=?");
            ps2 = con.prepareStatement("insert into publishers(publisher) values(?)");

            ps.setString(1, isNull(request.getParameter("publisher")).trim());
            rs = ps.executeQuery();

            if(rs.next())
            {
                publisher = rs.getInt("id");
            }
            else
            {
                ps2.setString(1, isNull(request.getParameter("publisher")).trim());
                x = ps2.executeUpdate();

                if(x != 1)
                {
                    errors.add("An error occured while processing your request(publisher).");
                }

                ps.setString(1, isNull(request.getParameter("publisher")).trim());
                rs = ps.executeQuery();

                if(rs.next())
                {
                    publisher = rs.getInt("id");
                }
            }


            if(errors.size() == 0)
            {
                ps = con.prepareStatement("insert into books values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

                ps.setString(1, isNull(request.getParameter("isbn")).trim());
                ps.setString(2, isNull(request.getParameter("title")).trim());
                ps.setInt(3, author1);
                ps.setInt(4, author2);
                ps.setInt(5, author3);
                ps.setInt(6, author4);
                ps.setInt(7, author5);
                ps.setInt(8, publisher);
                ps.setFloat(9, Float.parseFloat(isNull(request.getParameter("selling_price")).trim()));
                ps.setFloat(10, Float.parseFloat(isNull(request.getParameter("discount_offered")).trim()));
                ps.setInt(11, Integer.parseInt(isNull(request.getParameter("publication_year")).trim()));
                ps.setInt(12, Integer.parseInt(isNull(request.getParameter("edition")).trim()));
                ps.setInt(13, Integer.parseInt(isNull(request.getParameter("volume")).trim()));
                ps.setString(14, isNull(request.getParameter("book_type")).trim());
                ps.setInt(15, Integer.parseInt(isNull(request.getParameter("quantity")).trim()));
                ps.setString(16, isNull(request.getParameter("freeRTE_content")).trim());
                ps.setString(17, "");
                ps.setString(18, "");

                x = ps.executeUpdate();

                if( x != 1)
                {
                    errors.add("An error occured while processing your request.");
                }
            }
        }
    }
%>

<%@include file="header.jsp" %>
            		<div class="deb-content">
                        <div class="deb-Post">
                            <div class="deb-Post-tl"></div>
                            <div class="deb-Post-tr"></div>
                            <div class="deb-Post-bl"></div>
                            <div class="deb-Post-br"></div>
                            <div class="deb-Post-tc"></div>
                            <div class="deb-Post-bc"></div>
                            <div class="deb-Post-cl"></div>
                            <div class="deb-Post-cr"></div>
                            <div class="deb-Post-cc"></div>
                            <div class="deb-Post-body">


                        	<div class="deb-Post-inner">

                                	<h2 class="deb-PostHeader">
                                		Add/Update/Delete Books
                                        </h2>

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

                                            <div class="deb-PostContent">

                                        <%
                                            if ((request.getParameter("add") != null) && (errors.size() == 0))
                                            {
                                            %>
                                                <p> Book successfully added to the Database. </p>
                                            <%
                                            }
                                            else
                                            {
                                        %>
                                        	<form name="books_form" action="books.jsp" method="post" >
                                        		<table>
                                        			<tr>
                                        				<td colspan="2">
                                                                            <b>Basic Information</b>
                                        				</td>
                                        			</tr>

                                        			<tr>
                                        				<td colspan="2">
                                                                            <hr/>
                                        				</td>
                                        			</tr>

                                        			<tr>
                                        				<td>
                                        					ISBN
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="isbn" id="isbn" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(request.getParameter("isbn")) %>" /> <span style="color: red;" > * </span>
                                                                                <br />
                                                                                <div id="isbn_suggestions" class="suggestions" style="display: none;"> </div>
                                        				</td>
                                        			</tr>

                                                                <tr>
                                        				<td>
                                        					Title
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="title" id="title" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(request.getParameter("title")) %>" /> <span style="color: red;" > * </span>
                                        				</td>
                                        			</tr>

                                                                <tr>
                                        				<td>
                                        					Author 1
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="author1" id="author1" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(request.getParameter("author1")) %>" /> <span style="color: red;" > * </span>
                                                                                <br />
                                                                                <div id="author1_suggestions" class="suggestions" style="display: none;"> </div>
                                        				</td>
                                        			</tr>

                                                                <tr>
                                        				<td>
                                        					Author 2
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="author2" id="author2" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(request.getParameter("author2")) %>" />
                                                                                <br />
                                                                                <div id="author2_suggestions" class="suggestions" style="display: none;"> </div>
                                        				</td>
                                        			</tr>

                                                                <tr>
                                        				<td>
                                        					Author 3
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="author3" id="author3" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(request.getParameter("author3")) %>" />
                                                                                <br />
                                                                                <div id="author3_suggestions" class="suggestions" style="display: none;"> </div>
                                        				</td>
                                        			</tr>

                                                                <tr>
                                        				<td>
                                        					Author 4
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="author4" id="author4" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(request.getParameter("author4")) %>" />
                                                                                <br />
                                                                                <div id="author4_suggestions" class="suggestions" style="display: none;"> </div>
                                        				</td>
                                        			</tr>

                                                                <tr>
                                        				<td>
                                        					Author 5
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="author5" id="author5" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(request.getParameter("author5")) %>" />
                                                                                <br />
                                                                                <div id="author5_suggestions" class="suggestions" style="display: none;"> </div>
                                        				</td>
                                        			</tr>

                                                                <tr>
                                        				<td>
                                        					Publisher
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="publisher" id="publisher" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(request.getParameter("publisher")) %>" /> <span style="color: red;" > * </span>
                                                                                <br />
                                                                                <div id="publisher_suggestions" class="suggestions" style="display: none;"> </div>
                                        				</td>
                                        			</tr>

                                                                <tr>
                                        				<td>
                                        					Selling Price (in Rupees)
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="selling_price" id="selling_price" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(request.getParameter("selling_price")) %>" /> <span style="color: red;" > * </span>
                                        				</td>
                                        			</tr>

                                                                <tr>
                                        				<td>
                                        					Discount Offered (in %)
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="discount_offered" id="discount_offered" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(request.getParameter("discount_offered")) %>" /> <span style="color: red;" > * </span>
                                        				</td>
                                        			</tr>

                                                                <tr>
                                        				<td>
                                        					Year of Publication
                                        				</td>

                                        				<td>
                                        					: <select name="publication_year" id="publication_year" style="width: 425px; padding-left: 20px;  color: #222222;  " >
                                        					 		<option value=""> - Please Select - </option>
                                                                                                <%
                                                                                                    for(int year=1950; year<=2050; year++)
                                                                                                    {
                                                                                                        %>
                                                                                                        <option value="<%= year %>" > <%= year %> </option>
                                                                                                        <%
                                                                                                    }
                                                                                                %>
                                        					   </select>
                                        					   <span style="color: red;" > * </span>
                                        				</td>
                                        			</tr>

                                                                <tr>
                                        				<td>
                                        					Edition
                                        				</td>

                                        				<td>
                                        					 : <select name="edition" id="edition" style="width: 425px; padding-left: 20px;  color: #222222;  " >
                                        					 		<option value=""> - Please Select - </option>
                                                                                                <%
                                                                                                    for(int ed=1; ed<=20; ed++)
                                                                                                    {
                                                                                                        %>
                                                                                                        <option value="<%= ed %>" > <%= ed %> </option>
                                                                                                        <%
                                                                                                    }
                                                                                                %>
                                        					   </select>
                                        				</td>
                                        			</tr>

                                                                <tr>
                                        				<td>
                                        					Volume
                                        				</td>

                                        				<td>
                                        					 : <select name="volume" id="volume" style="width: 425px; padding-left: 20px;  color: #222222;  " >
                                        					 		<option value=""> - Please Select - </option>
                                                                                                <%
                                                                                                    for(int vol=1; vol<=20; vol++)
                                                                                                    {
                                                                                                        %>
                                                                                                        <option value="<%= vol %>" > <%= vol %> </option>
                                                                                                        <%
                                                                                                    }
                                                                                                %>
                                        					   </select>
                                        				</td>
                                        			</tr>

                                                                <tr>
                                        				<td>
                                        					Book Type
                                        				</td>

                                        				<td>
                                        					 : <select name="book_type" id="book_type" style="width: 425px; padding-left: 20px;  color: #222222;  " >
                                        					 		<option value=""> - Please Select - </option>
                                        					 		<option value="paperback" > Paperback </option>
                                        					 		<option value="hardbound" > Hardbound </option>
                                        					   </select>
                                        					   <span style="color: red;" > * </span>
                                        				</td>
                                        			</tr>

                                                                <tr>
                                        				<td>
                                        					Quantity
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="quantity" id="quantity" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(request.getParameter("quantity")) %>" /> <span style="color: red;" > * </span>
                                        				</td>
                                        			</tr>

                                        			<tr>
                                        				<td colspan="2">
                                        					&nbsp;
                                        				</td>
                                        			</tr>

                                        			<tr>
                                        				<td colspan="2">
                                        					&nbsp;
                                        				</td>
                                        			</tr>

                                        			<tr>
                                        				<td colspan="2">
                                        					<b>Book Description</b>
                                        				</td>
                                        			</tr>

                                        			<tr>
                                        				<td colspan="2">
                                        					<hr/>
                                        				</td>
                                        			</tr>

                                                                <tr>
                                                                    <td colspan="2">
                                                                        <script src="editor/js/richtext.js" type="text/javascript" language="javascript"></script>
									<script src="editor/js/config.js" type="text/javascript" language="javascript"></script>

                                                                        <script>
                                                                            initRTE('', 'rte.css');
									</script>
                                                                    </td>
                                                                </tr>

                                        			<tr>
                                        				<td colspan="2">
                                        					&nbsp;
                                        				</td>
                                        			</tr>

                                        		</table>

                                        		<div style="text-align: right; padding-right: 75px;" >
                                                            <span class="deb-button-wrapper">
                                            			<span class="l"> </span>
                                            			<span class="r"> </span>
                                            			<input type="submit" name="add" id="add" value="Add" class="deb-button" />
                                                            </span>

                                                            <span class="deb-button-wrapper">
                                            			<span class="l"> </span>
                                            			<span class="r"> </span>
                                            			<input type="submit" name="update" id="update" value="Update" class="deb-button" />
                                                            </span>

                                                            <span class="deb-button-wrapper">
                                            			<span class="l"> </span>
                                            			<span class="r"> </span>
                                            			<input type="submit" name="delete" id="delete" value="Delete" class="deb-button" />
                                                            </span>
                                                        </div>

                                                        <br/>
                                        	</form>

      <script type="text/javascript" language="javascript" charset="utf-8">

                document.observe('dom:loaded', function()
				{
					new Ajax.Autocompleter('isbn','isbn_suggestions', 'ajax/isbn-suggestions.jsp');
				});

                document.observe('dom:loaded', function()
				{
					new Ajax.Autocompleter('author1','author1_suggestions', 'ajax/author-suggestions.jsp');
				});

                document.observe('dom:loaded', function()
				{
					new Ajax.Autocompleter('author2','author2_suggestions', 'ajax/author-suggestions.jsp');
				});

                document.observe('dom:loaded', function()
				{
					new Ajax.Autocompleter('author3','author3_suggestions', 'ajax/author-suggestions.jsp');
				});

                document.observe('dom:loaded', function()
				{
					new Ajax.Autocompleter('author4','author4_suggestions', 'ajax/author-suggestions.jsp');
				});

                document.observe('dom:loaded', function()
				{
					new Ajax.Autocompleter('author5','author5_suggestions', 'ajax/author-suggestions.jsp');
				});

                document.observe('dom:loaded', function()
				{
					new Ajax.Autocompleter('publisher','publisher_suggestions', 'ajax/publisher-suggestions.jsp');
				});
	</script>


                                                <%
                                                    }
                                                %>
                                        </div>
                                   	</div>
                                    </div>
                                        <div class="cleared"></div>
                        		</div>

                        		<div class="cleared"></div>
                            </div>
                        </div>
                	</div>

<%@include file="footer.jsp" %>
