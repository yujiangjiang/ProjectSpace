package haoran.common.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;

public class ResponseUtil {

	private static final Logger log = Logger.getLogger(ResponseUtil.class);
	
	private static ObjectMapper objectMapper = JsonUtil.getObjectMapper();
	
	public static void write(HttpServletResponse response, Object obj) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(JsonUtil.object2Json(obj));
		out.flush();
		out.close();
	}
	
}
