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
	<h2 class="heading">Get Customer by Email Id</h2>
	<%
      	String msg1 = (String)request.getAttribute("msg");
      	if(msg1!=null)
      		out.print(msg1);
      %>
  <form action="getcst" method="post">
        <div class="row g-2">
          <div class="col-12"><label class="form-label">Email *</label>
          <input type="email" name="email" class="form-control" placeholder="rahul@email.com" required/></div>
          

        <button type="submit" class="btn btn-primary d-block w-100 mt-3" name="b1" value="details">
          Get Customer Details <i class="bi bi-arrow-right ms-2"></i>
        </button>
        </div>
  </form>
  <a href="adminhome" class="btn btn-info btn-lg">Back to Home</a><br>
</div>
</div>

<%@include file="footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>
