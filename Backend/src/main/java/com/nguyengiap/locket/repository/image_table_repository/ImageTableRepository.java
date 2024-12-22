package com.nguyengiap.locket.repository.image_table_repository;

import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;
import com.nguyengiap.locket.model.image_table.ImageTable;

@Repository
public interface ImageTableRepository extends JpaRepository<ImageTable, Integer>{
}
