package com.nguyengiap.locket.controller.authenticate_controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.nguyengiap.locket.model.request_model.authenticate_request_model.AuthenticateRequestModel;
import com.nguyengiap.locket.model.response_model.StatusResponseModel;
import com.nguyengiap.locket.model.user.User;
import com.nguyengiap.locket.service.authenticate_service.AuthenticateService;
import com.nguyengiap.locket.service.user_service.UserService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/v1/auth")
@RequiredArgsConstructor
public class AuthenticateController {
    @Autowired
    UserService userService;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    AuthenticateService authenticateService;

    @PostMapping("/login")
    public ResponseEntity<?> authenticate(@RequestBody AuthenticateRequestModel authenticateRequestModel) {
        Optional<User> user = userService.findByAccount(authenticateRequestModel.getAccount());

        if(user.isPresent()) {
            if(passwordEncoder.matches(authenticateRequestModel.getPassword(), user.get().getPassword())) {
                return ResponseEntity.ok(authenticateService.authenticate(authenticateRequestModel));
            }
            else {
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(StatusResponseModel.builder().statusCode(401).message("Wrong password").build());
            }
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(StatusResponseModel.builder().statusCode(404).message("Account not found").build());
    }
}
