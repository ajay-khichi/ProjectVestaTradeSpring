package com.ignishers.daoimpl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.ignishers.dao.UserDao;
import com.ignishers.pojo.User;

public class UserDaoImpl implements UserDao{

	private HibernateTemplate hTemplate;
	
	public void sethTemplate(HibernateTemplate hTemplate) {
		this.hTemplate = hTemplate;
	}

	@Override
	public User checkUserCred(String email, String pass) {
		try {
			User user = hTemplate.execute(new HibernateCallback<User>() {
				@Override
				public User doInHibernate(Session session) throws HibernateException {
					Query q = session.createQuery("from User where "
							+ "email =:email and password =:pass");
					q.setParameter("email", email);
					q.setParameter("pass", pass);
					List<User>lst = q.list();
					if(lst!=null && !lst.isEmpty())
						return lst.get(0);
					else
						return null;
				}
			});
			if(user!=null)
				return user;
			else
				return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	
	
	@Override
	public List<User> getAllUser() {
		try {
			List<User>lst = hTemplate.loadAll(User.class);
			return lst;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	@Transactional
	public User checkExistence(String email) {
	    try {
	        User user = hTemplate.execute(new HibernateCallback<User>() {

	            @Override
	            public User doInHibernate(Session session) throws HibernateException {
	                Query q = session.createQuery("from User where email = :email");
	                q.setParameter("email", email);
	                List<User> lst = q.list();

	                if (lst != null && !lst.isEmpty()) 
	                    return lst.get(0);
	                else
	                    return null;
	            }
	        });

	        return user;   

	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}

	@Override
	@Transactional
	public boolean updateUser(User user) {
		try {
			hTemplate.update(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	@Transactional
	public boolean deleteUser(User user) {
		try {
			hTemplate.delete(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
