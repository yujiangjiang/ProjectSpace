package haoran.service;

import haoran.dao.IUserDao;
import haoran.entity.UserInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userService")  
@Transactional
public class UserServiceImpl implements IUserService{

	@Autowired
	private IUserDao userDao;
	
	@Override
	public void saveUser(UserInfo userInfo) {
		// TODO Auto-generated method stub
		userDao.saveDao(userInfo);
	}

}
