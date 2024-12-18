package com.nguyengiap.locket.model.request_model.authenticate_request_model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AuthenticateRequestModel {
    private String account;
    private String password;
}
