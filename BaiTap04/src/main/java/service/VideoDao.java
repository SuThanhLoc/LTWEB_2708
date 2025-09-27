package service;

import java.util.List;
import model.Video;

public interface VideoDao {
    Video create(Video video);
    Video update(Video video);
    Video remove(String id);
    Video findById(String id);
    List<Video> findAll();
}
