<%@page import="com.letslearn.Dao.ParentDao"%>
<%@page import="java.util.List"%>
<%@page import="com.letslearn.DBcon.DbCon"%>
<%@page import="com.letslearn.Modal.*"%>
<%
ParentDao parentDao = new ParentDao(DbCon.getConnection());
List<Parent> parents = parentDao.getAllParents();

Admin authin = (Admin) request.getSession().getAttribute("auth");
if (authin != null) {
	System.out.println("gmmac");
} else {
	response.sendRedirect("auth-login.jsp");
}
%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/bootstrap.css">

<link rel="stylesheet" href="assets/vendors/iconly/bold.css">
<link rel="stylesheet" href="assets/vendors/simple-datatables/style.css">

<link rel="stylesheet"
	href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet"
	href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="assets/css/app.css">
<link rel="shortcut icon" href="assets/images/favicon.svg"
	type="image/x-icon">
</head>

<body>
	<div id="app">
		<div id="sidebar" class="active">
			<div class="sidebar-wrapper active">
				<div class="sidebar-header px-0 pb-0">
					<div class="d-flex justify-content-between">
						<div>
							<img src="assets/images/logo/logo.png" class="h-100 w-100"
								alt="Logo" srcset="">
						</div>
						<div class="toggler">
							<a href="#" class="sidebar-hide d-xl-none d-block"><i
								class="bi bi-x bi-middle"></i></a>
						</div>
					</div>
				</div>
				<div class="sidebar-menu">
					<ul class="menu px-3">
						<li class="sidebar-title">Admin Dashboard</li>
						<li class="sidebar-item"><a href="studentManagement.jsp"
							class='sidebar-link'> <i class="bi bi-grid-fill"></i> <span>Student
									Management</span>
						</a></li>
						<li class="sidebar-item  "><a href="teacherManagement.jsp"
							class='sidebar-link'> <i class="bi bi-grid-1x2-fill"></i> <span>Teacher
									Management</span>
						</a></li>

						<li class="sidebar-item  active"><a
							href="parentManagement.jsp" class='sidebar-link'> <i
								class="bi bi-file-earmark-spreadsheet-fill"></i> <span>Parent
									Management</span>
						</a></li>
						<li class="sidebar-title">Profile</li>

						<li class="sidebar-item  "><a href="LogoutServlet"
							class='sidebar-link'> <i class="bi bi-life-preserver"></i> <span>Logout</span>
						</a></li>
					</ul>
				</div>
				<button class="sidebar-toggler btn x">
					<i data-feather="x"></i>
				</button>
			</div>
		</div>
		<div id="main">
			<header class="mb-3">
				<a href="#" class="burger-btn d-block d-xl-none"> <i
					class="bi bi-justify fs-3"></i>
				</a>
			</header>
			<div class="page-heading">
				<h3>Parent Management</h3>
			</div>
			<section class="section">
				<div class="card">
					<div class="card-header d-flex justify-content-between">
						<h4>Parent List</h4>
						<div>
							<button class="btn btn-primary" data-bs-toggle="modal"
								data-bs-target="#staticBackdrop">Add Parent</button>
						</div>
					</div>

					<div class="card-body">
						<table class="table table-hover" id="table1">
							<thead>
								<tr>
									<th>Father Name</th>
									<th>Mother Name</th>
									<th>Father NIC</th>
									<th>Mother NIC</th>
									<th>Student Email</th>
									<th>Married</th>
									<th>Telephone</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>
								<%
								for (Parent parent : parents) {
								%>
								<tr>
									<td><%=parent.getFatherName()%></td>
									<td><%=parent.getMotherName()%></td>
									<td><%=parent.getFatherNic()%></td>
									<td><%=parent.getMotherNic()%></td>
									<td><%=parent.getStudentEmail()%></td>
									<td><%=parent.getMarried()%></td>
									<td><%=parent.getTelephone()%></td>
									<td><a
										href="ParentServlet?action=delete&id=<%=parent.getId()%>">
											<span class="badge bg-danger py-2" style="cursor: pointer;">Delete</span>
									</a> 
									<a href="#" class="edit-link" data-bs-toggle="modal"
										data-bs-target="#updateStaticBackdrop"
										data-parent-id="<%=parent.getId()%>"
										data-parent-fparent="<%=parent.getFatherName()%>"
										data-parent-mparent="<%=parent.getMotherName()%>"
										data-parent-studentEmail="<%=parent.getStudentEmail()%>"
										data-parent-parentCity="<%=parent.getCity()%>"
										data-parent-fparentNic="<%=parent.getFatherNic()%>"
										data-parent-mparentNic="<%=parent.getMotherNic()%>"
										data-parent-parentMarried="<%=parent.getMarried()%>"
										data-parent-parentTel="<%=parent.getTelephone()%>"> <span
											class="badge bg-warning py-2" style="cursor: pointer;">Edit</span>
									</a>
									</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</section>
			<!-- updateModal -->
			<div class="modal fade" id="updateStaticBackdrop"
				data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="updateStaticBackdrops">Edit
								Parent</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form class="row g-3 needs-validation" action="ParentServlet"
								method="POST">
								<input type="hidden" value="update" name="action" /> 
								<input type="hidden" name="id" id="parentId"/>
								<div class="row">
									<div class="col-md-6 position-relative">
										<label for="validationTooltip01" class="form-label">Father
											Name</label> <input type="text" id="fparentName" name="fatherName"
											class="form-control" required title="Enter Name">

									</div>
									<div class="col-md-6 position-relative">
										<label for="validationTooltip02" class="form-label">Mother
											Name</label> <input type="text" name="motherName" id="mparentName"
											class="form-control" required title="Enter Name">

									</div>
								</div>


								<div class="row">
									<div class="col-md-6 position-relative d-none">
										<label for="validationTooltipUsername" class="form-label">Student
											Email</label>
										<div class="input-group has-validation">
											<input type="email" class="form-control" id="studentEmail"
												name="studentEmail" title="Enter Email">

										</div>
									</div>
									<div class="col-md-6 position-relative">
										<label for="validationTooltip03" class="form-label">City</label>
										<input type="text" class="form-control" id="parentCity"
											required name="city" title="Enter City">

									</div>
								</div>

								<div class="row">
									<div class="col-md-6 position-relative">
										<label for="validationTooltip03" class="form-label">Father
											NIC</label> <input type="text" class="form-control" required
											pattern="^\d{12}$" maxlength="12" title="Enter NIC"
											id="fparentNic" name="fatherNic">
									</div>
									<div class="col-md-6 position-relative">
										<label for="validationTooltip03" class="form-label">Mother
											NIC</label> <input type="text" class="form-control" required
											pattern="^\d{12}$" maxlength="12" id="mparentNic"
											name="motherNic" title="Enter NIC">

									</div>
								</div>
								<div class="row">
									<div class="col-md-6 position-relative">
										<label for="validationTooltip05" class="form-label">Telephone</label>
										<input type="text" class="form-control" required
											pattern="^\d{10}$" maxlength="10" name="telephone"
											id="parentTel" title="Enter Phone number">

									</div>
									<div class="col-md-6 position-relative">
										<label for="validationTooltip05" class="form-label">Marital
											Status</label> <select class="form-select" id="parentMarried"
											name="married" required>
											<option value="married">Married</option>
											<option value="divorce">Divoreced</option>
										</select>
									</div>
								</div>
								<div class="mt-5 d-flex justify-content-end">
									<button type="button" class="btn btn-secondary mx-3"
										data-bs-dismiss="modal">Close</button>
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- modalEnds Here -->

			<!-- Modal -->
			<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
				data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">Add New
								Parent</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form class="row g-3 needs-validation" action="ParentServlet"
								method="POST">
								<input type="hidden" value="addParent" name="action" />
								<div class="col-md-6 position-relative">
									<label for="validationTooltip01" class="form-label">Father
										Name</label> <input type="text" class="form-control" name="fatherName"
										required title="Enter Name">

								</div>
								<div class="col-md-6 position-relative">
									<label for="validationTooltip02" class="form-label">Mother
										Name</label> <input type="text" class="form-control" name="motherName"
										required title="Enter Name">

								</div>
								<div class="col-md-6 position-relative">
									<label for="validationTooltipUsername" class="form-label">Student
										Email</label>
									<div class="input-group has-validation">
										<input type="email" class="form-control" required
											name="studentEmail" title="Enter Email">

									</div>
								</div>
								<div class="col-md-6 position-relative">
									<label for="validationTooltip03" class="form-label">City</label>
									<input type="text" class="form-control" required name="city"
										title="Enter City">

								</div>
								<div class="col-md-6 position-relative">
									<label for="validationTooltip03" class="form-label">Father
										NIC</label> <input type="text" class="form-control" required
										name="fatherNic" pattern="^\d{12}$" maxlength="12"
										title="Enter NIC">
								</div>
								<div class="col-md-6 position-relative">
									<label for="validationTooltip03" class="form-label">Mother
										NIC</label> <input type="text" class="form-control" required
										pattern="^\d{12}$" maxlength="12" title="Enter NIC"
										name="motherNic">

								</div>

								<div class="col-md-6 position-relative">
									<label for="validationTooltip05" class="form-label">Telephone</label>
									<input type="text" class="form-control" required
										pattern="^\d{10}$" maxlength="10" title="Enter Phone number"
										name="telephone">

								</div>
								<div class="col-md-6 position-relative">
									<label for="validationTooltip05" class="form-label">Marital
										Status</label> <select class="form-select" name="married" required>
										<option value="married">Married</option>
										<option value="divorce">Divoreced</option>
									</select>
								</div>
								<div class="d-flex justify-content-end">
									<button type="button" class="btn btn-secondary mx-3"
										data-bs-dismiss="modal">Close</button>
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

			<footer>
				<div class="footer clearfix mb-0 text-muted">
					<div class="float-start">
						<p>2023 &copy; OOP</p>
					</div>
					<div class="float-end">
						<p>
							Crafted with <span class="text-danger"><i
								class="bi bi-heart"></i></span> For <a href="#">OOP Module</a>
						</p>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendors/simple-datatables/simple-datatables.js"></script>

	<script>
		// Wait for the document to be fully loaded
		document.addEventListener('DOMContentLoaded', function() {
			// Simple Datatable
			let table1 = document.querySelector('#table1');
			let dataTable = new simpleDatatables.DataTable(table1);
			
			document.querySelectorAll('.edit-link').forEach(link => {
			    link.addEventListener('click', function () {
			        const modal = document.getElementById('updateStaticBackdrop');
			        const fparentName = link.getAttribute('data-parent-fparent');
			        const pid = link.getAttribute('data-parent-id');
			        const mparentName = link.getAttribute('data-parent-mparent');
			        const studentEmail = link.getAttribute('data-parent-studentEmail');
			        const parentCity = link.getAttribute('data-parent-parentCity');
			        const fparentNic = link.getAttribute('data-parent-fparentNic');
			        const mparentNic = link.getAttribute('data-parent-mparentNic');
			        const parentMarried = link.getAttribute('data-parent-parentMarried');
			        const parentTel = link.getAttribute('data-parent-parentTel');
			        
			        // Update modal content with parent details
			        document.getElementById('fparentName').value = fparentName;
			        document.getElementById('parentId').value = pid;
			        document.getElementById('mparentName').value = mparentName;
			        document.getElementById('studentEmail').value = studentEmail;
			        document.getElementById('parentCity').value = parentCity;
			        document.getElementById('fparentNic').value = fparentNic;
			        document.getElementById('mparentNic').value = mparentNic;
			        document.getElementById('parentMarried').value = parentMarried;
			        document.getElementById('parentTel').value = parentTel;
			    });
			});
		});
	</script>

	<script src="assets/js/main.js"></script>
	<!-- Your HTML code above -->

	<!-- JavaScript to update modal content when "Edit" link is clicked -->
	<script>
	
</script>
	<!-- The rest of your HTML code -->

</body>

</html>