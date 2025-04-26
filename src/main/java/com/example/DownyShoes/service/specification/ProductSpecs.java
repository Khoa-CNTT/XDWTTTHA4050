package com.example.DownyShoes.service.specification;

import java.util.Arrays;
import java.util.List;
import org.springframework.data.jpa.domain.Specification;

import com.example.DownyShoes.domain.Product;
import com.example.DownyShoes.domain.Product_;

import jakarta.persistence.criteria.Predicate;

public class ProductSpecs {
    public static Specification<Product> nameLike(String name) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.NAME), "%" + name + "%");
    }

    public static Specification<Product> minPrice(double minPrice) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.greaterThanOrEqualTo(root.get(Product_.PRICE), minPrice);
    }

    public static Specification<Product> factoryList(List<String> factory) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.in(root.get(Product_.FACTORY)).value(factory);
    }

    public static Specification<Product> targetList(List<String> target) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.in(root.get(Product_.TARGET)).value(target);
    }

    public static Specification<Product> target(String target) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.equal(root.get(Product_.TARGET), target);
    }

    public static Specification<Product> size(String sizes) {
        if (sizes == null || sizes.trim().isEmpty()) {
            return (root, query, cb) -> cb.conjunction();
        }

        String[] sizeArray = sizes.split(",");
        return (root, query, cb) -> {
            if (sizeArray.length == 0) {
                return cb.conjunction();
            }

            return cb.or(
                    Arrays.stream(sizeArray)
                            .filter(size -> size != null && !size.trim().isEmpty())
                            .map(size -> cb.like(root.get(Product_.SIZE), "%" + size.trim() + "%"))
                            .toArray(Predicate[]::new));
        };
    }
}
