package haoran.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import haoran.common.vo.AjaxResponse;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.alibaba.fastjson.JSONObject;

@ParentPackage("basePackage")  
@Namespace("/")  
@Action(value="loginAction")  
/*@Result(name="saveok",location="/index1.jsp")*/
public class LoginAction {
	
	private String name;
	private String password;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void login(HttpServletResponse response) throws IOException{
		/*AjaxResponse obj =new AjaxResponse();
		obj.setMsg("success");
		obj.setSuccess(true);*/
		//obj.setData(data);
		/*try {
			//ResponseUtil.write(response, obj);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		System.out.println(this.name+"===========");
		Map<String, Object> result = new HashMap<String,Object>();
		result.put("success", true);
		result.put("msg", "msgaaaaa");
		response.getWriter().print(new JSONObject(result)); 
	}
	
	
}
