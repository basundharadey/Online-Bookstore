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
                                            Upload A Company Logo
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
                                       	if ( isset($_POST['submit']) )
                                       	{
                                       		if ((($_FILES["file"]["type"] == "image/gif") || ($_FILES["file"]["type"] == "image/jpeg") || ($_FILES["file"]["type"] == "image/pjpeg") || ($_FILES["file"]["type"] == "image/png")) && ($_FILES["file"]["size"] < 2000000))
  											{
  												if ($_FILES["file"]["error"] > 0)
    											{
    												echo "Return Code: " . $_FILES["file"]["error"] . "<br />";
    											}
  												else
    											{
    												if (file_exists("uploads/" . $_FILES["file"]["name"]))
      												{
      												?>
      												 	<p style="color: red;"> The file (<?php echo $_FILES["file"]["name"]; ?>) already exists. </p>
      												<?php 
      												}
    												else
      												{
      													chmod($_FILES["file"]["tmp_name"], 0755);
      													move_uploaded_file($_FILES["file"]["tmp_name"], "uploads/" . $_FILES["file"]["name"]);
      													
      													?>
      												 		<p style="color: green;"> Successfully uploaded as 'uploads/<?php echo $_FILES["file"]["name"]; ?>'. </p>
      													<?php
      												}
    											}	
  											}
											else
  											{
  												?>
  													<p style="color: red;">Invalid file. Only supports jpeg/jpg/png/gif file format of size less than 2mb.</p>
  												<?php 
  											}
                                       	}
                                       	else 
                                       	{
                                       	?>
                                       		<form method="post" action="upload_logo.php" enctype="multipart/form-data">
												
												<br />
												
                                            	Filename : <input type="file" name="file" id="file" />
												
												<br />
												
												<div style="text-align: right;" >
                                            		<span class="deb-button-wrapper">
                                            			<span class="l"> </span>
                                            			<span class="r"> </span>
                                            			<input type="submit" class="deb-button" name="submit" value="Upload the File !!!" />
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
