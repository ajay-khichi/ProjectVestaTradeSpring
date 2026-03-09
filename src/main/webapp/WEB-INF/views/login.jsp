<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Login | VestaTrade</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;500;600;700&family=DM+Mono:wght@300;400;500&display=swap"/>
  <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
<%@include file="header.jsp" %>
<div class="auth-wrap">

  <!-- LEFT PANEL -->
  <div class="auth-left">
    <div class="auth-left-bg"></div>
    <div class="auth-left-grid"></div>
    <a href="index" class="navbar-brand">Vesta<span>Trade</span></a>
    <div>
      <h2>Welcome Back, Trader.</h2>
      <p class="text-muted mb-4" style="font-size:.9rem">Sign in to access your portfolio, live market data, and trading tools.</p>
      <div>
        <div class="auth-feature">
          <div class="af-icon" style="background:rgba(0,212,255,.1);color:var(--accent)"><i class="bi bi-lightning-fill"></i></div>
          <div class="af-text"><strong>Instant Order Execution</strong><br>Sub-millisecond trade placement</div>
        </div>
        <div class="auth-feature">
          <div class="af-icon" style="background:rgba(0,255,135,.1);color:var(--green)"><i class="bi bi-shield-check-fill"></i></div>
          <div class="af-text"><strong>Bank-Grade Security</strong><br>256-bit encrypted platform</div>
        </div>
        <div class="auth-feature">
          <div class="af-icon" style="background:rgba(255,107,53,.1);color:var(--orange)"><i class="bi bi-graph-up-arrow"></i></div>
          <div class="af-text"><strong>Real-Time Portfolio</strong><br>Live P&amp;L and market depth</div>
        </div>
      </div>
    </div>
    <div class="auth-ticker">
      <div>NIFTY <span class="t-up">▲24,832</span></div>
      <div>SENSEX <span class="t-up">▲81,454</span></div>
      <div>USDINR <span class="t-up">▲83.42</span></div>
      <div>GOLD <span class="t-dn">▼72,450</span></div>
    </div>
  </div>

  <!-- RIGHT PANEL -->
  <div class="auth-right">
    <div class="auth-card">
      <h3>Sign In</h3>
      <p class="auth-sub">Enter your credentials to continue</p>

      <!-- Spring Boot: POST /api/auth/login -->
      <!-- On success: redirect to dashboard -->
      <!-- On failure: return with ?error=true and show error message -->
      <%
      	String msg = (String)request.getAttribute("msg");
      	if(msg!=null)
      		out.print(msg);
      %>
      <form action="checkUser" method="post">
        <div class="mb-3">
          <label class="form-label">Email *</label>
          <input type="email" name="email" class="form-control" placeholder="rahul@email.com" required/>
        </div>
        <div class="mb-3">
          <label class="form-label">Password *</label>
          <input type="password" name="password" class="form-control" placeholder="Enter your password" required/>
        </div>
        <button type="submit" class="btn-primary d-block w-100">
          Sign In <i class="bi bi-arrow-right ms-2"></i>
        </button>
      </form>

      <div class="sec-badge mt-4">
        <i class="bi bi-shield-check-fill"></i>
        256-bit encrypted &nbsp;·&nbsp; SEBI registered &nbsp;·&nbsp; CDSL &amp; NSDL DP
      </div>

      <p class="text-center text-muted mt-4" style="font-size:.85rem">
        Don't have an account? <a href="signup" class="text-accent fw-bold">Register now →</a>
      </p>
    </div>
  </div>

</div>
<%@include file="footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>
