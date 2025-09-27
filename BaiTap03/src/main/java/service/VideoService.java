package service;

import java.util.List;
import model.Video;

public interface VideoService {
    Video create(Video video);
    Video update(Video video);
    Video delete(String id);
    Video findById(String id);
    List<Video> findAll();
}
