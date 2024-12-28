package com.nguyengiap.locket.model.request_model.image_message;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Builder
public class ImageMessageRequest {
    private Integer id;
    private String message;
}
