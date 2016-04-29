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
                                            Delete an existing Notice
                                        </h2>
                                        
                                        <?php 
                                        	include_once 'db_config.php';
                                        	
                                        	if ( isset($_GET['id']) )
                                        	{
                                        		$query = "delete from notice_board
                                        				  where id={$_GET['id']}";
                                        		
                                        		$result = mysql_query($query, $con);
                                        	}
                                        	
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
                                           							<a href="notice_delete.php?id=<?php echo $row['id']; ?>" class="deb-button" >Delete</a>
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
                                       							
                                    						<p>
                                      							No notice have been posted...
                                       						</p>
                                       						
                                       					</div>
                                 					</div>
                                 				</div>
                                       		<?php
                                       		}
                                       		?>
                        		
                        		</div>
                        
                        		<div class="cleared"></div>
                            </div>
                        </div>
                	</div>
                
                <?php include 'footer.php'; ?>
