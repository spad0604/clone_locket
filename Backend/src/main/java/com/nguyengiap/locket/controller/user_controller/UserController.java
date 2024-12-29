package com.nguyengiap.locket.controller.user_controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.nguyengiap.locket.model.friend_table.FriendTable;
import com.nguyengiap.locket.model.image_table.ImageTable;
import com.nguyengiap.locket.model.request_model.image_message.ImageMessageRequest;
import com.nguyengiap.locket.model.response_model.friend_response.FriendResponse;
import com.nguyengiap.locket.model.user.User;
import com.nguyengiap.locket.service.friend_table_service.FriendTableService;
import com.nguyengiap.locket.service.image_table_service.ImageTableService;
import com.nguyengiap.locket.service.user_service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.nguyengiap.locket.config.jwt_config.JwtService;
import com.nguyengiap.locket.model.history_table.HistoryTable;
import com.nguyengiap.locket.model.response_model.StatusResponseModel;
import com.nguyengiap.locket.service.history_table_service.HistoryTableService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/v1/user")
@RequiredArgsConstructor
public class UserController {
    @Autowired
    private HistoryTableService historyTableService;

    @Autowired
    private JwtService jwtService;

    @Autowired
    private FriendTableService friendTableService;

    @Autowired
    private ImageTableService imageTableService;

    @Autowired
    private UserService userService;

    @PostMapping("/image-message")
    public ResponseEntity<?> uploadImageMessage(@RequestHeader("Authorization") String token, @RequestBody() ImageMessageRequest request) {
        try {
            String user = jwtService.extractUserName(token.substring(7));

            Optional<ImageTable> imageTableOptinal = imageTableService.checkImageBelongAccount(request.getId(), user);

            if(imageTableOptinal.isPresent()) {
                imageTableService.updateMessageImage(request.getId(), request.getMessage());

                return ResponseEntity.ok().body(StatusResponseModel.builder().statusCode(200).message("Update Message Successfull").build());
            } else {
                return ResponseEntity.badRequest().body(StatusResponseModel.builder().statusCode(404).message("This is not your imagee").build());
            }
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(StatusResponseModel.builder().statusCode(403).message(e.toString()).build());
        }
    }

    @GetMapping("/information")
    public ResponseEntity<?> checkProfile(@RequestHeader("Authorization") String token) {
        try {
            final String account = jwtService.extractUserName(token.substring(7));
            Optional<User> user = userService.findByAccount(account);

            if(user.isPresent()) {
                return ResponseEntity.ok().body(user);
            } else {
                return ResponseEntity.status(404).body(StatusResponseModel.builder().statusCode(404).message("Account not found"));
            }
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @GetMapping("/list-friend")
    public ResponseEntity<?> getListFriend(@RequestHeader("Authorization") String token) {
        try {
            final String user = jwtService.extractUserName(token.substring(7));
            List<FriendTable> friendList = friendTableService.findFriendByAccount(user);

            return ResponseEntity.ok().body(friendList);
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @GetMapping("/get-image")
    public ResponseEntity<?> getImage(@RequestHeader("Authorization") String token, @RequestParam("id") Integer id) {
        try {
            ImageTable image = imageTableService.getImageById(id);

            return ResponseEntity.ok().body(image);
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @GetMapping("/history")
    public ResponseEntity<?> getHistory(@RequestHeader("Authorization") String token) {
        try {
            final String user = jwtService.extractUserName(token.substring(7));
            List<HistoryTable> history = historyTableService.getHistoryByAccount(user);

            return ResponseEntity.ok(history);

        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error");
        }
    }

    @GetMapping("/seen-image")
    public ResponseEntity<?> seenImage(@RequestHeader("Authorization") String token, @RequestParam("id") Integer id) {
        try {
            final String user = jwtService.extractUserName(token.substring(7));

            historyTableService.updateIsSeen(id, user);

            return ResponseEntity.ok().body(StatusResponseModel.builder().statusCode(200).message("Success").build());

        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error");
        }
    }

    @GetMapping("/friend-info")
    public ResponseEntity<?> friendInfo(@RequestHeader("Authorization") String token) {
        List<FriendResponse> response = new ArrayList<>();
        try {
            final String account = jwtService.extractUserName(token.substring(7));
            List<User> listFriendInfo = userService.findFriend(account);

            if(!listFriendInfo.isEmpty()) {
                for(User user : listFriendInfo) {
                    FriendResponse friendResponse = FriendResponse.builder()
                            .account(user.getAccount())
                            .firstName(user.getFirstName())
                            .lastName(user.getLastName())
                            .avatarUrl(user.getAvatarUrl())
                            .build();
                    response.add(friendResponse);
                }
            }
            return ResponseEntity.ok().body(response);
        } catch (Exception e) {
            return ResponseEntity.ok().body(response);
        }
    }

    @GetMapping("/friend-list-image")
    public ResponseEntity<?> getFriendImage(@RequestHeader("Authorization") String token, @RequestParam("account") String account){
        List<ImageTable> imageList = new ArrayList<>();
        try {
            final String user = jwtService.extractUserName(token.substring(7));

            imageList = imageTableService.getImageByAccount(account);

            return ResponseEntity.ok().body(imageList);
        } catch (Exception e) {
            return ResponseEntity.ok().body(imageList);
        }
    }

    @GetMapping("/delete-image")
    public ResponseEntity<?> deleteImage(@RequestHeader("Authorization") String token, @RequestParam("id") int id) {
        try {
            final String account = jwtService.extractUserName(token.substring(7));
            Optional<ImageTable> image = imageTableService.checkImageBelongAccount(id, account);

            if(image.isPresent()) {
                imageTableService.deleteImage(id);
                return ResponseEntity.status(200).body(StatusResponseModel.builder().statusCode(200).message("Delete Image Successful").build());
            } else {
                return ResponseEntity.status(403).body(StatusResponseModel.builder().statusCode(403).message("This is not your image!").build());
            }
        } catch (Exception e) {
            return ResponseEntity.status(401).body(StatusResponseModel.builder().statusCode(401).message("Something went wrong!").build());
        }
    }
}
