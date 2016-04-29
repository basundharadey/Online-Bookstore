<?php
	session_start(); 
	$filename = basename(__FILE__); 
?>

	<?php 
		include 'db_config.php';
	
    $errors = array();
    
    if(isset($_POST['username']))
    {
    	$_POST['username'] = mysql_real_escape_string($_POST['username'], $con);
		
		$query = "select registration_key, email from members where username='{$_POST['username']}'"; 
		
		$result = mysql_query($query, $con);
		
		if (mysql_num_rows($result) == 1)
		{
			$row = mysql_fetch_array($result);
			
			mail($row['email'], "Reset Password", "Please click on the following link : http://www.infiniteaspirations.com/forgot.php?registration_key={$row['registration_key']}");
		}
		else
		{
			$errors[] = "No such username exists.";
		}
	}
	
	if (isset($_GET['registration_key']))
	{
		$_GET['registration_key'] = mysql_real_escape_string($_GET['registration_key'], $con);
		
		$query = "select registration_key from members where registration_key='{$_GET['registration_key']}'"; 
		
		$result = mysql_query($query, $con);
		
		if (mysql_num_rows($result) == 1)
		{
			if (isset($_POST['password']) && isset($_POST['confirm_password']))
			{
				if ($_POST['password']==$_POST['confirm_password'])
				{
					$password = md5($_POST['password']);
		
					$query = "update members set password='{$password}' where registration_key='{$_GET['registration_key']}'"; 
		
					if (! mysql_query($query, $con))
					{
						$errors[] = "An error has occured. Please try again after some time.";
					}
				}
				else 
				{
					$errors[] = "The two password fields must match.";
				}
			}
		}
		else 
		{
			$errors[] = "Not a valid link.";
		}
	}
	
	?>

	<?php include 'header.php'; ?>                
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
                                		Forgot Password
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
                                        <?php 
                                        if (isset($_GET['registration_key']) && count($errors)==0 && isset($_POST['password']) && isset($_POST['confirm_password']))
                                        {
                                        ?>
                                        	<p> Your password was successfully changed. </p>
                                        <?php
                                        }
                                        else if (isset($_GET['registration_key']))
                                        {
                                        	?>
											<form action="forgot.php?registration_key=<?php echo $_GET['registration_key']; ?>" method="post" >
                                        		<table>
                                        			<tr>
                                        				<td>
                                        					Password
                                        				</td>
                                        				
                                        				<td>
                                        					 : <input type="password" name="password" id="password" size="74" style="padding-left: 20px; color: #222222; " value="<?php echo $_POST['password']; ?>" />
                                        				</td>
                                        			</tr>
                                        			
                                        			<tr>
                                        				<td>
                                        					Confirm Password
                                        				</td>
                                        				
                                        				<td>
                                        					 : <input type="password" name="confirm_password" id="confirm_password" size="74" style="padding-left: 20px; color: #222222; " value="<?php echo $_POST['confirm_password']; ?>" />
                                        				</td>
                                        			</tr>
                                        		</table>
                                        		
                                        		<div style="text-align: right; padding-right: 42px;" >
                                            		<span class="deb-button-wrapper">
                                            			<span class="l"> </span>
                                            			<span class="r"> </span>
                                            			<input type="submit" name="submit" id="submit" value="Change Password" class="deb-button" />
                                            		</span>
                                            	</div>
                                            	
                                            	<br/>
                                        	</form>
										<?php
                                        }
                                        else if (isset($_POST['username']) && count($errors)==0)
                                        {
                                        ?>
                                        	<p> Please check your emails to complete the password reset process. </p>
                                        <?php
                                        }
                                        else 
                                        {
                                        ?>
                                        	<form action="forgot.php" method="post" >
                                        		Username : <input type="text" name="username" id="username" size="83" style="padding-left: 20px; color: #222222; " value="<?php echo $_POST['username']; ?>" />
                                        		
                                        		<div style="text-align: right; padding-right: 42px;" >
                                            		<span class="deb-button-wrapper">
                                            			<span class="l"> </span>
                                            			<span class="r"> </span>
                                            			<input type="submit" name="submit" id="submit" value="Click to Reset" class="deb-button" />
                                            		</span>
                                            	</div>
                                            	
                                            	<br/>
                                        	</form>
                                        <?php
                                        }
                                        ?>

                                        </div>
                                 	</div>
                                 	</div>
                                        <div class="cleared"></div>
                        		</div>
                        
                        		<div class="cleared"></div>
                            </div>
                        </div>
                	</div>
                
                <?php include 'footer.php'; ?>
