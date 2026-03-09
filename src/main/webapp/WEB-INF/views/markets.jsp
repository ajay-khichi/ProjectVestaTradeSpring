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

<%@include file="header.jsp" %>

<div class="page-header">
  <div class="container">
    <nav aria-label="breadcrumb"><ol class="breadcrumb"><li class="breadcrumb-item"><a href="index.jsp">Home</a></li><li class="breadcrumb-item active">Markets</li></ol></nav>
    <div class="row align-items-end g-4">
      <div class="col-lg-5">
        <h1>Market Overview</h1>
        <p>Live prices and data for NSE &amp; BSE listed stocks</p>
      </div>
      <div class="col-lg-7">
        <div class="row g-2">
          <div class="col-6 col-md-3"><div class="stat-mini"><div class="sml">NIFTY 50</div><div class="smv text-green">24,832 <small style="font-size:.7rem">â²1.24%</small></div></div></div>
          <div class="col-6 col-md-3"><div class="stat-mini"><div class="sml">SENSEX</div><div class="smv text-green">81,454 <small style="font-size:.7rem">â²0.98%</small></div></div></div>
          <div class="col-6 col-md-3"><div class="stat-mini"><div class="sml">BANK NIFTY</div><div class="smv text-red">51,234 <small style="font-size:.7rem">â¼0.34%</small></div></div></div>
          <div class="col-6 col-md-3"><div class="stat-mini"><div class="sml">NIFTY IT</div><div class="smv text-green">38,765 <small style="font-size:.7rem">â²1.82%</small></div></div></div>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="container py-5">

  <!-- INDEX CARDS -->
  <div class="row g-3 mb-4">
    <div class="col-6 col-md-3"><div class="idx-card active" onclick="selectIdx(this)"><div class="idx-name">NIFTY 50</div><div class="idx-value">24,832.65</div><div class="chg-up">â² +302.50 (+1.24%)</div></div></div>
    <div class="col-6 col-md-3"><div class="idx-card" onclick="selectIdx(this)"><div class="idx-name">SENSEX</div><div class="idx-value">81,454.32</div><div class="chg-up">â² +792.40 (+0.98%)</div></div></div>
    <div class="col-6 col-md-3"><div class="idx-card" onclick="selectIdx(this)"><div class="idx-name">BANK NIFTY</div><div class="idx-value">51,234.80</div><div class="chg-dn">â¼ -175.60 (-0.34%)</div></div></div>
    <div class="col-6 col-md-3"><div class="idx-card" onclick="selectIdx(this)"><div class="idx-name">NIFTY IT</div><div class="idx-value">38,765.25</div><div class="chg-up">â² +703.10 (+1.82%)</div></div></div>
  </div>

  <!-- FILTERS -->
  <div class="filter-bar">
    <div class="row g-3 align-items-center">
      <div class="col-12 col-md-4">
        <div class="search-wrap">
          <i class="bi bi-search search-icon"></i>
          <input type="text" class="search-input" placeholder="Search stocksâ¦" id="searchInput">
        </div>
      </div>
      <div class="col-6 col-md-2">
        <select class="filter-select" id="sectorFilter">
          <option value="">All Sectors</option>
          <option>IT</option><option>Banking</option><option>Pharma</option>
          <option>Energy</option><option>FMCG</option><option>Auto</option>
        </select>
      </div>
      <div class="col-6 col-md-2">
        <select class="filter-select" id="exchFilter">
          <option value="">NSE + BSE</option><option>NSE</option><option>BSE</option>
        </select>
      </div>
      <div class="col-12 col-md-4">
        <div class="tab-bar">
          <button class="tab-btn active" data-move="all">All</button>
          <button class="tab-btn" data-move="up">Gainers</button>
          <button class="tab-btn" data-move="down">Losers</button>
          <button class="tab-btn" data-move="active">Most Active</button>
        </div>
      </div>
    </div>
  </div>

  <!-- TABLE -->
  <div class="tbl-wrap">
    <div class="table-responsive">
      <table class="table mb-0">
        <thead>
          <tr>
            <th>#</th>
            <th onclick="sortTable('sym')">Symbol <i class="bi bi-chevron-expand" style="font-size:.62rem"></i></th>
            <th onclick="sortTable('price')">LTP <i class="bi bi-chevron-expand" style="font-size:.62rem"></i></th>
            <th onclick="sortTable('chg')">Change <i class="bi bi-chevron-expand" style="font-size:.62rem"></i></th>
            <th onclick="sortTable('pct')">Change % <i class="bi bi-chevron-expand" style="font-size:.62rem"></i></th>
            <th>High</th><th>Low</th>
            <th onclick="sortTable('vol')">Volume <i class="bi bi-chevron-expand" style="font-size:.62rem"></i></th>
            <th>Sector</th><th>Actions</th>
          </tr>
        </thead>
        <tbody id="mktTableBody"></tbody>
      </table>
    </div>
  </div>

  <div class="d-flex justify-content-between align-items-center mt-3 flex-wrap gap-2">
    <p class="text-muted mb-0" style="font-size:.82rem">Showing <span id="rowCount">0</span> stocks Â· Updated: <span class="mono">10:32:14 IST</span></p>
    <nav><ul class="pagination mb-0 gap-1">
      <li class="page-item disabled"><a class="page-link" href="#">Â«</a></li>
      <li class="page-item active"><a class="page-link" href="#">1</a></li>
      <li class="page-item"><a class="page-link" href="#">2</a></li>
      <li class="page-item"><a class="page-link" href="#">3</a></li>
      <li class="page-item"><a class="page-link" href="#">Â»</a></li>
    </ul></nav>
  </div>
</div>

<%@include file="footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>
