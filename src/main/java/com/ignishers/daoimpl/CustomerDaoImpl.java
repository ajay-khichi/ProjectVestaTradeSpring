package com.ignishers.daoimpl;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.ignishers.dao.CustomerDao;
import com.ignishers.pojo.Customer;

public class CustomerDaoImpl implements CustomerDao{

	
	private HibernateTemplate hTemplate;
	
	
	public void sethTemplate(HibernateTemplate hTemplate) {
		this.hTemplate = hTemplate;
	}


	@Override
	@Transactional
	public boolean addCustomer(Customer cst) {
		try {
			hTemplate.save(cst);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
}
