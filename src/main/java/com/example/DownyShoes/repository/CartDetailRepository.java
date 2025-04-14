package com.example.DownyShoes.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.DownyShoes.domain.Cart;
import com.example.DownyShoes.domain.CartDetail;
import com.example.DownyShoes.domain.Product;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {

    CartDetail findByCartAndProduct(Cart cart, Product product);
}
