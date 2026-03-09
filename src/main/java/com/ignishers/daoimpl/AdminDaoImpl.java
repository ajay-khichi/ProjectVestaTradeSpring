package com.ignishers.daoimpl;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.ignishers.dao.AdminDao;
import com.ignishers.pojo.Admin;

public class AdminDaoImpl implements AdminDao{
	
	private HibernateTemplate hTemplate;
	
	public void sethTemplate(HibernateTemplate hTemplate) {
		this.hTemplate = hTemplate;
	}


	@Override
	@Transactional
	public boolean addAdmin(Admin admin) {
		try {
			hTemplate.save(admin);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	
}
