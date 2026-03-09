<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/><meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Contact Us | VestaTrade</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;500;600;700&family=DM+Mono:wght@300;400;500&display=swap"/>
  <link rel="stylesheet" href="css/style.css"/>
</head>
<body>

<%@include file="header.jsp" %>

<div class="page-header">
  <div class="container">
    <span class="section-tag">Get in Touch</span>
    <h1>We're Here to Help</h1>
    <p>Reach out for support, account queries, or partnership inquiries. We respond within 24 hours.</p>
  </div>
</div>

<div class="container py-5">

  <!-- CONTACT METHODS -->
  <div class="row g-3 mb-5">
    <div class="col-md-6 col-lg-3">
      <div class="contact-method">
        <div class="cm-icon" style="background:rgba(0,212,255,.1);color:var(--accent)"><i class="bi bi-chat-dots-fill"></i></div>
        <div><h6>Live Chat</h6><p>Chat with our support team instantly</p><span class="badge-ok mt-1 d-inline-block">â Available Now</span></div>
      </div>
    </div>
    <div class="col-md-6 col-lg-3">
      <div class="contact-method">
        <div class="cm-icon" style="background:rgba(0,255,135,.1);color:var(--green)"><i class="bi bi-envelope-fill"></i></div>
        <div><h6>Email Support</h6><a href="mailto:support@vestatrade.in">support@vestatrade.in</a><p class="mt-1">Response within 12 hours</p></div>
      </div>
    </div>
    <div class="col-md-6 col-lg-3">
      <div class="contact-method">
        <div class="cm-icon" style="background:rgba(255,107,53,.1);color:var(--orange)"><i class="bi bi-telephone-fill"></i></div>
        <div><h6>Phone Support</h6><a href="tel:18001234567">1800-123-4567</a><p class="mt-1"><span class="badge-hr">MonâFri 9AMâ6PM IST</span></p></div>
      </div>
    </div>
    <div class="col-md-6 col-lg-3">
      <div class="contact-method">
        <div class="cm-icon" style="background:rgba(255,69,96,.1);color:var(--red)"><i class="bi bi-question-circle-fill"></i></div>
        <div><h6>Help Center</h6><a href="#">help.vestatrade.in</a><p class="mt-1">500+ articles &amp; guides</p></div>
      </div>
    </div>
  </div>

  <div class="row g-4">
    <!-- FORM -->
    <div class="col-lg-7">
      <div class="card">
        <h4 class="fw-bold mb-1">Send us a Message</h4>
        <p class="text-muted mb-4" style="font-size:.88rem">We'll get back to you within 24 business hours.</p>

        <div id="successMsg" style="display:none;background:rgba(0,255,135,.08);border:1px solid rgba(0,255,135,.25);border-radius:9px;padding:18px;color:var(--green);text-align:center;margin-bottom:20px">
          <i class="bi bi-check-circle-fill fs-3 d-block mb-2"></i><strong>Message Sent!</strong><br>We'll get back to you within 24 hours.
        </div>

        <div id="contactForm">
          <div class="row g-3">
            <div class="col-md-6"><label class="form-label">First Name *</label><input type="text" class="form-control" placeholder="Rahul" id="fname"></div>
            <div class="col-md-6"><label class="form-label">Last Name *</label><input type="text" class="form-control" placeholder="Kumar" id="lname"></div>
            <div class="col-md-6"><label class="form-label">Email Address *</label><input type="email" class="form-control" placeholder="rahul@email.com" id="email"></div>
            <div class="col-md-6"><label class="form-label">Phone Number</label><input type="tel" class="form-control" placeholder="+91 98765 43210"></div>
            <div class="col-12">
              <label class="form-label">Subject *</label>
              <select class="form-select" id="subject">
                <option value="">Select a topic</option>
                <option>Account Opening</option><option>KYC Verification</option>
                <option>Fund Transfer Issue</option><option>Trading Platform Support</option>
                <option>Brokerage &amp; Charges</option><option>Partnership Inquiry</option>
                <option>General Inquiry</option><option>Complaint / Grievance</option>
              </select>
            </div>
            <div class="col-12"><label class="form-label">Message *</label><textarea class="form-control" placeholder="Describe your queryâ¦" id="message"></textarea></div>
            <div class="col-12">
              <div class="form-check mb-3">
                <input class="form-check-input" type="checkbox" id="consent">
                <label class="form-check-label text-muted" for="consent" style="font-size:.82rem">I agree to the <a href="#" class="text-accent">Privacy Policy</a> and consent to being contacted.</label>
              </div>
              <button class="btn-primary d-block w-100" onclick="submitContact()">Send Message <i class="bi bi-send ms-2"></i></button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- SIDEBAR -->
    <div class="col-lg-5">
      <span class="section-tag">Offices</span>
      <div class="row g-3 mb-4 mt-1">
        <div class="col-12">
          <div class="card card-sm">
            <span class="badge-hr d-inline-block mb-2">Headquarters</span>
            <h6 class="fw-bold mb-1">Mumbai Office</h6>
            <p class="text-muted mb-0" style="font-size:.86rem"><i class="bi bi-geo-alt text-accent me-1"></i>VestaTrade House, 14th Floor,<br>Bandra Kurla Complex, Mumbai â 400 051</p>
          </div>
        </div>
        <div class="col-12">
          <div class="card card-sm">
            <span class="badge-hr d-inline-block mb-2">Tech Hub</span>
            <h6 class="fw-bold mb-1">Bangalore Office</h6>
            <p class="text-muted mb-0" style="font-size:.86rem"><i class="bi bi-geo-alt text-accent me-1"></i>Prestige Tech Park, Block A,<br>Outer Ring Road, Bangalore â 560 103</p>
          </div>
        </div>
      </div>

      <span class="section-tag">System Status</span>
      <div class="card card-sm mt-2">
        <div class="d-flex justify-content-between align-items-center pb-3 mb-1" style="border-bottom:1px solid var(--border)">
          <span class="fw-bold" style="font-size:.9rem">Platform Status</span>
          <span class="text-green" style="font-size:.78rem;font-family:var(--mono)">â All Systems Operational</span>
        </div>
        <div class="status-row"><span class="status-name">Trading Engine</span><div class="d-flex align-items-center gap-2"><div class="dot-ok"></div><span class="lbl-ok">Operational</span></div></div>
        <div class="status-row"><span class="status-name">Order Management</span><div class="d-flex align-items-center gap-2"><div class="dot-ok"></div><span class="lbl-ok">Operational</span></div></div>
        <div class="status-row"><span class="status-name">Market Data Feed</span><div class="d-flex align-items-center gap-2"><div class="dot-ok"></div><span class="lbl-ok">Operational</span></div></div>
        <div class="status-row"><span class="status-name">Mobile App</span><div class="d-flex align-items-center gap-2"><div class="dot-ok"></div><span class="lbl-ok">Operational</span></div></div>
        <div class="status-row"><span class="status-name">Payments</span><div class="d-flex align-items-center gap-2"><div class="dot-ok"></div><span class="lbl-ok">Operational</span></div></div>
      </div>
    </div>
  </div>
</div>

<%@include file="footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>
