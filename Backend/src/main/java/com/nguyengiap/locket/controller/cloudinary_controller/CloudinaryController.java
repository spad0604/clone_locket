package com.nguyengiap.locket.controller.cloudinary_controller;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.nguyengiap.locket.config.jwt_config.JwtService;
import com.nguyengiap.locket.model.image_table.ImageTable;
import com.nguyengiap.locket.model.response_model.StatusResponseModel;
import com.nguyengiap.locket.service.cloundinary_service.CloudinaryService;
import com.nguyengiap.locket.service.image_table_service.ImageTableService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/v1/upload")
@RequiredArgsConstructor
public class CloudinaryController {
    @Autowired
    private CloudinaryService cloudinaryService;

    @Autowired
    private ImageTableService imageTableService;

    @Autowired
    private JwtService jwtService;

    @PostMapping
    public ResponseEntity<?> uploadImage(@RequestParam("file") MultipartFile file,
            @RequestHeader("Authorization") String token) {
        try {
            LocalDateTime now = LocalDateTime.now();
            final String account = jwtService.extractUserName(token.substring(7));
            String url = cloudinaryService.uploadFile(file);
            ImageTable imageTablee = ImageTable.builder()
                    .account(account)
                    .imageUrl(url)
                    .dateTime(now)
                    .build();
                    imageTableService.save(imageTablee);
            return ResponseEntity.ok().body(StatusResponseModel.builder().statusCode(200).message("Upload Successful").build());
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error uploading file: " + e.getMessage());
        }
    }
}
