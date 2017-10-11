package com.DBaccess.DAO;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.DBaccess.Domains.Contact;
import com.DBaccess.Util.HibernateFactory;

@Repository
public class ContactDAO extends CommonDAO{

	public ContactDAO() {
        super();
    }

    /**
     * Insert a new User into the database.
     * @param event
     */
    public void create(Contact u) throws RuntimeException {
        super.saveOrUpdate(u);
    }


    /**
     * Delete a detached User from the database.
     * @param event
     */
    public void delete(Contact u) throws RuntimeException {
        super.delete(u);
    }

    /**
     * Find an User by its primary key.
     * @param id
     * @return
     */
    public Contact find(Long id) throws RuntimeException {
        return (Contact) super.find(Contact.class, id);
    }
    
    /**
     * Find an User by username and password.
     * @param id
     * @return
     */
    public Contact find(String username, String password) throws RuntimeException {
    	Contact u = null;
        try {
            startOperation();
            Criteria criteria =	getSession().createCriteria(Contact.class);
            criteria.add(Restrictions.eq("userName", username));
            criteria.add(Restrictions.eq("password", password));
            List<Contact> contacts = criteria.list();
            if(contacts.size()>0)
            	u = contacts.get(0);
            getTransaction().commit();
       
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(getSession());
        }
        return u;
    }

    /**
     * Updates the state of a detached User.
     *
     * @param event
     */
    public void update(Contact u) throws RuntimeException {
        super.saveOrUpdate(u);
    }

    /**
     * Finds all Events in the database.
     * @return
     */
	@SuppressWarnings("unchecked")
	public List<Contact> findAll() throws RuntimeException{
        return (List<Contact>) super.findAll(Contact.class);
    }
	
	
}
