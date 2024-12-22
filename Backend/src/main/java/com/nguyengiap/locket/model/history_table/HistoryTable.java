package com.nguyengiap.locket.model.history_table;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;

@Builder
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "_history_table")
public class HistoryTable {
    @Id
    private int imageId;
    @Id
    private String account;
    private int isSeen;
}