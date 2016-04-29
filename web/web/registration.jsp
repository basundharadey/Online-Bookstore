<%
    String filename = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/")+1);
%>

<%@include file="pre_header.jsp" %>

<%
    if( request.getParameter("submit") != null )
    {
        if( isNull(request.getParameter("username")).trim().isEmpty())
        {
            errors.add("Username cannot be left blank.");
        }

        PreparedStatement ps = con.prepareStatement("select username from members where username = ?");
        ps.setString(1, isNull(request.getParameter("username")).trim());

        ResultSet rs = ps.executeQuery();

        while(rs.next())
        {
            errors.add("The Username is already taken.");
        }

        if( isNull(request.getParameter("password")).trim().isEmpty())
        {
            errors.add("Password cannot be left blank.");
        }

        if( isNull(request.getParameter("password")).trim() == isNull(request.getParameter("confirm_password")).trim() )
        {
            errors.add("Confirm Password must match Password.");
        }

        if( isNull(request.getParameter("first_name")).trim().isEmpty())
        {
            errors.add("First Name cannot be left blank.");
        }

        if( isNull(request.getParameter("last_name")).trim().isEmpty())
        {
            errors.add("Last Name cannot be left blank.");
        }

        if( isNull(request.getParameter("dob")).trim().isEmpty())
        {
            errors.add("Date of Birth cannot be left blank.");
        }

        if( !(isNull(request.getParameter("gender")).trim().equals("male")) && !(isNull(request.getParameter("gender")).trim().equals("female")) )
        {
            errors.add("Must provide a valid Gender.");
        }

        if( isNull(request.getParameter("street")).trim().isEmpty())
        {
            errors.add("Street cannot be left blank.");
        }

        if( isNull(request.getParameter("house_number")).trim().isEmpty())
        {
            errors.add("House Number cannot be left blank.");
        }

        if( isNull(request.getParameter("postal_code")).trim().isEmpty())
        {
            errors.add("Postal Code cannot be left blank.");
        }

        if( isNull(request.getParameter("city")).trim().isEmpty())
        {
            errors.add("City cannot be left blank.");
        }

        if( isNull(request.getParameter("city")).trim().isEmpty())
        {
            errors.add("City cannot be left blank.");
        }

        if( isNull(request.getParameter("country")).trim().isEmpty())
        {
            errors.add("Country cannot be left blank.");
        }

        if( isNull(request.getParameter("email")).trim().isEmpty())
        {
            errors.add("Email cannot be left blank.");
        }

        if( isNull(request.getParameter("phone_number")).trim().isEmpty())
        {
            errors.add("Phone number cannot be left blank.");
        }

        if ( errors.size() == 0 )
        {
            ps = con.prepareStatement("insert into members values(?, ?, ?, ?, ?, TO_DATE(?, 'DD-MM-YYYY'), ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, isNull(request.getParameter("username")).trim());
            ps.setString(2, isNull(request.getParameter("password")).trim());
            ps.setString(3, isNull(request.getParameter("first_name")).trim());
            ps.setString(4, isNull(request.getParameter("middle_name")).trim());
            ps.setString(5, isNull(request.getParameter("last_name")).trim());
            ps.setString(6, isNull(request.getParameter("dob")).trim());
            ps.setString(7, isNull(request.getParameter("gender")).trim());
            ps.setString(8, isNull(request.getParameter("street")).trim());
            ps.setString(9, isNull(request.getParameter("house_number")).trim());
            ps.setString(10, isNull(request.getParameter("postal_code")).trim());
            ps.setString(11, isNull(request.getParameter("city")).trim());
            ps.setString(12, isNull(request.getParameter("country")).trim());
            ps.setString(13, isNull(request.getParameter("email")).trim());
            ps.setString(14, isNull(request.getParameter("phone_number")).trim());
            
            int x = ps.executeUpdate();

            if( x != 1)
            {
                errors.add("An error occured while processing your Registration request.");
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
                                		Registration Form
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
                                            if ((request.getParameter("submit") != null) && (errors.size() == 0))
                                            {
                                            %>
                                                <p> Thank you, <span style="color: green; text-transform: capitalize;"><%= isNull(request.getParameter("first_name")) %></span>, for registering with us. </p>
                                                <p> Please login to start buying books online. </p>
                                            <%
                                            }
                                            else
                                            {
                                        %>
                                        	<form name="registration_form" action="registration.jsp" method="post" >
                                        		<table>
                                        			<tr>
                                        				<td colspan="2">
                                                                            <b>Account Information</b>
                                        				</td>
                                        			</tr>

                                        			<tr>
                                        				<td colspan="2">
                                                                            <hr/>
                                        				</td>
                                        			</tr>

                                        			<tr>
                                        				<td>
                                        					Username
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="username" id="username" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(request.getParameter("username")) %>" /> <span style="color: red;" > * </span>
                                        				</td>
                                        			</tr>

                                        			<tr>
                                        				<td>
                                        					Password
                                        				</td>

                                        				<td>
                                        					 : <input type="password" name="password" id="password" size="64" style="padding-left: 20px; color: #222222; " /> <span style="color: red;" > * </span>
                                        				</td>
                                        			</tr>

                                        			<tr>
                                        				<td>
                                        					Confirm Password &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        				</td>

                                        				<td>
                                        					 : <input type="password" name="confirm_password" id="confirm_password" size="64" style="padding-left: 20px; color: #222222; " /> <span style="color: red;" > * </span>
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
                                        					<b>Personal Information</b>
                                        				</td>
                                        			</tr>

                                        			<tr>
                                        				<td colspan="2">
                                        					<hr/>
                                        				</td>
                                        			</tr>

                                        			<tr>
                                        				<td>
                                        					First Name
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="first_name" id="first_name" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(request.getParameter("first_name")) %>" /> <span style="color: red;" > * </span>
                                        				</td>
                                        			</tr>

                                        			<tr>
                                        				<td>
                                        					Middle Name
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="middle_name" id="middle_name" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(request.getParameter("middle_name")) %>" />
                                        				</td>
                                        			</tr>

                                        			<tr>
                                        				<td>
                                        					Last Name
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="last_name" id="last_name" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(request.getParameter("last_name")) %>" /> <span style="color: red;" > * </span>
                                        				</td>
                                        			</tr>

                                        			<tr>
                                        				<td>
                                        					Date of Birth
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="dob" id="dob" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(request.getParameter("dob")) %>" />

                                        					   <span style="color: red;" > * </span>

                               									<script language="JavaScript">
																	new tcal ({
																				// form name
																				'formname': 'registration_form',

																				// input name
																				'controlname': 'dob'
																			});
																</script>
                                        				</td>
                                        			</tr>

                                        			<tr>
                                        				<td>
                                        					Gender
                                        				</td>

                                        				<td>
                                        					 : <select name="gender" id="gender" style="width: 425px; padding-left: 20px;  color: #222222;  " >
                                        					 		<option value=""> - Please Select - </option>
                                        					 		<option value="male" > Male </option>
                                        					 		<option value="female" > Female </option>
                                        					   </select>
                                        					   <span style="color: red;" > * </span>
                                        				</td>
                                        			</tr>

                                        			<tr>
                                        				<td>
                                        					Street
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="street" id="street" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(request.getParameter("street")) %>" /> <span style="color: red;" > * </span>
                                        				</td>
                                        			</tr>

                                        			<tr>
                                        				<td>
                                        					House Number
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="house_number" id="house_number" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(request.getParameter("house_number")) %>" /> <span style="color: red;" > * </span>
                                        				</td>
                                        			</tr>

                                        			<tr>
                                        				<td>
                                        					Postal Code
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="postal_code" id="postal_code" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(request.getParameter("postal_code")) %>" /> <span style="color: red;" > * </span>
                                        				</td>
                                        			</tr>

                                        			<tr>
                                        				<td>
                                        					City
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="city" id="city" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(request.getParameter("city")) %>" /> <span style="color: red;" > * </span>
                                        				</td>
                                        			</tr>

                                        			<tr>
                                        				<td>
                                        					Country
                                        				</td>

                                        				<td>
                                        					 :

                                        					<select name="country" id="country" style="width: 425px; padding-left: 20px;  color: #222222;" >
																<option value="Afghanistan">Afghanistan</option>
																<option value="Albania">Albania</option>
																<option value="Algeria">Algeria</option>
																<option value="American Samoa">American Samoa</option>
																<option value="Andorra">Andorra</option>
																<option value="Angola">Angola</option>
																<option value="Anguilla">Anguilla</option>
																<option value="Antarctica">Antarctica</option>
																<option value="Antigua and Barbuda">Antigua and Barbuda</option>
																<option value="Argentina">Argentina</option>
																<option value="Armenia">Armenia</option>
																<option value="Aruba">Aruba</option>
																<option value="Australia">Australia</option>
																<option value="Austria">Austria</option>
																<option value="Azerbaijan">Azerbaijan</option>
																<option value="Bahamas">Bahamas</option>
																<option value="Bahrain">Bahrain</option>
																<option value="Bangladesh">Bangladesh</option>
																<option value="Barbados">Barbados</option>
																<option value="Belarus">Belarus</option>
																<option value="Belgium">Belgium</option>
																<option value="Belize">Belize</option>
																<option value="Benin">Benin</option>
																<option value="Bermuda">Bermuda</option>
																<option value="Bhutan">Bhutan</option>
																<option value="Bolivia">Bolivia</option>
																<option value="Bosnia and Herzegowina">Bosnia and Herzegowina</option>
																<option value="Botswana">Botswana</option>
																<option value="Bouvet Island">Bouvet Island</option>
																<option value="Brazil">Brazil</option>
																<option value="British Indian Ocean Territory">British Indian Ocean Territory</option>
																<option value="Brunei Darussalam">Brunei Darussalam</option>
																<option value="Bulgaria">Bulgaria</option>
																<option value="Burkina Faso">Burkina Faso</option>
																<option value="Burundi">Burundi</option>
																<option value="Cambodia">Cambodia</option>
																<option value="Cameroon">Cameroon</option>
																<option value="Canada">Canada</option>
																<option value="Cape Verde">Cape Verde</option>
																<option value="Cayman Islands">Cayman Islands</option>
																<option value="Central African Republic">Central African Republic</option>
																<option value="Chad">Chad</option>
																<option value="Chile">Chile</option>
																<option value="China">China</option>
																<option value="Christmas Island">Christmas Island</option>
																<option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
																<option value="Colombia">Colombia</option>
																<option value="Comoros">Comoros</option>
																<option value="Congo">Congo</option>
																<option value="Cook islands">Cook islands</option>
																<option value="Costa Rica">Costa Rica</option>
																<option value="Croatia">Croatia</option>
																<option value="Cuba">Cuba</option>
																<option value="Cyprus">Cyprus</option>
																<option value="Czech Republic">Czech Republic</option>
																<option value="Denmark">Denmark</option>
																<option value="Djibouti">Djibouti</option>
																<option value="Dominica">Dominica</option>
																<option value="Dominican Republic">Dominican Republic</option>
																<option value="East Timor">East Timor</option>
																<option value="Ecuador">Ecuador</option>
																<option value="Egypt">Egypt</option>
																<option value="El Salvador">El Salvador</option>
																<option value="Equatorial Guinea">Equatorial Guinea</option>
																<option value="Eritrea">Eritrea</option>
																<option value="Estonia">Estonia</option>
																<option value="Ethiopia">Ethiopia</option>
																<option value="Europe">Europe</option>
																<option value="Falkland Islands">Falkland Islands</option>
																<option value="Faroe Islands">Faroe Islands</option>
																<option value="Fiji">Fiji</option>
																<option value="Finland">Finland</option>
																<option value="France">France</option>
																<option value="France, Metropolitan">France, Metropolitan</option>
																<option value="French Guiana">French Guiana</option>
																<option value="French Polynesia">French Polynesia</option>
																<option value="French Southern Territories">French Southern Territories</option>
																<option value="Gabon">Gabon</option>
																<option value="Gambia">Gambia</option>
																<option value="Georgia">Georgia</option>
																<option value="Germany">Germany</option>
																<option value="Ghana">Ghana</option>
																<option value="Gibraltar">Gibraltar</option>
																<option value="Global">Global</option>
																<option value="Greece">Greece</option>
																<option value="Greenland">Greenland</option>
																<option value="Grenada">Grenada</option>
																<option value="Guadeloupe">Guadeloupe</option>
																<option value="Guam">Guam</option>
																<option value="Guatemala">Guatemala</option>
																<option value="Guinea">Guinea</option>
																<option value="Guinea-Bissau">Guinea-Bissau</option>
																<option value="Guyana">Guyana</option>
																<option value="Haiti">Haiti</option>
																<option value="Heard and Mc Donald Islands">Heard and Mc Donald Islands</option>
																<option value="Honduras">Honduras</option>
																<option value="Hong Kong">Hong Kong</option>
																<option value="Hungary">Hungary</option>
																<option value="Iceland">Iceland</option>
																<option value="India" selected="selected">India</option>
																<option value="Indonesia">Indonesia</option>
																<option value="Iran">Iran</option>
																<option value="Iraq">Iraq</option>
																<option value="Ireland">Ireland</option>
																<option value="Israel">Israel</option>
																<option value="Italy">Italy</option>
																<option value="Ivory Coast">Ivory Coast</option>
																<option value="Jamaica">Jamaica</option>
																<option value="Japan">Japan</option>
																<option value="Jordan">Jordan</option>
																<option value="Kazakhstan">Kazakhstan</option>
																<option value="Kenya">Kenya</option>
																<option value="Kiribati">Kiribati</option>
																<option value="Kuwait">Kuwait</option>
																<option value="Kyrgyzstan">Kyrgyzstan</option>
																<option value="Lao">Lao</option>
																<option value="Latvia">Latvia</option>
																<option value="Lebanon">Lebanon</option>
																<option value="Lesotho">Lesotho</option>
																<option value="Liberia">Liberia</option>
																<option value="Libya">Libya</option>
																<option value="Liechtenstein">Liechtenstein</option>
																<option value="Lithuania">Lithuania</option>
																<option value="Luxembourg">Luxembourg</option>
																<option value="Macau">Macau</option>
																<option value="Macedonia">Macedonia</option>
																<option value="Madagascar">Madagascar</option>
																<option value="Malawi">Malawi</option>
																<option value="Malaysia">Malaysia</option>
																<option value="Maldives">Maldives</option>
																<option value="Mali">Mali</option>
																<option value="Malta">Malta</option>
																<option value="Marshall Islands">Marshall Islands</option>
																<option value="Martinique">Martinique</option>
																<option value="Mauritania">Mauritania</option>
																<option value="Mauritius">Mauritius</option>
																<option value="Mayotte">Mayotte</option>
																<option value="Mexico">Mexico</option>
																<option value="Micronesia">Micronesia</option>
																<option value="Moldova">Moldova</option>
                                                                                                                                <option value="Monaco">Monaco</option>
                                                                                                                                <option value="Mongolia">Mongolia</option>
																<option value="Montenegro">Montenegro</option>
																<option value="Montserrat">Montserrat</option>
																<option value="Morocco">Morocco</option>
																<option value="Mozambique">Mozambique</option>
																<option value="Myanmar">Myanmar</option>
																<option value="Namibia">Namibia</option>
																<option value="Nauru">Nauru</option>
																<option value="Nepal">Nepal</option>
																<option value="Netherlands">Netherlands</option>
																<option value="Netherlands Antilles">Netherlands Antilles</option>
																<option value="New Caledonia">New Caledonia</option>
																<option value="New Zealand">New Zealand</option>
																<option value="Nicaragua">Nicaragua</option>
																<option value="Niger">Niger</option>
																<option value="Nigeria">Nigeria</option>
																<option value="Niue">Niue</option>
																<option value="Norfolk Island">Norfolk Island</option>
																<option value="North Korea">North Korea</option>
																<option value="Northern Mariana Islands">Northern Mariana Islands</option>
																<option value="Norway">Norway</option>
																<option value="Oman">Oman</option>
																<option value="Pakistan">Pakistan</option>
																<option value="Palau">Palau</option>
																<option value="Panama">Panama</option>
																<option value="Papua New Guinea">Papua New Guinea</option>
																<option value="Paraguay">Paraguay</option>
																<option value="Peru">Peru</option>
																<option value="Philippines">Philippines</option>
																<option value="Pitcairn">Pitcairn</option>
																<option value="Poland">Poland</option>
																<option value="Portugal">Portugal</option>
																<option value="Puerto Rico">Puerto Rico</option>
																<option value="Qatar">Qatar</option>
																<option value="Reunion">Reunion</option>
																<option value="Romania">Romania</option>
																<option value="Russian Federation">Russian Federation</option>
																<option value="Rwanda">Rwanda</option>
																<option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
																<option value="Saint Lucia">Saint Lucia</option>
																<option value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option>
																<option value="Samoa">Samoa</option>
																<option value="San Marino">San Marino</option>
																<option value="Sao Tome and Principe">Sao Tome and Principe</option>
																<option value="Saudi Arabia">Saudi Arabia</option>
																<option value="Senegal">Senegal</option>
																<option value="Serbia">Serbia</option>
																<option value="Seychelles">Seychelles</option>
																<option value="Sierra Leone">Sierra Leone</option>
																<option value="Singapore">Singapore</option>
																<option value="Slovakia">Slovakia</option>
																<option value="Slovenia">Slovenia</option>
																<option value="Solomon Islands">Solomon Islands</option>
																<option value="Somalia">Somalia</option>
																<option value="South Africa">South Africa</option>
																<option value="South Korea">South Korea</option>
																<option value="Spain">Spain</option>
																<option value="Sri Lanka">Sri Lanka</option>
																<option value="St. Helena">St. Helena</option>
																<option value="St. Pierre and Miquelon">St. Pierre and Miquelon</option>
																<option value="Sudan">Sudan</option>
																<option value="Suriname">Suriname</option>
																<option value="Svalbard and Jan Mayen Islands">Svalbard and Jan Mayen Islands</option>
																<option value="Swaziland">Swaziland</option>
																<option value="Sweden">Sweden</option>
																<option value="Switzerland">Switzerland</option>
																<option value="Syrian">Syrian</option>
																<option value="Taiwan">Taiwan</option>
																<option value="Tajikistan">Tajikistan</option>
																<option value="Tanzania">Tanzania</option>
																<option value="Thailand">Thailand</option>
																<option value="Togo">Togo</option>
																<option value="Tokelau">Tokelau</option>
																<option value="Tonga">Tonga</option>
																<option value="Trinidad and Tobago">Trinidad and Tobago</option>
																<option value="Tunisia">Tunisia</option>
																<option value="Turkey">Turkey</option>
																<option value="Turkmenistan">Turkmenistan</option>
																<option value="Turks and Caicos Islands">Turks and Caicos Islands</option>
																<option value="Tuvalu">Tuvalu</option>
																<option value="Uganda">Uganda</option>
																<option value="Ukraine">Ukraine</option>
																<option value="United Arab Emirates">United Arab Emirates</option>
																<option value="United Kingdom">United Kingdom</option>
																<option value="United States">United States</option>
																<option value="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
																<option value="Uruguay">Uruguay</option>
																<option value="Uzbekistan">Uzbekistan</option>
																<option value="Vanuatu">Vanuatu</option>
																<option value="Vatican City State (Holy See)">Vatican City State (Holy See)</option>
																<option value="Venezuela">Venezuela</option>
																<option value="Vietnam">Vietnam</option>
																<option value="Virgin Islands (British)">Virgin Islands (British)</option>
																<option value="Virgin Islands (U.S.)">Virgin Islands (U.S.)</option>
																<option value="Wallis and Futuna Islands">Wallis and Futuna Islands</option>
																<option value="Western Sahara">Western Sahara</option>
																<option value="Yemen">Yemen</option>
																<option value="Zaire">Zaire</option>
																<option value="Zambia">Zambia</option>
																<option value="Zimbabwe">Zimbabwe</option>
															</select>

                                        					 <span style="color: red;" > * </span>
                                        				</td>
                                        			</tr>

                                        			<tr>
                                        				<td>
                                        					Email
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="email" id="email" size="64" style="padding-left: 20px; color: #222222; "  value="<%= isNull(request.getParameter("email")) %>" /> <span style="color: red;" > * </span>
                                        				</td>
                                        			</tr>

                                        			<tr>
                                        				<td>
                                        					Phone Number
                                        				</td>

                                        				<td>
                                        					 : <input type="text" name="phone_number" id="phone_number" size="64" style="padding-left: 20px; color: #222222; " value="<%= isNull(request.getParameter("phone_number")) %>" /> <span style="color: red;" > * </span>
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
                                            			<input type="submit" name="submit" id="submit" value="Click to Register" class="deb-button" />
                                            		</span>
                                            	</div>

                                            	<br/>
                                        	</form>


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
