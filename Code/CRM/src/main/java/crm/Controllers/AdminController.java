package crm.Controllers;

import java.util.Base64;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import crm.WebServiceUtil;
import crm.Domain.Advertisement;
import crm.Domain.Business;
import crm.Domain.ChamberInfo;
import crm.Domain.CollectionWrapper;
import crm.Domain.Rotator;
import crm.Service.AdminService;

@Controller
@RequestMapping(value = "/AdminController")
@MultipartConfig
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value = "/ShowAdminHome", method = RequestMethod.GET)
	public String ShowAdminHome(HttpServletRequest request) {
		return "Admin/AdminHome";
	}

	/* ------------------------ Chamber Info Start------------------------ */
	@RequestMapping(value = "/ChamberInfo/Show", method = RequestMethod.GET)
	public String getChamberInfo(HttpServletRequest request, Model model) {
		ChamberInfo chamberInfo = adminService.getChamberInfo();
		if(chamberInfo != null) {
			model.addAttribute("ChamberInfo", chamberInfo);
			if(chamberInfo.getLogo()!=null) {
				model.addAttribute("logoBase64", Base64.getEncoder().encodeToString(chamberInfo.getLogo()));
			}
			if(chamberInfo.getHomePageImg()!=null) {
				model.addAttribute("homePageImgBase64", Base64.getEncoder().encodeToString(chamberInfo.getHomePageImg()));
			}
		}
		else model.addAttribute("ChamberInfo", new ChamberInfo());
		return "Admin/GlobalWebsite";
	}
	
	@RequestMapping(value = "/ChamberInfo/Update", method = RequestMethod.POST)
	public String updateChamberInfo(@ModelAttribute("ChamberInfo") ChamberInfo chamberInfo, MultipartHttpServletRequest request, Model model ) throws Exception {
		
		ChamberInfo chamberInfoFromDB = adminService.getChamberInfo();
		
		MultipartFile logoFile = request.getMultiFileMap().get("logofile").get(0);
		MultipartFile homePageImgfile = request.getMultiFileMap().get("homePageImgfile").get(0);
		
		if(logoFile.isEmpty())
			chamberInfo.setLogo(chamberInfoFromDB.getLogo());
		else
        	chamberInfo.setLogo(logoFile.getBytes());
       
		
        if(homePageImgfile.isEmpty())
        	chamberInfo.setHomePageImg(chamberInfoFromDB.getHomePageImg());
        else
        	chamberInfo.setHomePageImg(homePageImgfile.getBytes());
        	
		
        boolean isUpdateSucessful = adminService.updateChamberInfo(chamberInfo);
		
        System.out.println("Update Status: " + isUpdateSucessful);
		
		if(isUpdateSucessful && chamberInfo != null) {
			WebServiceUtil.setChamberInfo(chamberInfo);
			request.getSession().setAttribute("chamberName", chamberInfo.getName());
		}
		
		return "redirect:/AdminController/ChamberInfo/Show";
	}
	/* ------------------------ Chamber Info Start------------------------ */

	
	/* ------------------------ Website Rotator Start------------------------ */
	@RequestMapping(value = "/Rotator/Show", method = RequestMethod.GET)
	public String getWebsiteRotator(HttpServletRequest request, Model model) {
		return "Admin/WebsiteRotator";
	}
	
	@RequestMapping(value = "/Rotator/Details", method = RequestMethod.GET)
	public @ResponseBody List<Rotator> getWebsiteRotatorDetails(HttpServletRequest request, Model model) {
		List<Rotator> result = adminService.getWebsiteRotatorDetails();
		return result;
	}
	
	@RequestMapping(value = "/Rotator/Save", method = RequestMethod.POST)
	public @ResponseBody List<Rotator> saveRotatorDetails(@RequestBody List<Rotator> rotators) {
		boolean isRemoved = adminService.removeAllWebsiteRotators();
		if(isRemoved) {
			boolean isAdded = adminService.saveAllWebsiteRotators(rotators);
			if(isAdded) {
				return rotators;
			}
		}
		return null;
	}
	
	@RequestMapping(value = "/Business/Details", method = RequestMethod.GET)
	public @ResponseBody List<Business> getBusinessDetails(HttpServletRequest request, Model model) {
		List<Business> result = adminService.getBusinessDetails();
		return result;
	}
	
	/* ------------------------ Website Rotator End------------------------ */
	
	/* ------------------------ Advertisement Start------------------------ */
	@RequestMapping(value = "/Advertisement/Show", method = RequestMethod.GET)
	public ModelAndView getAdvertisements(HttpServletRequest request, Model model) {
		
		List<Advertisement> advertisements = adminService.getAdvertisements();
		if(advertisements.isEmpty()) {
			Advertisement ad = new Advertisement();
			advertisements.add(ad);
		}
		CollectionWrapper collectionWrapper = new CollectionWrapper();
		collectionWrapper.setAdvertisements(advertisements); 
//		model.addAttribute("CollectionWrapper",collectionWrapper);
		return new ModelAndView("Admin/Advertisement" , "CollectionWrapper", collectionWrapper); 
	}
	
	
	
	/* ------------------------ Advertizement End------------------------ */
}
