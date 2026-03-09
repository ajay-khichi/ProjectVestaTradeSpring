<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Create Account | VestaTrade</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;500;600;700&family=DM+Mono:wght@300;400;500&display=swap"/>
  <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
<%@include file="header.jsp" %>
<div class="auth-wrap" style="align-items:flex-start">

  <!-- LEFT PANEL -->
  <div class="auth-left" style="min-height:100vh">
    <div class="auth-left-bg"></div>
    <div class="auth-left-grid"></div>
    <a href="index.html" class="navbar-brand">Vesta<span>Trade</span></a>
    <div>
      <h2>Open Your Free Demat Account</h2>
      <p class="text-muted" style="font-size:.88rem">Join 1.8 million traders. Your account is active within 24 hours of KYC verification.</p>
      <ul style="list-style:none;margin-top:20px;padding:0">
        <li class="auth-feature"><i class="bi bi-check-circle-fill text-green" style="flex-shrink:0"></i><div class="af-text"><strong>100% Free Account Opening</strong><br>No charges, no deposits required</div></li>
        <li class="auth-feature"><i class="bi bi-check-circle-fill text-green" style="flex-shrink:0"></i><div class="af-text"><strong>Zero Brokerage on Delivery</strong><br>Keep more of what you earn</div></li>
        <li class="auth-feature"><i class="bi bi-check-circle-fill text-green" style="flex-shrink:0"></i><div class="af-text"><strong>Paperless KYC in 5 Minutes</strong><br>Aadhaar + PAN based e-KYC</div></li>
        <li class="auth-feature"><i class="bi bi-check-circle-fill text-green" style="flex-shrink:0"></i><div class="af-text"><strong>SEBI Regulated &amp; Insured</strong><br>CDSL/NSDL protected Demat</div></li>
      </ul>
    </div>
    <div class="sec-badge">
      <i class="bi bi-shield-check-fill"></i>
      SEBI Registered &nbsp;·&nbsp; NSE &amp; BSE Member &nbsp;·&nbsp; CDSL DP
    </div>
  </div>
<!-- ------------------------------------------------------------------------------ -->
  <!-- RIGHT PANEL -->
  <div class="auth-right" style="align-items:flex-start;padding-top:40px">
    <div class="auth-card">

      <h3>Create Your Account</h3>
      <p class="auth-sub">Fill in all details below to register</p>

      <!-- Spring Boot: POST /api/auth/register -->
      <!-- On success: redirect to /login?registered=true -->
      <!-- On failure: return with field errors via BindingResult -->
      <%
      	String msg = (String)request.getAttribute("msg");
      	if(msg!=null)
      		out.print(msg);
      %>
      <!-- PERSONAL DETAILS -->
      <form action="register" method="post">

        <p class="section-tag mt-2">Personal Details</p>
        <div class="row g-2">
          <div class="col-6"><label class="form-label">First Name *</label>
          <input type="text" name="firstName" class="form-control" placeholder="Rahul" required/></div>
          
          <div class="col-6"><label class="form-label">Last Name *</label>
          <input type="text" name="lastName" class="form-control" placeholder="Kumar" required/></div>
          
          <div class="col-12"><label class="form-label">Email *</label>
          <input type="email" name="email" class="form-control" placeholder="rahul@email.com" required/></div>
          
          <div class="col-12"><label class="form-label">Mobile *</label>
          <input type="tel" name="mobile" class="form-control" placeholder="9876543210" required pattern="[6-9][0-9]{9}" maxlength="10"/></div>
          
          <div class="col-6"><label class="form-label">Date of Birth *</label>
          <input type="date" name="dateOfBirth" class="form-control" required/></div>
          
          <div class="col-6"><label class="form-label">Gender *</label>
            <select name="gender" class="form-select" required>
              <option value="">Select</option>
              <option value="MALE">Male</option>
              <option value="FEMALE">Female</option>
              <option value="OTHER">Other</option>
            </select>
          </div>
        </div>

        <p class="section-tag mt-3">KYC Details</p>
        <div class="row g-2">
          <div class="col-6"><label class="form-label">PAN *</label>
          <input type="text" name="pan" class="form-control" placeholder="ABCDE1234F" required maxlength="10" oninput="this.value=this.value.toUpperCase()"/></div>
          
          <div class="col-6"><label class="form-label">Aadhaar *</label>
          <input type="text" name="aadhar" class="form-control" placeholder="XXXX XXXX XXXX" required maxlength="14" oninput="formatAadhar(this)"/></div>
          
          <div class="col-12"><label class="form-label">Address *</label>
          <textarea name="address" class="form-control" placeholder="Flat, Street, City, State, PIN" required rows="2"></textarea></div>
        </div>

        <p class="section-tag mt-3">Financial Details</p>
        <div class="row g-2">
          <div class="col-6"><label class="form-label">Bank Account *</label>
          <input type="text" name="bankAccount" class="form-control" placeholder="Account number" required maxlength="18"/></div>
          
          <div class="col-6"><label class="form-label">IFSC Code *</label><input type="text" name="ifscCode" class="form-control" placeholder="HDFC0001234" required maxlength="11" oninput="this.value=this.value.toUpperCase()"/></div>
        </div>

        <p class="section-tag mt-3">Password</p>
        <div class="row g-2">
          <div class="col-12"><label class="form-label">Password *</label>
          <input type="password" name="password" class="form-control" placeholder="Min 8 characters" required minlength="8"/></div>
        </div>

        <div class="mt-3">
          <div class="form-check mb-1">
            <input class="form-check-input" type="checkbox" name="termsAccepted" value="true" required/>
            <label class="form-check-label text-muted" style="font-size:.82rem">I agree to <a href="#" class="text-accent">Terms of Service</a> and <a href="#" class="text-accent">Privacy Policy</a></label>
          </div>
          <div class="form-check">
            <input class="form-check-input" type="checkbox" name="riskDisclosure" value="true" required/>
            <label class="form-check-label text-muted" style="font-size:.82rem">I have read the <a href="#" class="text-accent">Risk Disclosure Document</a></label>
          </div>
        </div>

        <button type="submit" class="btn-primary d-block w-100 mt-3">
          Create Account <i class="bi bi-arrow-right ms-2"></i>
        </button>

      </form>

      <p class="text-center text-muted mt-4" style="font-size:.85rem">
        Already have an account? <a href="login.html" class="text-accent fw-bold">Sign in →</a>
      </p>

    </div>
  </div>

</div>
<%@include file="footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>
