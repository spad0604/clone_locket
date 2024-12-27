package com.nguyengiap.locket.model.response_model.friend_response;

import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class FriendResponse {
    private String account;
    private String firstName;
    private String lastName;
    private String avatarUrl;
}
