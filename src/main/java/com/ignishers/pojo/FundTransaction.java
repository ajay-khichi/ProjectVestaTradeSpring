package com.ignishers.pojo;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Table;

import com.ignishers.enums.FundStatus;
import com.ignishers.enums.FundType;

@Entity
@Table(name = "fund_transactions")
public class FundTransaction {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Long walletId;               // FK → wallets

    @Column(nullable = false, precision = 15, scale = 2)
    private BigDecimal amount;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private FundType fundType;           // DEPOSIT, WITHDRAWAL

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private FundStatus status;           // PENDING, SUCCESS, FAILED

    @Column(nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        this.createdAt = LocalDateTime.now();
        this.status    = FundStatus.PENDING;
    }

	public FundTransaction() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FundTransaction(Long id, Long walletId, BigDecimal amount, FundType fundType, FundStatus status,
			LocalDateTime createdAt) {
		super();
		this.id = id;
		this.walletId = walletId;
		this.amount = amount;
		this.fundType = fundType;
		this.status = status;
		this.createdAt = createdAt;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getWalletId() {
		return walletId;
	}

	public void setWalletId(Long walletId) {
		this.walletId = walletId;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public FundType getFundType() {
		return fundType;
	}

	public void setFundType(FundType fundType) {
		this.fundType = fundType;
	}

	public FundStatus getStatus() {
		return status;
	}

	public void setStatus(FundStatus status) {
		this.status = status;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}
    
}
