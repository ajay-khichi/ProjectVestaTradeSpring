<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/><meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Markets | VestaTrade</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;500;600;700&family=DM+Mono:wght@300;400;500&display=swap"/>
  <link rel="stylesheet" href="css/style.css"/>
</head>
<body>

<%@include file="headeradmin.jsp" %>


<div class="container py-5">

<div class="d-grid gap-2 col-6 mx-auto">
	<h2 class="heading">Customer Menu</h2>
  <a href="amdcustomer" class="btn btn-secondary btn-lg">Update / Delete / Block Customer</a>
  <a href="getcustomer" class="btn btn-secondary btn-lg">Get Customer</a>
  <a href="getallcst" class="btn btn-secondary btn-lg">All Customers</a>
  <a href="verifypage" class="btn btn-secondary btn-lg">Account Verification</a><br><br>
  <a href="adminhome" class="btn btn-info btn-lg">Back to Home</a><br>
</div>
</div>

<%@include file="footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>
