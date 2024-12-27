package com.nguyengiap.locket.model.history_table;
import jakarta.persistence.*;
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
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer imageId;
    private String account;
    private Integer isSeen;
}
