package service.impl;

import java.io.File;
import java.util.List;

import jakarta.persistence.EntityManager;

import config.JPAConfig;
import model.Category; 
import service.CategoryService;

public class CategoryServiceImpl implements CategoryService {
    private final CategoryDaoImpl categoryDao;
    private final EntityManager em;

    public CategoryServiceImpl() {
        this.em = JPAConfig.getEntityManager();
        this.categoryDao = new CategoryDaoImpl(em);
    }

    @Override
    public boolean insert(Category category) {
        try {
            em.getTransaction().begin();
            categoryDao.insert(category);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
            return false;
        }
    }

    @Override 
    public boolean update(Category category) {
        try {
            em.getTransaction().begin();
            categoryDao.update(category);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
            return false;
        }
    }

	@Override
	public boolean delete(int id) {
        try {
            em.getTransaction().begin();
            categoryDao.delete(id);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
            return false;
        }
	}

	@Override
	public Category get(int id) {
		return categoryDao.get(id);
	}

	@Override
	public Category get(String name) {
		return categoryDao.get(name);
	}

	@Override
	public List<Category> findAll() {
		return categoryDao.findAll();
	}

	@Override
	public List<Category> search(String keyword) {
		return categoryDao.search(keyword);
	}
    
    // Clean up resources when service is no longer needed
    public void close() {
        if (em != null) {
            em.close();
        }
    }
}
