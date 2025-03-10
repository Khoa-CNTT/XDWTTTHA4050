package com.example.DownyShoes.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

import com.example.DownyShoes.domain.Comment;
import com.example.DownyShoes.domain.User;

public interface CommentRepository extends JpaRepository<Comment, Long> {
    Comment findByUser(User user);
    List<Comment> findByProductId(long productId);
}
