package crm.Controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import crm.WebServiceUtil;
import crm.Domain.Contact;
import crm.Service.AccountService;



@Controller
@RequestMapping(value = "/AccountController")
public class AccountController {
	
	@Autowired
	private AccountService accountService;
	
	@RequestMapping(value = "/Login", method = RequestMethod.POST)
	public String Login(@RequestParam String userName, @RequestParam String password, HttpServletRequest request) {

		Contact validUser = accountService.Login(userName, password);
		
		if(validUser!=null) {
			WebServiceUtil.setValidUser(validUser);
			return "Home";
		}
		return "redirect:/AccountController/LoginView?err=true";
		
	}

	@RequestMapping(value = "/LoginView", method = RequestMethod.GET)
	public String home(@RequestParam(value = "false", required = false) String err, Model model) {
		if (err != null && err.equals("true"))
			model.addAttribute("errorMsg", "Incorrect Credentials");
		return "Login";
	}

	@RequestMapping(value = "/Logout", method = RequestMethod.POST)
	public String Logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/AccountController/LoginView";
	}
}
