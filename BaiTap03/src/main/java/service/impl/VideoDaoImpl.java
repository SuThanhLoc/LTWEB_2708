package service.impl;

import java.util.List;

import config.JPAConfig;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import model.Video;
import service.VideoDao;

public class VideoDaoImpl implements VideoDao {
    private EntityManager em;

    public VideoDaoImpl() {
        em = JPAConfig.getEntityManager();
    }

    public VideoDaoImpl(EntityManager em) {
        this.em = em;
    }

    @Override
    public Video create(Video video) {
        try {
            em.persist(video);
            return video;
        } catch (Exception e) {
            throw new RuntimeException("Error creating video", e);
        }
    }

    @Override
    public Video update(Video video) {
        try {
            Video existingVideo = em.find(Video.class, video.getVideoId());
            if (existingVideo != null) {
                existingVideo.setTitle(video.getTitle());
                existingVideo.setDescription(video.getDescription());
                existingVideo.setPoster(video.getPoster());
                existingVideo.setActive(video.isActive());
                existingVideo.setViews(video.getViews());
                em.merge(existingVideo);
            }
            return existingVideo;
        } catch (Exception e) {
            throw new RuntimeException("Error updating video", e);
        }
    }

    @Override
    public Video remove(String id) {
        try {
            Video video = findById(id);
            if (video != null) {
                em.remove(video);
            }
            return video;
        } catch (Exception e) {
            throw new RuntimeException("Error removing video", e);
        }
    }

    @Override
    public Video findById(String id) {
        try {
            return em.find(Video.class, id);
        } catch (Exception e) {
            throw new RuntimeException("Error finding video by id", e);
        }
    }

    @Override
    public List<Video> findAll() {
        try {
            TypedQuery<Video> query = em.createNamedQuery("Video.findAll", Video.class);
            return query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Error getting all videos", e);
        }
    }

    // Clean up resources
    public void close() {
        if (em != null && em.isOpen()) {
            em.close();
        }
    }
}
