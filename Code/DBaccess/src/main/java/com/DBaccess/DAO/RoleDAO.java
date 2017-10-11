package com.DBaccess.DAO;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.DBaccess.Domains.Role;
import com.DBaccess.Util.HibernateFactory;

@Repository
public class RoleDAO extends CommonDAO{

	public RoleDAO() {
        super();
    }

	public Role getRolesForContactId(long contactId) throws RuntimeException {
		Role role = null;
        try {
            startOperation();
            Criteria criteria =	getSession().createCriteria(Role.class);
            criteria.add(Restrictions.eq("contactId", contactId));
            List<Role> roles  = criteria.list();
            if(roles.size()>0)
            	role = roles.get(0);
            getTransaction().commit();
       
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(getSession());
        }
        return role;
    }

   
}
