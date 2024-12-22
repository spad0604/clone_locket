package com.nguyengiap.locket.controller.user_controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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
}
