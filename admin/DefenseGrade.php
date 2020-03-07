
<?php
session_start();
include('include/config.php');
if(strlen($_SESSION['alogin'])==0)
{	
		header('location:index.php');
}else{
if(isset($_POST['submit']))
{
	 $id=intval($_GET['id']);
	$RegNo=$_POST['RegNo'];
	$Defense=$_POST['Defense'];

$ret=mysqli_query($con,"select * from students where id ='$id' ");
while($result=mysqli_fetch_array($ret)){
	$gradA =$result['gradeA'];
}


$Grade1= $gradA;
$Grade2= $Defense;
$score = $Grade1+$Grade2; 

if ($score >=0 and $score<=100 ) {
  if ($score >=70 and $score<=100) {
    $Finalgrade = 'A';
  }
  elseif ($score >=60 and $score<=69) {
    $Finalgrade = 'B';
  }
  elseif ($score >=50 and $score<=59) {
    $Finalgrade = 'C';
  }
  elseif ($score >=45 and $score<=49) {
    $Finalgrade = 'D';
  }else{
     $Finalgrade = 'F';
  }}else{
     echo '<script>alert("Invalid score")</script>';}


$sql=mysqli_query($con,"UPDATE students set gradeB = '$Grade2', grade = '$Finalgrade' where id = '$id'");

$_SESSION['msg']="Defense Grade Added !!";

}

// if(isset($_GET['del']))
// 		  {
// 		          mysqli_query($con,"delete from category where id = '".$_GET['id']."'");
//                   $_SESSION['delmsg']="Category deleted !!";
// 		  }

?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Admin| Category</title>
	<link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link type="text/css" href="css/theme.css" rel="stylesheet">
	<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
</head>
<body>
<?php include('include/header.php');?>

	<div class="wrapper">
		<div class="container">
			<div class="row">
<?php include('include/sidebar.php');?>				
			<div class="span9">

										<div class="module">
							<div class="module-head">
								<h3>Category </h3>
							</div>
							<div class="module-body">

									<?php if(isset($_POST['submit']))
{?>
									<div class="alert alert-success">
										<button type="button" class="close" data-dismiss="alert">×</button>
									<strong>Well done!</strong>	<?php echo htmlentities($_SESSION['msg']);?><?php echo htmlentities($_SESSION['msg']="");?>
									</div>
<?php } ?>


									<?php if(isset($_GET['del']))
{?>
									<div class="alert alert-error">
										<button type="button" class="close" data-dismiss="alert">×</button>
									<strong>Oh snap!</strong> 	<?php echo htmlentities($_SESSION['delmsg']);?><?php echo htmlentities($_SESSION['delmsg']="");?>
									</div>
<?php } ?>

									<br />

			<form class="form-horizontal row-fluid" name="subcategory" method="post" >

									
<div class="control-group">
<label class="control-label" for="basicinput">Student Details</label>
<div class="controls">
	<?php 
  $id=intval($_GET['id']);
  $ret=mysqli_query($con,"select * from students where gradeA is Not Null and id ='$id' ");
while($result=mysqli_fetch_array($ret)){?>
<input type="text"  name="RegNo" class="span8 tip" readonly="" value="<?php echo htmlentities($result['RegNo']);?>">
<?php } ?>
</div>
</div>

									
<div class="control-group">
<label class="control-label" for="basicinput">Insert Defense Grade</label>
<div class="controls">
<input type="number" name="Defense" class="span8 tip" required>
<p class="help-text" style="color: red;">Range between 0 - 40</p></div>




	<div class="control-group">
											<div class="controls">
												<button type="submit" name="submit" class="btn btn-primary">Create</button>
											</div>
										</div>
									</form>
							</div>
						</div>



					<div class="content">

						
							<div class="module-body">

							</div>
						</div>


	<div class="module">
							<div class="module-head">
								<h3>Categories</h3>
							</div>
							<div class="module-body table">
								<table cellpadding="0" cellspacing="0" border="0" class="datatable-1 table table-bordered table-striped	 display" width="100%">
									<thead>
										<tr>
											<th>#</th>
											<th> Name</th>
											<th>Reg No </th>
											<th> SupervisorName</th>
											<th>Supervisor Grade  </th>
											<th> Defense Grade  </th>
											<th>Grade</th>
											<th>Add Defense Grade  </th>
											
											
										</tr>
									</thead>
									<tbody>

		<?php $query=mysqli_query($con,"SELECT * FROM students where gradeA is Not Null");
				$cnt=1;
while($row=mysqli_fetch_array($query))
{
?>									
										<tr>
											<td><?php echo htmlentities($cnt);?></td>
											<td><?php echo htmlentities($row['fullName']);?></td>
											<td><?php echo htmlentities($row['RegNo']);?></td>
											<td><?php echo htmlentities($row['SupervisorName']);?></td>
											<td><?php echo htmlentities($row['gradeA']);?></td>
											<td>
												<?php 
												$status=$row['gradeB'];
												if($status==NULL)
												{ ?>
												Not Yet Grade
												<?php }
												else {
												?>
												<?php

												 echo ($status);
												 }
												?>
	
												</td> 
													<td align="center">
<?php 
$status=$row['gradeB'];
$statusN=$row['grade'];

if($status==NULL)
{ ?>
Awaiting Defense Compliation
<?php }
else {
?>
<?php

 echo ($statusN);
 }
?>

        </td>
        <td align="center">
<?php 
$statusN=$row['grade'];

if ($statusN==NULL)
{?>
  <a class="icon-edit" href="DefenseGrade.php?id=<?php echo htmlentities($row['id']);?>" onClick="return confirm('Are you sure you want to edit grades?')"></a>
<?php }
else{  	
 echo "DONE";
 }
?>

        </td>
								
										</tr>
										<?php $cnt=$cnt+1; } ?>
										
								</table>
							</div>
						</div>						

						
						
					</div><!--/.content-->
				</div><!--/.span9-->
			</div>
		</div><!--/.container-->
	</div><!--/.wrapper-->

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
										