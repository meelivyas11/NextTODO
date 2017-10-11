package crm.Controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import crm.WebServiceUtil;
import crm.Domain.ChamberInfo;
import crm.Service.AdminService;

@Controller
@RequestMapping(value = "")
public class HomeController {
	
	@Autowired
	private AdminService adminService;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String LandingPage(HttpServletRequest request) {
		ChamberInfo chamberInfo = adminService.getChamberInfo();
		
		if(chamberInfo!=null) {
			WebServiceUtil.setChamberInfo(chamberInfo);
			request.getSession().setAttribute("chamberName", chamberInfo.getName());
		}
		return "Login";
	}
	
	@RequestMapping(value = "/ShowHome", method = RequestMethod.GET)
	public String ShowMenu(HttpServletRequest request) {
		return "Home";
	}
}
