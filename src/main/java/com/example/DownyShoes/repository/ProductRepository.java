package com.example.DownyShoes.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.DownyShoes.domain.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {
}
