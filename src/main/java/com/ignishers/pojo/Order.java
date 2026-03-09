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

import com.ignishers.enums.OrderStatus;
import com.ignishers.enums.OrderType;

@Entity
@Table(name = "orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Long customerId;             // FK → customers

    @Column(nullable = false)
    private Long stockId;                // FK → stocks

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private OrderType orderType;         // BUY, SELL

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private OrderStatus orderStatus;

    @Column(nullable = false)
    private Integer quantity;

    @Column(nullable = false, precision = 12, scale = 2)
    private BigDecimal pricePerShare;

    @Column(nullable = false, precision = 15, scale = 2)
    private BigDecimal totalAmount;

    @Column(nullable = false, updatable = false)
    private LocalDateTime placedAt;

    @PrePersist
    protected void onCreate() {
        this.placedAt    = LocalDateTime.now();
        this.orderStatus = OrderStatus.PENDING;
        this.totalAmount = pricePerShare
                            .multiply(BigDecimal.valueOf(quantity));
    }

	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Order(Long id, Long customerId, Long stockId, OrderType orderType, OrderStatus orderStatus, Integer quantity,
			BigDecimal pricePerShare, BigDecimal totalAmount, LocalDateTime placedAt) {
		super();
		this.id = id;
		this.customerId = customerId;
		this.stockId = stockId;
		this.orderType = orderType;
		this.orderStatus = orderStatus;
		this.quantity = quantity;
		this.pricePerShare = pricePerShare;
		this.totalAmount = totalAmount;
		this.placedAt = placedAt;
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

	public Long getStockId() {
		return stockId;
	}

	public void setStockId(Long stockId) {
		this.stockId = stockId;
	}

	public OrderType getOrderType() {
		return orderType;
	}

	public void setOrderType(OrderType orderType) {
		this.orderType = orderType;
	}

	public OrderStatus getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(OrderStatus orderStatus) {
		this.orderStatus = orderStatus;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getPricePerShare() {
		return pricePerShare;
	}

	public void setPricePerShare(BigDecimal pricePerShare) {
		this.pricePerShare = pricePerShare;
	}

	public BigDecimal getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(BigDecimal totalAmount) {
		this.totalAmount = totalAmount;
	}

	public LocalDateTime getPlacedAt() {
		return placedAt;
	}

	public void setPlacedAt(LocalDateTime placedAt) {
		this.placedAt = placedAt;
	}
    
}
