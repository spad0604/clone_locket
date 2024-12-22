package com.nguyengiap.locket.service.friend_table_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nguyengiap.locket.model.friend_table.FriendTable;
import com.nguyengiap.locket.repository.friend_table_repository.FriendTableRepository;

@Service
public class FriendTableService {
    @Autowired
    private FriendTableRepository friendTableRepository;

    public List<FriendTable> findFriendByAccount(String account) {
        return friendTableRepository.findFriendByAccount(account);
    }

    public void save(FriendTable friendTable) {
        friendTableRepository.save(friendTable);
    }
}
