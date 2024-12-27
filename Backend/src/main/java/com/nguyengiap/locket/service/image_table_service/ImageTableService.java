package com.nguyengiap.locket.service.image_table_service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nguyengiap.locket.model.image_table.ImageTable;
import com.nguyengiap.locket.repository.image_table_repository.ImageTableRepository;

import java.util.List;
import java.util.Optional;

@Service
public class ImageTableService{
    @Autowired
    private ImageTableRepository imageTableRepository;

    public void save(ImageTable imageTable) {
        imageTableRepository.save(imageTable);
    }

    public Integer getImageId(String imageUrl) {
        return imageTableRepository.getImageId(imageUrl);
    }

    public ImageTable getImageById(Integer id) {
        return imageTableRepository.getImageById(id);
    }

    public List<ImageTable> getImageByAccount(String account) {
        return imageTableRepository.getImageByAccount(account);
    }

    public void deleteImage(int id) {
        imageTableRepository.deleteImage(id);
    }

    public Optional<ImageTable> checkImageBelongAccount(int id, String account) {
        return imageTableRepository.checkImageBelongAccount(id, account);
    }
}
