package com.nguyengiap.locket.repository.image_table_repository;

import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.nguyengiap.locket.model.image_table.ImageTable;

@Repository
public interface ImageTableRepository extends JpaRepository<ImageTable, Integer> {
    @Query("SELECT h.id FROM ImageTable h WHERE h.imageUrl = :imageUrl")
    public Integer getImageId(@Param("imageUrl") String imageUrl);

}
