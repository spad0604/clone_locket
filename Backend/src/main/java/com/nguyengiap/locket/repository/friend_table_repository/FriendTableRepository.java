package com.nguyengiap.locket.repository.friend_table_repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.nguyengiap.locket.model.friend_table.FriendTable;

@Repository
public interface FriendTableRepository extends JpaRepository<FriendTable, String>{
    @Query("SELECT f FROM FriendTable f WHERE f.account1 = :account OR f.account2 = :account")
    List<FriendTable> findFriendByAccount(@Param("account") String account);
}
