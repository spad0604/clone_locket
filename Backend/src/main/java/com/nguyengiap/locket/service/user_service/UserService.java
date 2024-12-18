package com.nguyengiap.locket.service.user_service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nguyengiap.locket.model.user.User;
import com.nguyengiap.locket.repository.user_repository.UserRepository;

@Service
public class UserService{
    @Autowired
    private UserRepository userRepository; 

    public Optional<User> findByAccount(String account) {
        return userRepository.findByAccount(account);
    }
}
