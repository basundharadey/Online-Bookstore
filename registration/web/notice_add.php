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
                                            Add a new Notice
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
                                       	if ( isset($_POST['tagline']) && isset($_POST['freeRTE_content']) )
                                       	{
                                       		include_once 'db_config.php';
                                       		
                                       		$query = "insert into notice_board ( tagline, content )
                                        			  values ('{$_POST['tagline']}', '{$_POST['freeRTE_content']}')";
                                        	
                                        	if (mysql_query($query, $con))
                                        	{
                                        	?>
                                        		<p>
                                        			The new Notice has been successfully posted to the Notice Board. Please check the Notice Board once.
                                        		</p>
                                        	<?php 
                                        	}
                                        	else
                                        	{
                                        	?>
                                        		<p>
                                        			There occured some problem while posting the Notice to the Notice Board.
                                        		</p>
                                        	<?php
                                        	}
                                       	}
                                       	else 
                                       	{
                                       	?>
                                       		<form method="post" action="notice_add.php">
												<input type="text" value="Here goes the Tagline of the Notice" name="tagline" id="tagline" style="width: 99.5%; color: graytext; text-align: center;" onfocus="if(this.value == 'Here goes the Tagline of the Notice'){ this.value=''; }" onblur="if(this.value == ''){ this.value='Here goes the Tagline of the Notice'; }" />
												<br />
												<br />
												
												<script src="editor/js/richtext.js" type="text/javascript" language="javascript"></script>
												<script src="editor/js/config.js" type="text/javascript" language="javascript"></script>
												<script>
													initRTE('', 'rte.css');
												</script>
												
												<br />
												
												<div style="text-align: right;" >
                                            		<span class="deb-button-wrapper">
                                            			<span class="l"> </span>
                                            			<span class="r"> </span>
                                            			<input type="submit" class="deb-button" name="submit" value="Add to the Notice Board" />
                                            		</span>
                                            	</div>
												
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
