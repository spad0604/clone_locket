package com.nguyengiap.locket.model.response_model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Builder
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class StatusResponseModel {
    int statusCode;
    String message;
}
