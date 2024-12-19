package com.nguyengiap.locket.controller.cloudinary_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.nguyengiap.locket.service.cloundinary_service.CloudinaryService;

@RestController
@RequestMapping("/api/v1/upload")
public class CloudinaryController {
    @Autowired
    private CloudinaryService cloudinaryService;

    @PostMapping
    public ResponseEntity<?> uploadImage(@RequestParam("file") MultipartFile file, @RequestHeader("Authorization") String token) {
        try {
            String url = cloudinaryService.uploadFile(file);
            return ResponseEntity.ok().body(url);
        } catch(Exception e) {
            return ResponseEntity.badRequest().body("Error uploading file: " + e.getMessage());
        }
    }
}
