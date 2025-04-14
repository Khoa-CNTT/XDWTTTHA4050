package com.example.DownyShoes.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.DownyShoes.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    boolean existsByEmail(String email);

    boolean existsByPhone(String phone);

    User save(User user);

    List<User> findOneByEmail(String email);

    List<User> findAll();

    User findById(long id);

    void deleteById(long id);

    User findByEmail(String email);
}
