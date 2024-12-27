package com.nguyengiap.locket.repository.user_repository;

import java.util.List;
import java.util.Optional;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.nguyengiap.locket.model.user.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    @Query("SELECT u FROM User u WHERE u.account = :account")
    Optional<User> findByAccount(@Param("account") String account);

    @Query("SELECT u FROM User u " +
            "JOIN FriendTable f ON (u.account = f.account1 OR u.account = f.account2) " +
            "WHERE (:account = f.account1 AND u.account = f.account2) " +
            "   OR (:account = f.account2 AND u.account = f.account1)")
    List<User> findFriendInfo(@Param("account") String account);

    @Modifying
    @Query("UPDATE User u SET u.avatarUrl = :avatarUrl WHERE u.account = :account")
    void updateAvatar(@Param("account") String account, @Param("avatarUrl") String avatarUrl);

}
