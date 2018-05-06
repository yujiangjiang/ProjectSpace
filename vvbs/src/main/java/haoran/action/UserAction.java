package haoran.action;

import haoran.entity.UserInfo;
import haoran.service.IUserService;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

@ParentPackage("basePackage")  
@Namespace("/")  
@Action(value="userAction")  
@Result(name="saveok",location="/index1.jsp")
public class UserAction {
	  
	private IUserService userService;
	private UserInfo userInfo;
	    
	public IUserService getUserService() {  
	    return userService;  
	}  
	@Autowired  
	public void setUserService(IUserService userService) {  
		this.userService = userService;  
	}    
	     
	    
	public UserInfo getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}
	public String TestStruts()  
	{  
	    System.out.println(userInfo.getUserName());  
	    userService.saveUser(userInfo);  
	    return "saveok";  
	}  
}
