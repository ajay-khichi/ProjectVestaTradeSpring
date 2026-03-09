package com.ignishers.pojo;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Table;

@Entity
@Table(name = "stocks")
public class Stock {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String symbol;

    @Column(nullable = false)
    private String companyName;

    @Column(nullable = false, precision = 12, scale = 2)
    private BigDecimal currentPrice;

    @Column(nullable = false, precision = 12, scale = 2)
    private BigDecimal previousClose;    // needed to calculate % change

    @Column(nullable = false)
    private Long availableShares;

    @Column(nullable = false)
    private boolean active;

    @PrePersist
    protected void onCreate() {
        this.active = true;
    }

	public Stock() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Stock(Long id, String symbol, String companyName, BigDecimal currentPrice, BigDecimal previousClose,
			Long availableShares, boolean active) {
		super();
		this.id = id;
		this.symbol = symbol;
		this.companyName = companyName;
		this.currentPrice = currentPrice;
		this.previousClose = previousClose;
		this.availableShares = availableShares;
		this.active = active;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSymbol() {
		return symbol;
	}

	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public BigDecimal getCurrentPrice() {
		return currentPrice;
	}

	public void setCurrentPrice(BigDecimal currentPrice) {
		this.currentPrice = currentPrice;
	}

	public BigDecimal getPreviousClose() {
		return previousClose;
	}

	public void setPreviousClose(BigDecimal previousClose) {
		this.previousClose = previousClose;
	}

	public Long getAvailableShares() {
		return availableShares;
	}

	public void setAvailableShares(Long availableShares) {
		this.availableShares = availableShares;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}
}
