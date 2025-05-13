package com.example.DownyShoes.service;

import java.text.NumberFormat;
import java.util.List;
import java.util.Optional;

import java.util.Map;
import java.util.HashMap;
import java.util.Locale;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.DownyShoes.domain.Order;
import com.example.DownyShoes.domain.OrderDetail;
import com.example.DownyShoes.domain.User;
import com.example.DownyShoes.repository.OrderRepository;
import com.example.DownyShoes.repository.OrderDetailRepository;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderService(
            OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository) {
        this.orderDetailRepository = orderDetailRepository;
        this.orderRepository = orderRepository;
    }

    public Map<String, String> getTotalPriceByPaymentStatus() {
        List<Order> orders = this.orderRepository.findAll();
        Map<String, String> result = new HashMap<>();
        double successTotal = 0.0;
        double unpaidTotal = 0.0;

        for (Order order : orders) {
            if ("PAYMENT_SUCCESS".equalsIgnoreCase(order.getPaymentStatus())) {
                successTotal += order.getTotalPrice();
            } else if ("PAYMENT_UNPAID".equalsIgnoreCase(order.getPaymentStatus())) {
                unpaidTotal += order.getTotalPrice();
            }
        }
        NumberFormat vndFormat = NumberFormat.getNumberInstance(new Locale("vi", "VN"));
        vndFormat.setMinimumFractionDigits(0);
        vndFormat.setMaximumFractionDigits(0);
        String successFormatted = vndFormat.format(successTotal) + " VND";
        String unpaidFormatted = vndFormat.format(unpaidTotal) + " VND";

        result.put("success", successFormatted);
        result.put("unpaid", unpaidFormatted);
        return result;
    }

    public Page<Order> fetchAllOrders(Pageable pageable) {
        return this.orderRepository.findAll(pageable);
    }

    public Optional<Order> fetchOrderById(long id) {
        return this.orderRepository.findById(id);
    }

    public void deleteOrderById(long id) {
        // delete order detail
        Optional<Order> orderOptional = this.fetchOrderById(id);
        if (orderOptional.isPresent()) {
            Order order = orderOptional.get();
            List<OrderDetail> orderDetails = order.getOrderDetails();
            for (OrderDetail orderDetail : orderDetails) {
                this.orderDetailRepository.deleteById(orderDetail.getId());
            }
        }

        this.orderRepository.deleteById(id);
    }

    public void updateOrder(Order order) {
        Optional<Order> orderOptional = this.fetchOrderById(order.getId());
        if (orderOptional.isPresent()) {
            Order currentOrder = orderOptional.get();
            currentOrder.setStatus(order.getStatus());
            this.orderRepository.save(currentOrder);
        }
    }

    public List<Order> fetchOrderByUser(User user) {
        return this.orderRepository.findByUser(user);
    }

    public Page<Order> fetchOrderByUser(User user, Pageable pageable) {
        return this.orderRepository.findByUser(user, pageable);
    }
}
