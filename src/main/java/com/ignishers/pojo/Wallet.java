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
@Table(name = "wallets")
public class Wallet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private Long customerId;             // FK → customers

    @Column(nullable = false, precision = 15, scale = 2)
    private BigDecimal balance;

    @PrePersist
    protected void onCreate() {
        this.balance = BigDecimal.ZERO;
    }

	public Wallet() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Wallet(Long id, Long customerId, BigDecimal balance) {
		super();
		this.id = id;
		this.customerId = customerId;
		this.balance = balance;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}

	public BigDecimal getBalance() {
		return balance;
	}

	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}
    
}
