<%
    String filename = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/")+1);
%>

<%@include file="pre_header.jsp" %>

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
                                        Browse Books
                                    </h2>

                                    
                                    <%
                                        if(! isNull(request.getParameter("isbn")).trim().isEmpty())
                                        {
                                            PreparedStatement ps = con.prepareStatement("select * from books where isbn=?");

                                            ps.setString(1, isNull(request.getParameter("isbn")).trim());

                                            ResultSet rs = ps.executeQuery();

                                            if(rs.next())
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

                                                        <div class="deb-PostContent">

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
                                        					 : <input type="text" name="isbn" id="isbn" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(rs.getString("isbn")) %>" disabled="disabled" />
                                        				</td>
                                        			</tr>

                                                                <tr>
                                        				<td>
                                        					Title
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="title" id="title" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(rs.getString("title")) %>" disabled="disabled" />
                                        				</td>
                                        			</tr>

                                                                <%
                                                                    PreparedStatement ps2 = con.prepareStatement("select author from authors where id=?");

                                                                    ps2.setInt(1, rs.getInt("author1"));
                                                                    ResultSet rs2 = ps2.executeQuery();
                                                                    rs2.next();
                                                                %>

                                                                <tr>
                                        				<td>
                                        					Author 1
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="author1" id="author1" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(rs2.getString("author")) %>" disabled="disabled" />
                                        				</td>
                                        			</tr>

                                                                <%
                                                                    ps2.setInt(1, rs.getInt("author2"));
                                                                    rs2 = ps2.executeQuery();
                                                                    rs2.next();
                                                                %>

                                                                <tr>
                                        				<td>
                                        					Author 2
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="author2" id="author2" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(rs2.getString("author")) %>" disabled="disabled" />
                                        				</td>
                                        			</tr>

                                                                <%
                                                                    ps2.setInt(1, rs.getInt("author3"));
                                                                    rs2 = ps2.executeQuery();
                                                                    rs2.next();
                                                                %>

                                                                <tr>
                                        				<td>
                                        					Author 3
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="author3" id="author3" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(rs2.getString("author")) %>" disabled="disabled" />
                                        				</td>
                                        			</tr>

                                                                <%
                                                                    ps2.setInt(1, rs.getInt("author4"));
                                                                    rs2 = ps2.executeQuery();
                                                                    rs2.next();
                                                                %>

                                                                <tr>
                                        				<td>
                                        					Author 4
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="author4" id="author4" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(rs2.getString("author")) %>" disabled="disabled" />
                                        				</td>
                                        			</tr>

                                                                <%
                                                                    ps2.setInt(1, rs.getInt("author5"));
                                                                    rs2 = ps2.executeQuery();
                                                                    rs2.next();
                                                                %>

                                                                <tr>
                                        				<td>
                                        					Author 5
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="author5" id="author5" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(rs2.getString("author")) %>" disabled="disabled" />
                                        				</td>
                                        			</tr>

                                                                <tr>
                                        				<td>
                                        					Publisher
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="publisher" id="publisher" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(rs.getString("publisher")) %>" disabled="disabled" />
                                        				</td>
                                        			</tr>

                                                                <tr>
                                        				<td>
                                        					Selling Price (in Rupees)
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="selling_price" id="selling_price" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(rs.getString("selling_price")) %>" disabled="disabled" />
                                        				</td>
                                        			</tr>

                                                                <tr>
                                        				<td>
                                        					Discount Offered (in %)
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="discount_offered" id="discount_offered" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(rs.getString("discount_offered")) %>" disabled="disabled" />
                                        				</td>
                                        			</tr>

                                                                <tr>
                                        				<td>
                                        					Year of Publication
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="publication_year" id="publication_year" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(rs.getString("publication_year")) %>" disabled="disabled" />

                                        				</td>
                                        			</tr>

                                                                <tr>
                                        				<td>
                                        					Edition
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="edition" id="edition" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(rs.getString("edition")) %>" disabled="disabled" />
                                        				</td>
                                        			</tr>

                                                                <tr>
                                        				<td>
                                        					Volume
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="volume" id="volume" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(rs.getString("volume")) %>" disabled="disabled" />
                                        				</td>
                                        			</tr>

                                                                <tr>
                                        				<td>
                                        					Book Type
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="book_type" id="book_type" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(rs.getString("book_type")) %>" disabled="disabled" />

                                        				</td>
                                        			</tr>

                                                                <tr>
                                        				<td>
                                        					Quantity
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="quantity" id="quantity" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(rs.getString("quantity")) %>" disabled="disabled" />
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
                                                                        <script src="editor/js/richtext_preview.js" type="text/javascript" language="javascript"></script>
									<script src="editor/js/config_preview.js" type="text/javascript" language="javascript"></script>

                                                                        <script type="text/javascript">
                                                                            initRTE('<%= isNull(rs.getString("description")) %>', 'rte.css');
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
                                            			<a href="add_cart.jsp?isbn=<%= isNull(rs.getString("isbn")) %>" class="deb-button" > Add to Cart </a>
                                                            </span>

                                                        </div>
                                            <%
                                            }
                                            else
                                            {
                                                errors.add("The requested book is not available in the database.");
                                            }
                                        }
                                        else
                                        {
                                            PreparedStatement ps = con.prepareStatement("select * from books");

                                            ResultSet rs = ps.executeQuery();

                                            while(rs.next())
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

                                                        <div class="deb-PostContent">

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
                                        					Title
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="title" id="title" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(rs.getString("title")) %>" disabled="disabled" />
                                        				</td>
                                        			</tr>

                                                                <%
                                                                    PreparedStatement ps2 = con.prepareStatement("select author from authors where id=?");

                                                                    ps2.setInt(1, rs.getInt("author1"));
                                                                    ResultSet rs2 = ps2.executeQuery();
                                                                    rs2.next();
                                                                %>

                                                                <tr>
                                        				<td>
                                        					Author 1
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="author1" id="author1" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(rs2.getString("author")) %>" disabled="disabled" />
                                        				</td>
                                        			</tr>

                                                                <%
                                                                    ps2.setInt(1, rs.getInt("author2"));
                                                                    rs2 = ps2.executeQuery();
                                                                    rs2.next();
                                                                %>

                                                                <tr>
                                        				<td>
                                        					Author 2
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="author2" id="author2" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(rs2.getString("author")) %>" disabled="disabled" />
                                        				</td>
                                        			</tr>

                                                                <%
                                                                    ps2.setInt(1, rs.getInt("author3"));
                                                                    rs2 = ps2.executeQuery();
                                                                    rs2.next();
                                                                %>

                                                                <tr>
                                        				<td>
                                        					Author 3
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="author3" id="author3" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(rs2.getString("author")) %>" disabled="disabled" />
                                        				</td>
                                        			</tr>

                                                                <%
                                                                    ps2.setInt(1, rs.getInt("author4"));
                                                                    rs2 = ps2.executeQuery();
                                                                    rs2.next();
                                                                %>

                                                                <tr>
                                        				<td>
                                        					Author 4
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="author4" id="author4" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(rs2.getString("author")) %>" disabled="disabled" />
                                        				</td>
                                        			</tr>

                                                                <%
                                                                    ps2.setInt(1, rs.getInt("author5"));
                                                                    rs2 = ps2.executeQuery();
                                                                    rs2.next();
                                                                %>

                                                                <tr>
                                        				<td>
                                        					Author 5
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="author5" id="author5" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(rs2.getString("author")) %>" disabled="disabled" />
                                        				</td>
                                        			</tr>

                                                                <tr>
                                        				<td>
                                        					Publisher
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="publisher" id="publisher" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(rs.getString("publisher")) %>" disabled="disabled" />
                                        				</td>
                                        			</tr>

                                                                <tr>
                                        				<td>
                                        					Selling Price (in Rupees)
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="selling_price" id="selling_price" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(rs.getString("selling_price")) %>" disabled="disabled" />
                                        				</td>
                                        			</tr>

                                                                <tr>
                                        				<td>
                                        					Discount Offered (in %)
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="discount_offered" id="discount_offered" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(rs.getString("discount_offered")) %>" disabled="disabled" />
                                        				</td>
                                        			</tr>

                                        		</table>

                                                        <br>

                                        		<div style="text-align: right; padding-right: 75px;" >
                                                            <span class="deb-button-wrapper">
                                            			<span class="l"> </span>
                                            			<span class="r"> </span>
                                                                <a href="browse.jsp?isbn=<%= isNull(rs.getString("isbn")) %>" class="deb-button" > Book Details </a>
                                                            </span>

                                                            <span class="deb-button-wrapper">
                                            			<span class="l"> </span>
                                            			<span class="r"> </span>
                                            			<a href="add_cart.jsp?isbn=<%= isNull(rs.getString("isbn")) %>" class="deb-button" > Add to Cart </a>
                                                            </span>

                                                        </div>

                                                        </div>
                                                    </div>
                                                </div>
                                        <div class="cleared"></div>
                                            <%
                                            }
                                        }
                                    %>






                        		</div>

                        		<div class="cleared"></div>
                            </div>
                        </div>
                	</div>

<%@include file="footer.jsp" %>