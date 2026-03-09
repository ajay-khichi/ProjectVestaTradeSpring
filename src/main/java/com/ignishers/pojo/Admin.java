package com.ignishers.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrePersist;
import javax.persistence.Table;

import com.ignishers.enums.AccountStatus;
import com.ignishers.enums.Role;

@Entity
@Table(name = "admins")
public class Admin extends User {

    @Column(nullable = false, unique = true)
    private String employeeCode;

    @PrePersist
    protected void onAdminCreate() {
        super.setRole(Role.ADMIN);
        super.setAccountStatus(AccountStatus.VERIFIED);
    }

	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Admin(Long id, String email, String password, String firstName, String lastName, Role role,
			AccountStatus accountStatus) {
		super(id, email, password, firstName, lastName, role, accountStatus);
		// TODO Auto-generated constructor stub
	}

	public String getEmployeeCode() {
		return employeeCode;
	}

	public void setEmployeeCode(String employeeCode) {
		this.employeeCode = employeeCode;
	}
    
}
