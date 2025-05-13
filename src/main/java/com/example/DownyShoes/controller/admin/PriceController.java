package com.example.DownyShoes.controller.admin;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.example.DownyShoes.service.OrderService;

@RestController
@RequestMapping("/api/orders")
public class PriceController {

    @Autowired
    private OrderService orderService;

    @GetMapping("/total-price-by-payment-status")
    public Map<String, String> getTotalPriceByPaymentStatus() {
        return orderService.getTotalPriceByPaymentStatus();
    }
}