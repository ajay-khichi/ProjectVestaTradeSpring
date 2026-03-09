package com.ignishers.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.PrePersist;
import javax.persistence.Table;

import com.ignishers.enums.AccountStatus;
import com.ignishers.enums.Role;

@Entity
@Table(name = "users")
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String firstName;            // form: name="firstName"

    @Column(nullable = false)
    private String lastName;             // form: name="lastName"

    @Column(nullable = false, unique = true)
    private String email;                // form: name="email"

    @Column(nullable = false)
    private String password;             // form: name="password"

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Role role;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private AccountStatus accountStatus;

    @PrePersist
    protected void onCreate() {
        this.accountStatus = AccountStatus.PENDING;
    }

    // constructors
    public User() { super(); }

    public User(Long id, String email, String password,
                String firstName, String lastName,
                Role role, AccountStatus accountStatus) {
        this.id            = id;
        this.email         = email;
        this.password      = password;
        this.firstName     = firstName;
        this.lastName      = lastName;
        this.role          = role;
        this.accountStatus = accountStatus;
    }

    // getters and setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public Role getRole() { return role; }
    public void setRole(Role role) { this.role = role; }

    public AccountStatus getAccountStatus() { return accountStatus; }
    public void setAccountStatus(AccountStatus accountStatus) { this.accountStatus = accountStatus; }
}