package com.ignishers.pojo;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.PrePersist;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.ignishers.enums.AccountStatus;
import com.ignishers.enums.Gender;
import com.ignishers.enums.Role;

@Entity
@Table(name = "customers")
public class Customer extends User {

    @Column(nullable = false, unique = true)
    private String mobile;               

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(nullable = false)
    private LocalDate dateOfBirth;       

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Gender gender;               

    @Column(nullable = false, unique = true)
    private String pan;                 

    @Column(nullable = false, unique = true)
    private String aadhar;              

    @Column(nullable = false)
    private String address;             

    @Column(nullable = false)
    private String bankAccount;         

    @Column(nullable = false)
    private String ifscCode;            

    @Column(nullable = false)
    private boolean termsAccepted;       

    @Column(nullable = false)
    private boolean riskDisclosure;      

    @PrePersist
    protected void onCustomerCreate() {
        super.setRole(Role.CUSTOMER);
    }

    // constructors
    public Customer() { super(); }

    public Customer(Long id, String email, String password,
                    String firstName, String lastName,
                    Role role, AccountStatus accountStatus) {
        super(id, email, password, firstName, lastName, role, accountStatus);
    }

    // getters and setters
    public String getMobile() { return mobile; }
    public void setMobile(String mobile) { this.mobile = mobile; }

    public LocalDate getDateOfBirth() { return dateOfBirth; }
    public void setDateOfBirth(LocalDate dateOfBirth) { this.dateOfBirth = dateOfBirth; }

    public Gender getGender() { return gender; }
    public void setGender(Gender gender) { this.gender = gender; }

    public String getPan() { return pan; }
    public void setPan(String pan) { this.pan = pan; }

    public String getAadhar() { return aadhar; }
    public void setAadhar(String aadhar) { this.aadhar = aadhar; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getBankAccount() { return bankAccount; }
    public void setBankAccount(String bankAccount) { this.bankAccount = bankAccount; }

    public String getIfscCode() { return ifscCode; }
    public void setIfscCode(String ifscCode) { this.ifscCode = ifscCode; }

    public boolean isTermsAccepted() { return termsAccepted; }
    public void setTermsAccepted(boolean termsAccepted) { this.termsAccepted = termsAccepted; }

    public boolean isRiskDisclosure() { return riskDisclosure; }
    public void setRiskDisclosure(boolean riskDisclosure) { this.riskDisclosure = riskDisclosure; }
}