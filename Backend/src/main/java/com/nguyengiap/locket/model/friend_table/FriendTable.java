package com.nguyengiap.locket.model.friend_table;

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
@Table(name = "_friend_table")
public class FriendTable {
    @Id
    private String account1;
    @Id
    private String account2;
}
