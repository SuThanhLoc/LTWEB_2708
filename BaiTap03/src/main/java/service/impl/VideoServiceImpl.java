package service.impl;

import java.util.List;

import jakarta.persistence.EntityManager;
import config.JPAConfig;
import model.Video;
import service.VideoDao;
import service.VideoService;

public class VideoServiceImpl implements VideoService {
    private VideoDao videoDao;
    private EntityManager em;

    public VideoServiceImpl() {
        this.em = JPAConfig.getEntityManager();
        this.videoDao = new VideoDaoImpl(em);
    }

    @Override
    public Video create(Video video) {
        try {
            em.getTransaction().begin();
            Video result = videoDao.create(video);
            em.getTransaction().commit();
            return result;
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw new RuntimeException("Error creating video", e);
        }
    }

    @Override
    public Video update(Video video) {
        try {
            em.getTransaction().begin();
            Video result = videoDao.update(video);
            em.getTransaction().commit();
            return result;
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw new RuntimeException("Error updating video", e);
        }
    }

    @Override
    public Video delete(String id) {
        try {
            em.getTransaction().begin();
            Video result = videoDao.remove(id);
            em.getTransaction().commit();
            return result;
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw new RuntimeException("Error deleting video", e);
        }
    }

    @Override
    public Video findById(String id) {
        return videoDao.findById(id);
    }

    @Override
    public List<Video> findAll() {
        return videoDao.findAll();
    }

    public void close() {
        if (videoDao != null) {
            ((VideoDaoImpl) videoDao).close();
        }
        if (em != null) {
            em.close();
        }
    }
}
