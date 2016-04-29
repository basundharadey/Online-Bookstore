<?php
	session_start(); 
	$filename = basename(__FILE__);

	if ($_SESSION['username'] != "administrator")
	{
		header("Location: home.php");
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
                                            Update an existing Notice
                                        </h2>
                                        
                                	<?php 
                                        include_once 'db_config.php';

                                        if ( isset($_POST['tagline']) && isset($_POST['freeRTE_content'])&& isset($_GET['id']) )
                                        {
                                        	?>
                                        	
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
                                        	
                                        	$query = "update notice_board
                                        			  set tagline = '{$_POST['tagline']}', content = '{$_POST['freeRTE_content']}'
                                        			  where id = '{$_GET['id']}'";
                                        	
                                        	if (mysql_query($query, $con))
                                        	{
                                        	?>
                                        		<p>
                                        			The Notice has been successfully updated to the Notice Board. Please check the Notice Board once.
                                        		</p>
                                        	<?php 
                                        	}
                                        	else
                                        	{
                                        	?>
                                        		<p>
                                        			There occured some problem while updating the Notice to the Notice Board.
                                        		</p>
                                        	<?php
                                        	}
                                        	
                                        	?>
                                        			</div>
                                 				</div>
                                 			</div>
                                 
                                 			<div class="cleared"></div>
                                        	<?php 
                                        }
                                        else if ( isset($_GET['id']) )
                                        {
                                        	?>
                                        	
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
                                        	$id = mysql_real_escape_string($_GET['id'], $con);
                                        		
                                        	$query = "select * from notice_board
                                        			  where id={$id}";
                                        	
                                        	$result = mysql_query($query, $con);
                                        		
                                        	if (mysql_num_rows($result) == 1)
                                        	{
                                        		$row = mysql_fetch_array($result);
                                        		
                                        		function freeRTE_Preload($content) 
                                        		{
													// Strip newline characters.
													$content = str_replace(chr(10), " ", $content);
													$content = str_replace(chr(13), " ", $content);
													
													// Replace single quotes.
													$content = str_replace(chr(145), chr(39), $content);
													$content = str_replace(chr(146), chr(39), $content);
													
													// Return the result.
													return $content;
												}
												
												$content = freeRTE_Preload($row['content']);
                                  			?>
                                        	
                                        		<form method="post" action="notice_update.php?id=<?php echo $_GET['id']; ?>">
													<input type="text" value="<?php echo $row['tagline']; ?>" name="tagline" id="tagline" style="width: 99.5%; color: graytext; text-align: center;"  />
													<br />
													<br />
												
													<script src="editor/js/richtext.js" type="text/javascript" language="javascript"></script>
													<script src="editor/js/config.js" type="text/javascript" language="javascript"></script>
													<script>
														initRTE('<?php echo $content; ?>', 'rte.css');
													</script>
												
													<br />
												
													<div style="text-align: right;" >
                                            			<span class="deb-button-wrapper">
                                            				<span class="l"> </span>
                                            				<span class="r"> </span>
                                            				<input type="submit" class="deb-button" name="submit" value="Update the Notice to the Notice Board" />
                                            			</span>
                                            		</div>
												
                                        		</form>
                                        	
                                  			<?php
                                        		}
                                        		else 
                                        		{
                                        		?>
                                        			<p style="color: red;">
                                        				No such post exist....
                                        			</p>
                                        		<?php
                                        		}
                                        		?>
 														</div>
                                 					</div>
                                 				</div>
                                 
                                 				<div class="cleared"></div>                                       		
                                        		<?php 
                                        	}
                                        	else 
                                        	{
                                        		$query = "select id, tagline from notice_board";
                                        	
                                        		$result = mysql_query($query, $con);
                                        	
                                        		while ($row = mysql_fetch_array($result))
                                        		{
                                        		?>
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
                                        					<?php echo $row['tagline']; ?> 
                                        					
                                        					<div style="text-align: right;" >
                                           						<span class="deb-button-wrapper">
                                           							<span class="l"> </span>
                                           							<span class="r"> </span>
                                           							<a href="notice_update.php?id=<?php echo $row['id']; ?>" class="deb-button" >Update</a>
                                           						</span>
                                           					</div>
                                           					
                                        				</div>
                                 					</div>
                                 				</div>
                                 
                                 				<div class="cleared"></div>
                                        		<?php 
                                       			}

                                       			if (mysql_num_rows($result) == 0)
                                       			{
                                       			?>
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
                                       						No notice have been posted...
                                       					</div>
                                 					</div>
                                 				</div>
                                 
                                 				<div class="cleared"></div>
                                       			
                                       			<?php
                                       			}
                                        	}
                                       	?>

                        		</div>
                        
                        		<div class="cleared"></div>
                            </div>
                        </div>
                	</div>
                
                <?php include 'footer.php'; ?>
