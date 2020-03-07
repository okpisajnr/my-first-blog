
<?php
session_start();
include('include/config.php');
if(strlen($_SESSION['alogin'])==0)
	{	
header('location:index.php');
}
else{
date_default_timezone_set('Asia/Kolkata');// change according timezone
$currentTime = date( 'd-m-Y h:i:s A', time () );
if(isset($_POST['submit']))
{
	$regNo=$_POST['regno'];
	$fullName=$_POST['fullname'];
	$cgpa=$_POST['cgpa'];


$sql=mysqli_query($con,"INSERT INTO students (id, fullName, RegNo, password, Cgpa, SupervisorName, projectTopic, StudentImage, status,Accept,SupervisorMail) VALUES(NULL, '$fullName','$regNo', NULL,'$cgpa', NULL, NULL, NULL,'0',NULL,NULL)");


// INSERT INTO `students` (`id`, `fullName`, `RegNo`, `password`, `Cgpa`, `SupervisorName`, `projectTopic`, `StudentImage`, `status`, `Accept`, `SupervisorMail`) VALUES (NULL, '', '', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL)



if ($sql) {
	# code...
echo "<script> 'Student profile Created !!' </script>";

	
}else{
	echo "<script> 'oops error encountered !!' </script>";


}

}

?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Admin| Manage Users</title>
	<link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link type="text/css" href="css/theme.css" rel="stylesheet">
	<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
		<script language="javascript" type="text/javascript">
var popUpWin=0;
function popUpWindow(URLStr, left, top, width, height)
{
 if(popUpWin)
{
if(!popUpWin.closed) popUpWin.close();
}
popUpWin = open(URLStr,'popUpWin', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=yes,width='+600+',height='+600+',left='+left+', top='+top+',screenX='+left+',screenY='+top+'');
}

</script>
</head>
<body>
<?php include('include/header.php');?>

	<div class="wrapper">
		<div class="container">
			<div class="row">
<?php include('include/sidebar.php');?>				
			<div class="span9">
					<div class="content">

	<div class="module">
							<div class="module-head">
								<h3>Manage Users <a class="btn btn-primary pull-right" data-toggle="modal" href="#myModal">Add Students</a></h3> 
							</div>
							<div class="module-body table">

									<br />

										<table class="responsive">
							
								<table cellpadding="0" cellspacing="0" border="0" class="datatable-1 table table-bordered table-striped	 display" width="100%">
									<thead>
										<tr>
											<th>#</th>
											<th> Name</th>
											<th>Reg No </th>
											<th>Supervisor Name</th>
									
											<th>Action</th>
										
										</tr>
									</thead>
									<tbody>

<?php $query=mysqli_query($con,"select * from students");
$cnt=1;
while($row=mysqli_fetch_array($query))
{
?>									
										<tr>
											<td><?php echo strtoupper($cnt);?></td>
											<td><?php echo strtoupper($row['fullName']);?></td>
											<td><?php echo strtoupper($row['RegNo']);?></td>
											<td> <?php echo  strtoupper($row['SupervisorName']);?></td>
										
												<td><a href="javascript:void(0);" onClick="popUpWindow('http://localhost/major/ospms/admin/userprofile.php?uid=<?php echo htmlentities($row['id']);?>');" title="Update user">
											 <button type="button" class="btn btn-primary">View Detials</button>
											</a></td>
											
										<?php $cnt=$cnt+1; } ?>
									</tr>
										</tbody>
									</table>
								</table>
							
							</div>
						</div>						

						
						
					</div><!--/.content-->
				</div><!--/.span9-->
			</div>
		</div><!--/.container-->
	</div><!--/.wrapper-->



           <form class="" name="forgot" method="post">
		          <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
		              <div class="modal-dialog">
		                  <div class="modal-content">
		                      <div class="modal-header">
		                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                          <h4 class="modal-title text-center">Add Students</h4>
		                      </div>
		                      <div class="modal-body ">
		                       
<input type="text" name="regno" placeholder="university Reg No" autocomplete="off" class="text-center form-control span5" required style="padding-left: 25px;"><br >
<input type="text" name="fullname" placeholder="Full Name" autocomplete="off" class="form-control span5" required style="padding-left: 25px;"><br >
<input type="text" name="cgpa" placeholder="Level 2 Cgpa" autocomplete="off" class="form-control span5" required style="padding-left: 25px;"><br >


		
		                      </div>
		                      <div class="modal-footer">
		                          <button data-dismiss="modal" class="btn btn-danger" type="button">Cancel</button>
		                          <button class="btn btn-primary" type="submit" name="submit">Submit</button>
		                      </div>
		                  </div>
		              </div>
		          </div>
		          <!-- modal -->
		          </form>


<?php include('include/footer.php');?>

	<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>
	<script src="scripts/datatables/jquery.dataTables.js"></script>
	<script>
		$(document).ready(function() {
			$('.datatable-1').dataTable();
			$('.dataTables_paginate').addClass("btn-group datatable-pagination");
			$('.dataTables_paginate > a').wrapInner('<span />');
			$('.dataTables_paginate > a:first-child').append('<i class="icon-chevron-left shaded"></i>');
			$('.dataTables_paginate > a:last-child').append('<i class="icon-chevron-right shaded"></i>');
		} );
	</script>
</body>
<?php } ?>