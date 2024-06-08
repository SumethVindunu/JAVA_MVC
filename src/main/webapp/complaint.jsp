<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List"%>
<%@page import="com.letslearn.DBcon.DbCon"%>
<%@page import="com.letslearn.Dao.*"%>
<%@page import="java.util.*"%>
<%@page import="com.letslearn.Modal.*"%>
<!DOCTYPE html>
<html>
<%
ComplainDao complaintDao = new ComplainDao(DbCon.getConnection());
List<Complaint> complaints = complaintDao.getAllComplaints();

User authin = (User) request.getSession().getAttribute("authUser");
if (authin != null) {
	System.out.println("gmmac");
} else {
	response.sendRedirect("auth-login-user.jsp");
}
%>
<head>
<meta charset="UTF-8">
<title>UserDashboard</title>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Dashboard</title>

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
						<li class="sidebar-title">User Dashboard</li>

						<li class="sidebar-item active "><a
							href="complaintManagement.jsp" class='sidebar-link'> <i
								class="bi bi-grid-fill"></i> <span>Add User Information</span>
						</a></li>

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
				<h3>User Dashboard</h3>
			</div>
			<section class="section">
				<div class="card">
					<div class="card-header d-flex justify-content-between">
						<h4>User Info</h4>
						<div>
							<button class="btn btn-primary" data-bs-toggle="modal"
								data-bs-target="#staticBackdrop">Add User Information</button>
						</div>
					</div>
					<div class="card-body">
						<table class="table table-hover" id="table1">
							<thead>
								<tr>
									<th>Name</th>
									<th>Email</th>
									<th>Phone</th>
									<th>About</th>
									<th>NIC</th>
									<th>Gender</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>
								<%
								for (Complaint complaint : complaints) {
								%>
								<tr>
									<td><%=complaint.getName()%></td>
									<td><%=complaint.getEmail()%></td>
									<td><%=complaint.getTelephone()%></td>
									<td><%=complaint.getAbout()%></td>
									<td><%=complaint.getNic()%></td>
									<td><%=complaint.getTypeComp()%></td>
									<td><a
										href="ComplaintServlet?action=delete&id=<%=complaint.getId()%>"><span
											class="badge bg-danger py-2" style="cursor: pointer;">Delete</span>
									</a> 
									<a href="#" class="edit-link" data-bs-toggle="modal"
										data-bs-target="#updateStaticBackdrop"
										data-complaint-name="<%=complaint.getName()%>"
										data-complaint-email="<%=complaint.getEmail()%>"
										data-complaint-tel="<%=complaint.getTelephone()%>"
										data-complaint-about="<%=complaint.getAbout()%>"
										data-complaint-nic="<%=complaint.getNic()%>"
										data-complaint-id="<%=complaint.getId()%>"
										data-complaint-type="<%=complaint.getTypeComp()%>"> <span
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

			<!-- update Modal -->
			<div class="modal fade" id="updateStaticBackdrop"
				data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="updateStaticBackdrop">Edit
								Complaint</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form class="row g-3 needs-validation" action="ComplaintServlet"
								method="POST">
								<input type="hidden" value="update" name="action" />
								<input type="hidden" id="hiddenId" name="id" />
								<div class="row">
									<div class="col-md-12 position-relative">
										<label for="validationTooltip01" class="form-label">Name</label>
										<input type="text" class="form-control" name="fname"
											id="fname" required>

									</div>

									<div class="col-md-6 position-relative d-none">
										<label for="validationTooltipUsername" class="form-label">Email</label>
										<div class="input-group has-validation">
											<input type="email" class="form-control" name="email" id="email"
												title="Enter Email" id="email">

										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 position-relative">
										<label for="validationTooltip03" class="form-label">About</label>
										<input type="text" class="form-control" name="about" id="about"
											title="Enter City" required>

									</div>
									<div class="col-md-6 position-relative">
										<label for="validationTooltip05" class="form-label">NIC</label>
										<input pattern="^\d{12}$" maxlength="12" name="nic" id="nic"
											type="text" class="form-control" title="Enter NIC" required>

									</div>
								</div>

								<div class="row">
									<div class="col-md-6 position-relative">
										<label for="validationTooltip04" class="form-label">Gender</label>
										<select class="form-select" name="typeComp" id="typeComp" required>
											<option value="lost good">Male</option>
											<option value="raging">Female</option>
											<option value="teacher">Prefer not to say</option>
										</select>
										<div class="invalid-tooltip">Please select a valid
											Type.</div>
									</div>
									<div class="col-md-6 position-relative">
										<label for="validationTooltip06" class="form-label">Telephone</label>
										<input type="text" class="form-control" id="tel"
											title="Enter Phone number" name="tel" required
											pattern="^\d{10}$" maxlength="10">

									</div>
								</div>


								<div class="mt-3 d-flex justify-content-end">
									<button type="button" class="btn btn-secondary mx-3"
										data-bs-dismiss="modal">Close</button>
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
				data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">Add New
								Complaint</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form class="row g-3 needs-validation" action="ComplaintServlet"
								method="POST">
								<input type="hidden" value="addComplaint" name="action" />

								<div class="col-md-6 position-relative">
									<label for="validationTooltip01" class="form-label">Name</label>
									<input type="text" class="form-control" placeholder="Mark"
										name="fname" required>

								</div>

								<div class="col-md-6 position-relative">
									<label for="validationTooltipUsername" class="form-label">Email</label>
									<div class="input-group has-validation">
										<input type="email" class="form-control" name="email"
											title="Enter Email" required>

									</div>
								</div>
								<div class="col-md-6 position-relative">
									<label for="validationTooltip03" class="form-label">About</label>
									<input type="text" name="about" class="form-control"
										title="Enter City" required>

								</div>
								<div class="col-md-6 position-relative">
									<label for="validationTooltip05" class="form-label">NIC</label>
									<input type="text" name="nic" maxlength="12"
										class="form-control" title="Enter NIC" required
										pattern="^\d{12}$">

								</div>

								<div class="col-md-6 position-relative">
									<label for="validationTooltip04" class="form-label">Gender</label>
									<select class="form-select" name="typeComp" required>
										<option value="lost good">Male</option>
											<option value="raging">Female</option>
											<option value="teacher">Prefer not to say</option>
									</select>
									<div class="invalid-tooltip">Please select a valid Type.
									</div>
								</div>


								<div class="col-md-6 position-relative">
									<label for="validationTooltip06" class="form-label">Telephone</label>
									<input type="text" class="form-control" name="tel"
										title="Enter Phone number" required pattern="^\d{10}$"
										maxlength="10">

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

			
		</div>
	</div>
	<script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendors/simple-datatables/simple-datatables.js"></script>

	<script>
		// Simple Datatable
		let table1 = document.querySelector('#table1');
		let dataTable = new simpleDatatables.DataTable(table1);
		
	</script>
	<script src="assets/js/main.js"></script>
	<script>
    // JavaScript to update modal content when "Edit" link is clicked
    document.querySelectorAll('.edit-link').forEach(link => {
        link.addEventListener('click', function () {
            const modal = document.getElementById('updateStaticBackdrop');
            const nameInput = document.getElementById('fname');
            const emailInput = document.getElementById('email'); // Assuming you have an element with the ID 'email'
            const about = document.getElementById('about');
            const nicInput = document.getElementById('nic');
            const typeComp = document.getElementById('typeComp');
            const telInput = document.getElementById('tel');
            const idInput = document.getElementById('hiddenId');

            // Get the data from the attributes
            const complaintName = link.getAttribute('data-complaint-name');
            const complaintEmail = link.getAttribute('data-complaint-email');
            const complaintCity = link.getAttribute('data-complaint-about');
            const complaintNic = link.getAttribute('data-complaint-nic');
            const complaintGrade = link.getAttribute('data-complaint-type');
            const complaintTel = link.getAttribute('data-complaint-tel');
            const complaintId = link.getAttribute('data-complaint-id');

            // Update the modal input fields with the data
            nameInput.value = complaintName;
            emailInput.value = complaintEmail;
            about.value = complaintCity;
            nicInput.value = complaintNic;
            typeComp.value = complaintGrade;
            telInput.value = complaintTel;
            idInput.value = complaintId;
        });
    });
</script>

</body>

</html>