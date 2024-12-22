package com.nguyengiap.locket.model.image_table;
import java.time.DateTimeException;

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
@Table(name = "_image_table")
public class ImageTable {
    @Id
    private int id;
    private String imageUrl;
    @Id
    private String account;
    private DateTimeException dateTime;
}
