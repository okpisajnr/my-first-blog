<?php
session_start();
include('include/config.php');
if(strlen($_SESSION['alogin'])==0)
  { 
header('location:index.php');
}
else{

 ?>
<script language="javascript" type="text/javascript">
function f2()
{
window.close();
}ser
function f3()
{
window.print(); 
}
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>students Profile</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="anuj.css" rel="stylesheet" type="text/css">
</head>
<body>

<div style="margin-left:50px;">
 <form name="updateticket" id="updateticket" method="post"> 
<table width="100%" border="1" cellspacing="1" cellpadding="1">
<?php 

$ret1=mysqli_query($con,"select * FROM supervisor where id='".$_GET['uid']."'");
while($row=mysqli_fetch_array($ret1))
{
?>

    
   
		
    <tr>
      <td align="center" colspan="2"><b><?php echo $row['fullName'];?>'s profile</b></td>
      
    </tr>
    
    
    <tr>
      <td  >&nbsp;</td>
      <td align="center">SUPERVISORS' PARTICULARS</td>
    </tr>
    <tr height="100">
      <td><b>Email:</b></td>
      <td align="center"><?php echo htmlentities($row['email']); ?></td>
    </tr>
    <tr height="100">
      <td><b>FullName:</b></td>
      <td align="center"><?php echo htmlentities($row['fullName']); ?></td>
    </tr>


      <tr height="100">
      <td><b>contact No:</b></td>
      <td align="center"><?php echo htmlentities($row['contactNo']); ?></td>
    </tr>
    


        <tr height="100">
      <td><b>Specialization:</b></td>
      <td align="center"><?php echo htmlentities($row['field']); ?></td>
    </tr>



    
  
      <td colspan="2" align="center">   
      <input name="Submit2" type="submit" class="txtbox4" value="Close this window " onClick="return f2();" style="cursor: pointer;"  />
    <input name="Submit2" type="submit" class="txtbox4" value="print this window " onClick="return f3();" style="cursor: pointer;"  /></td>
    </tr>
   
    <?php } 

 
    ?>
 
</table>
 </form>
</div>

</body>
</html>

     <?php } ?>