package com.nguyengiap.locket.repository.image_table_repository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.nguyengiap.locket.model.image_table.ImageTable;

import java.util.List;

@Repository
public interface ImageTableRepository extends JpaRepository<ImageTable, Integer> {
    @Query("SELECT h.id FROM ImageTable h WHERE h.imageUrl = :imageUrl")
    public Integer getImageId(@Param("imageUrl") String imageUrl);

    @Query("SELECT h FROM ImageTable h WHERE h.id = :id")
    public ImageTable getImageById(@Param("id") Integer id);

    @Query("SELECT h FROM ImageTable h WHERE h.account = :account")
    public List<ImageTable> getImageByAccount(@Param("account") String account);

    @Modifying
    @Query("DELETE FROM User u WHERE u.id = :id")
    public void deleteImage(@Param("id") int id);

}
