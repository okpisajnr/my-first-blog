<div class="span3">
					<div class="sidebar">


<ul class="widget widget-menu unstyled">
							    <li><a href="dashboard.php"><i class="menu-icon icon-dashboard"></i> DashBoard </a></li>
                            
							<li>
								<a class="collapsed" data-toggle="collapse" href="#togglePages">
									<i class="menu-icon icon-cog"></i>
									<i class="icon-chevron-down pull-right"></i><i class="icon-chevron-up pull-right"></i>
									Manage Projects
								</a>
								<ul id="togglePages" class="collapse unstyled">
				
									<li>
										<a href="closed-complaint.php">
											<i class="icon-inbox"></i>
											Completed Projects
	     <?php 
  $status="Completed";                   
$rt = mysqli_query($con,"SELECT * FROM tblproject where status='$status'");
$num1 = mysqli_num_rows($rt);
{?><b class="label green pull-right"><?php echo htmlentities($num1); ?></b>
<?php } ?>

										</a>
									</li>
								</ul>
							</li>
							
							<li>
								<a href="manage-users.php">
									<i class="menu-icon icon-group"></i>
									Manage Students
								</a>
							</li>
							<li>
								<a href="manage-supervisors.php">
									<i class="menu-icon icon-group"></i>
									Manage Supervisors
								</a>
							</li>
						</ul>


						<ul class="widget widget-menu unstyled">
                                <li><a href="category.php"><i class="menu-icon icon-tasks"></i> Category </a></li>
                                <li><a href="subcategory.php"><i class="menu-icon icon-tasks"></i>Add Sub-Field </a></li>
                               
                        
                            </ul><!--/.widget-nav-->

						<ul class="widget widget-menu unstyled">

							<li>
								<a href="logout.php">
									<i class="menu-icon icon-signout"></i>
									Logout
								</a>
							</li>	
						</ul>

					</div><!--/.sidebar-->
				</div><!--/.span3-->
