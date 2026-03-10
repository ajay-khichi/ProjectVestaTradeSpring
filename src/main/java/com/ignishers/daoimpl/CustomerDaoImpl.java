package com.ignishers.daoimpl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.ignishers.dao.CustomerDao;
import com.ignishers.pojo.Customer;
import com.ignishers.pojo.User;

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
