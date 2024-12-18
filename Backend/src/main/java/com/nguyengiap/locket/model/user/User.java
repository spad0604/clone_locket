package com.nguyengiap.locket.model.user;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Builder
@Setter
@Getter
public class User {
    private String account;
    private String password;
    private String firstName;
    private String lastName;
    private String avatarUrl;
}
