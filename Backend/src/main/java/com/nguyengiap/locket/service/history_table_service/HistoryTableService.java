package com.nguyengiap.locket.service.history_table_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nguyengiap.locket.model.history_table.HistoryTable;
import com.nguyengiap.locket.repository.history_table_repository.HistoryTableRepository;

@Service
public class HistoryTableService {
    @Autowired
    private HistoryTableRepository historyTableRepository;

    public void save(HistoryTable historyTable) {
        historyTableRepository.save(historyTable);
    }

    public void updateIsSeen(Integer id, String account) {
        historyTableRepository.updateIsSeen(id, account);
    }

    public List<HistoryTable> getHistoryByAccount(String account) {
        return historyTableRepository.getHistoryByAccount(account);
    }
}
