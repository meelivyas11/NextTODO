package com.DBaccess.DAO;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.DBaccess.Util.HibernateFactory;

@Repository
public class CommonDAO {
	private Session session;
    private Transaction tx;

    public CommonDAO() {
        HibernateFactory.buildIfNeeded();
    }

    protected boolean saveOrUpdate(Object obj) {
    	boolean isSuccess = false;
        try {
            startOperation();
            session.saveOrUpdate(obj);
            tx.commit();
            isSuccess = true;
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return isSuccess;
    }
    
    protected boolean save(Object obj) {
    	boolean isSuccess = false;
        try {
            startOperation();
            session.save(obj);
            tx.commit();
            isSuccess = true;
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return isSuccess;
    }

    protected boolean delete(Object obj) {
    	boolean isSuccess = false;
        try {
            startOperation();
            session.delete(obj);
            tx.commit();
            isSuccess = true;
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return isSuccess;
    }

    @SuppressWarnings("rawtypes")
	protected Object find(Class clazz, Long id) {
        Object obj = null;
        try {
            startOperation();
            obj = session.load(clazz, id);
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return obj;
    }

    @SuppressWarnings("rawtypes")
	protected List findAll(Class clazz) {
        List objects = null;
        try {
            startOperation();
            Query query = session.createQuery("from " + clazz.getName());
            objects = query.list();
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return objects;
    }

    protected void handleException(HibernateException e) throws RuntimeException {
        HibernateFactory.rollback(tx);
        throw new RuntimeException(e);
    }

    protected void startOperation() throws HibernateException {
        session = HibernateFactory.openSession();
        tx = session.beginTransaction();
    }
    
    protected Session getSession() {
    	return session;
    }
    
    protected Transaction getTransaction() {
    	return tx;
    }
	}