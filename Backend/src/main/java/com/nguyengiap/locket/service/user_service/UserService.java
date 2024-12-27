package com.nguyengiap.locket.service.user_service;

import java.util.List;
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

    public void save(User user) {
        userRepository.save(user);
    }

    public List<User> findFriend(String account) {
        return userRepository.findFriendInfo(account);
    }

    public void updateAvatar(String account, String avatarUrl) {
        userRepository.updateAvatar(account, avatarUrl);
    }
}
