package tc.com;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import tc.com.entity.User;

@Controller
public class Print {

	private String msg;
	
	private DispatcherServlet dispatcherServlet;

	private InternalResourceViewResolver internalResourceViewResolver;

	@RequestMapping(value = "/print")
	public String print(Model model) {
		this.msg = "hello --";
		System.out.println("-------------");
		model.addAttribute("msg", msg);
		return "index";
	}

	@ResponseBody
	@RequestMapping(value = "/initReprot")
	public String initHighcharts(
			@RequestParam(value = "char", required = false) String c,
			User u)
			throws JSONException {
//		System.out.println(c);
//		System.out.println(u.getPhone());
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		JSONArray tempJsonArray = new JSONArray();
		tempJsonArray.put(5);
		tempJsonArray.put(7);
		tempJsonArray.put(3);
		jsonObject.put("name", "t11111");
		jsonObject.put("data", tempJsonArray);
		jsonArray.put(jsonObject);
		tempJsonArray = new JSONArray();
		tempJsonArray.put(1);
		tempJsonArray.put(0);
		tempJsonArray.put(4);
		tempJsonArray.put(9);
		tempJsonArray.put(16);
		JSONObject jsonObject1 = new JSONObject();
		jsonObject1.put("name", "t22222");
		jsonObject1.put("data", tempJsonArray);
		jsonArray.put(jsonObject1);
		System.out.println(jsonArray.toString());
		return jsonArray.toString();
	}

	@RequestMapping(value = "/submit/{id}",method=RequestMethod.POST)
	public String submitForm(User user,String id) {
		System.out.println(id);
		System.out.println(user.getName());
		return "index";
	}
	
	@RequestMapping(value = "submit/{id}",method=RequestMethod.GET)
	public String restful(Long id) {
		System.out.println(id);
		return "index";
	}
}
