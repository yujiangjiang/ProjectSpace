package haoran.dao;

import haoran.entity.UserInfo;

import java.io.Serializable;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("userDao")
public class UserDaoImpl implements IUserDao{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Serializable saveDao(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().save(userInfo);
	}
	
}
