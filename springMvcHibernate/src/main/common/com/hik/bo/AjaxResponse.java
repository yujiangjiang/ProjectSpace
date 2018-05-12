package com.hik.bo;

import java.util.HashMap;
import java.util.Map;

public class AjaxResponse{
	
	public Map<String,Object> result = new HashMap<String,Object>();

	public void setSuccess(boolean flag){
		result.put("success", flag);
	}
	public boolean getSuccess(){
		return (boolean)result.get("success");
	}
	public void setMsg(String msg){
		result.put("msg", msg);
	}
	public String getMsg(){
		return (String)result.get("msg");
	}
	
	public void setData(Object data){
		result.put("data", data);
	}
	public Object getData(){
		return result.get("data");
	}
	
	public Map<String, Object> getResult() {
		return result;
	}

	public void setResult(Map<String, Object> result) {
		this.result = result;
	}

	
	
}
