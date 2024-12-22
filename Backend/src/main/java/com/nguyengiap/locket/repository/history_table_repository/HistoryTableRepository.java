package com.nguyengiap.locket.repository.history_table_repository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nguyengiap.locket.model.history_table.HistoryTable;


@Repository
public interface HistoryTableRepository extends JpaRepository<HistoryTable, Integer>{
    @Modifying
    @Query("UPDATE HistoryTable h SET h.isSeen = 1 WHERE h.account = :account AND h.imageId = :id")
    void updateIsSeen(@Param("id") int id, @Param("account") String account);
    
    @Query("SELECT h FROM HistoryTable h WHERE h.account = :account")
    List<HistoryTable> getHistoryByAccount(@Param("account") String account);
}
