package haoran.dao;

import haoran.entity.UserInfo;

import java.io.Serializable;

public interface IUserDao {

	public Serializable saveDao(UserInfo userInfo);
}
