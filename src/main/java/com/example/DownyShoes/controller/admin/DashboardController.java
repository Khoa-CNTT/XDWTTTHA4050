package com.example.DownyShoes.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.DownyShoes.service.UserService;


import org.springframework.ui.Model;

@Controller
public class DashboardController {
    private final UserService userService;

    public DashboardController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/admin")
    public String getDashboardPage(Model model) {
        model.addAttribute("productCount", this.userService.countProduct());
        model.addAttribute("orderCount", this.userService.countOrder());
        model.addAttribute("userCount", this.userService.countUser());
        return "admin/dashboard/show";
    }
}
