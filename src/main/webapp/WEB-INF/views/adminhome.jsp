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

  <!-- FILTERS -->
  <div class="filter-bar">
    <div class="row g-3 align-items-center">
      <div class="col-12 col-md-4">
        <div class="search-wrap">
          <i class="bi bi-search search-icon"></i>
          <input type="text" class="search-input" placeholder="Search stocks" id="searchInput">
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
    <p class="text-muted mb-0" style="font-size:.82rem">Showing <span id="rowCount">0</span> stocks · Updated: <span class="mono">10:32:14 IST</span></p>
    <nav><ul class="pagination mb-0 gap-1">
      <li class="page-item disabled"><a class="page-link" href="#">«</a></li>
      <li class="page-item active"><a class="page-link" href="#">1</a></li>
      <li class="page-item"><a class="page-link" href="#">2</a></li>
      <li class="page-item"><a class="page-link" href="#">3</a></li>
      <li class="page-item"><a class="page-link" href="#">»</a></li>
    </ul></nav>
  </div>
</div>

<%@include file="footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>
