<?php
	session_start(); 
	$filename = basename(__FILE__); 
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
                                            Notice Board
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
                                        	include_once 'db_config.php';
                                        	
                                        	if ( isset($_GET['id']) && trim($_GET['id'])!="" )
                                        	{
                                        		$id = mysql_real_escape_string($_GET['id'], $con);
                                        		
                                        		$query = "select * from notice_board
                                        				  where id={$id}";
                                        	
                                        		$result = mysql_query($query, $con);
                                        		
                                        		if (mysql_num_rows($result) == 1)
                                        		{
                                        			if ($_SESSION['username'] != "")
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
                                        				<script src="editor/js/richtext_preview.js" type="text/javascript" language="javascript"></script>
														
														<script src="editor/js/config_preview.js" type="text/javascript" language="javascript"></script>
														
														<script>
														
														initRTE('<?php echo $content; ?>', 'rte.css');

														</script>
                                        				<?php 
                                        			}
                                        			else 
                                        			{
                                        			?>
                                        				<p style="color: red;">
                                        					You must be Logged In to see this post....
                                        				</p>
                                        			<?php
                                        			}
                                        		}
                                        		else 
                                        		{
                                        		?>
                                        			<p style="color: red;">
                                        				No such post exist....
                                        			</p>
                                        		<?php
                                        		}
                                        		
                                        	}
                                        	else 
                                        	{
                                        		$query = "select id, tagline from notice_board";
                                        	
                                        		$result = mysql_query($query, $con);
                                        	
                                        		?>
                                        		<ul>
                                        		<?php 
                                        		
                                        		while ($row = mysql_fetch_array($result))
                                        		{
                                        		?>
                                        			<li>
                                        				<a href="notice.php?id=<?php echo $row['id']; ?>"> <?php echo $row['tagline']; ?> </a>
                                        				<br /><br />
                                        			</li>
                                        		<?php 
                                       			}
                                       			
                                       			?>
                                        		</ul>
                                        		<?php

                                       			if (mysql_num_rows($result) == 0)
                                       			{
                                       			?>
                                       				<p>
                                       					No notice have been posted...
                                       				</p>
                                       			<?php
                                       			}
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
