package com.example.DownyShoes.domain.dto;

import java.util.List;
import java.util.Optional;

public class ProductCriteriaDTO {
    private Optional<String> page;
    private Optional<List<String>> factory;
    private Optional<List<String>> target;
    private Optional<String> size;
    private Optional<String> sort;
    
    public Optional<String> getPage() {
        return page;
    }
    public void setPage(Optional<String> page) {
        this.page = page;
    }
    public Optional<List<String>> getFactory() {
        return factory;
    }
    public void setFactory(Optional<List<String>> factory) {
        this.factory = factory;
    }
    public Optional<List<String>> getTarget() {
        return target;
    }
    public void setTarget(Optional<List<String>> target) {
        this.target = target;
    }
    public Optional<String> getSize() {
        return size;
    }
    public void setSize(Optional<String> size) {
        this.size = size;
    }
    public Optional<String> getSort() {
        return sort;
    }
    public void setSort(Optional<String> sort) {
        this.sort = sort;
    }

    
}
