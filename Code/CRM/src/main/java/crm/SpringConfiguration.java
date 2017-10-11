package crm;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;

import crm.Service.AccountService;
import crm.ServiceImpl.AccountServiceImpl;

@Configuration
@ComponentScan({"crm"})

public class SpringConfiguration {
	
	@Bean
    public MultipartResolver multipartResolver() {
        return new StandardServletMultipartResolver();
    }
	
	/*private int maxUploadSizeInMb = 5 * 1024 * 1024; // 5 MB
	@Bean
    public CommonsMultipartResolver multipartResolver() {

        CommonsMultipartResolver cmr = new CommonsMultipartResolver();
        cmr.setMaxUploadSize(maxUploadSizeInMb * 2);
        cmr.setMaxUploadSizePerFile(maxUploadSizeInMb); //bytes
        return cmr;

    }*/
	
	@Bean
	public AccountService accountService() {
		return new AccountServiceImpl();
	}
	
	
}