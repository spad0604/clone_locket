package com.nguyengiap.locket.repository.image_table_repository;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.nguyengiap.locket.model.image_table.ImageTable;

import java.util.List;
import java.util.Optional;

@Repository
public interface ImageTableRepository extends JpaRepository<ImageTable, Integer> {
    @Query("SELECT h.id FROM ImageTable h WHERE h.imageUrl = :imageUrl")
    Integer getImageId(@Param("imageUrl") String imageUrl);

    @Query("SELECT h FROM ImageTable h WHERE h.id = :id")
    ImageTable getImageById(@Param("id") Integer id);

    @Query("SELECT h FROM ImageTable h WHERE h.account = :account")
    List<ImageTable> getImageByAccount(@Param("account") String account);

    @Modifying
    @Query("DELETE FROM ImageTable u WHERE u.id = :id")
    void deleteImage(@Param("id") int id);

    @Query("SELECT u FROM ImageTable u WHERE u.id = :id AND u.account = :account")
    Optional<ImageTable> checkImageBelongAccount(@Param("id") int id, @Param("account") String account);

    @Transactional
    @Modifying
    @Query("UPDATE ImageTable i SET i.message = :message WHERE i.id = :id")
    void setMessageImage(@Param("id") Integer id, @Param("message") String message);
}
