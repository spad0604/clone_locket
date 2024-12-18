package com.nguyengiap.locket.model.response_model.authentication_response;

import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class AuthenticateReponse {
    private String token;
    private String account;
}
