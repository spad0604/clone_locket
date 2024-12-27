package com.nguyengiap.locket.controller.cloudinary_controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.nguyengiap.locket.config.jwt_config.JwtService;
import com.nguyengiap.locket.model.friend_table.FriendTable;
import com.nguyengiap.locket.model.history_table.HistoryTable;
import com.nguyengiap.locket.model.image_table.ImageTable;
import com.nguyengiap.locket.model.response_model.StatusResponseModel;
import com.nguyengiap.locket.service.cloundinary_service.CloudinaryService;
import com.nguyengiap.locket.service.friend_table_service.FriendTableService;
import com.nguyengiap.locket.service.history_table_service.HistoryTableService;
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

    @Autowired
    private FriendTableService friendTableService;

    @Autowired
    private HistoryTableService historyTableService;

    @PostMapping
    public ResponseEntity<?> uploadImage(@RequestParam("file") MultipartFile file,
            @RequestHeader("Authorization") String token) {
        try {
            LocalDateTime now = LocalDateTime.now();
            // Get account from token
            final String account = jwtService.extractUserName(token.substring(7));
            // Check list friend
            List<FriendTable> friendList = friendTableService.findFriendByAccount(account);

            String url = cloudinaryService.uploadFile(file);
            ImageTable imageTable = ImageTable.builder()
                    .account(account)
                    .imageUrl(url)
                    .dateTime(now)
                    .build();
            imageTableService.save(imageTable);

            // Get image Id
            Integer imageId = imageTableService.getImageId(url);

            // Update History Table
            if (!friendList.isEmpty()) {
                List<HistoryTable> histories = new ArrayList<>();
                for (FriendTable friend : friendList) {
                        HistoryTable historyTable = HistoryTable.builder()
                                .account(friend.getAccount1())
                                .imageId(imageId)
                                .isSeen(0)
                                .build();
                        histories.add(historyTable);

                        HistoryTable historyTable2 = HistoryTable.builder()
                                .account(friend.getAccount2())
                                .imageId(imageId)
                                .isSeen(0)
                                .build();
                        histories.add(historyTable2);
                }
                historyTableService.saveAll(histories);
            }

            imageTableService.save(imageTable);
            return ResponseEntity.ok()
                    .body(StatusResponseModel.builder().statusCode(200).message("Upload Successful").build());
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error uploading file: " + e.getMessage());
        }
    }
}
