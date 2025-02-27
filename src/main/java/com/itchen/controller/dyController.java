package com.itchen.controller;

import com.itchen.service.dyService;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author chen
 * @description 功能描述
 * @create 2025/2/27 11:12
 */
@RestController
@RequestMapping("/dy")
public class dyController {
    private final dyService dyService;

    public dyController(com.itchen.service.dyService dyService) {
        this.dyService = dyService;
    }

}
