package com.nguyengiap.locket.service.image_table_service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nguyengiap.locket.model.image_table.ImageTable;
import com.nguyengiap.locket.repository.image_table_repository.ImageTableRepository;

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
}
