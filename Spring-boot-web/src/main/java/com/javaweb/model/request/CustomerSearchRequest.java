package com.javaweb.model.request;

import com.javaweb.model.dto.AbstractDTO;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CustomerSearchRequest extends AbstractDTO
{
    private Long id;
    private String fullName;
    private String phone;
    private String email;
    private Long staffId;
    private String status;

}
