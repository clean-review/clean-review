package org.judy.dto;

import lombok.*;

@NoArgsConstructor
@Data
@Builder
@AllArgsConstructor
public class OrderDTO {

    private String menu;
    private Long price;
    private Long qty;
}
