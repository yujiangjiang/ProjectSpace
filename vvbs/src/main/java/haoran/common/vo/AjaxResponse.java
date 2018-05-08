package haoran.common.vo;

import java.util.HashMap;
import java.util.Map;

public class AjaxResponse {
	Map<String, Object> result = new HashMap<String,Object>();
	
	public void setData(Object data){
		result.put("data", data);
	}
	public void setSuccess(boolean suc){
		result.put("success", suc);
	}
	
	public void setMsg(Object msg){
		result.put("msg", msg);
	}
}
