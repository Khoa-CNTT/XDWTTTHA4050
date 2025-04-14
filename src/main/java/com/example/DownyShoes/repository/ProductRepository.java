package com.example.DownyShoes.repository;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.example.DownyShoes.domain.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {
    Optional<Product> findById(long id);
    Page<Product> findAll(Pageable pageable);
}
