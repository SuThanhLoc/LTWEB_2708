package service;

import java.util.List;

import model.Category; 

public interface CategoryService {
	boolean insert(Category category);
	boolean update(Category category);
	boolean delete(int id);
	Category get(int id);
	Category get(String name);
	List<Category> findAll();
	List<Category> search(String keyword);
}
