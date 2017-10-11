package crm.Service;

import org.springframework.stereotype.Service;

import crm.Domain.Contact;

@Service
public interface AccountService {
	public Contact Login (String userName, String password);
}
