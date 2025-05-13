package com.example.DownyShoes.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.DownyShoes.domain.Product;
import com.example.DownyShoes.service.ProductService;
import com.example.DownyShoes.service.UploadService;

import jakarta.validation.Valid;

@Controller
public class ProductController {
    private final UploadService uploadService;
    private final ProductService productService;

    public ProductController(UploadService uploadService, ProductService productService) {
        this.uploadService = uploadService;
        this.productService = productService;
    }

    @GetMapping("/admin/product")
    public String getProductPage(Model model, @RequestParam("page") Optional<String> pageOptional
    ) {
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            }
        } catch (Exception e) {
            // page = 1;
        }
        Pageable pageable = PageRequest.of(page - 1, 5);
        Page<Product> products = this.productService.fetchProducts(pageable);
        List<Product> productList = products.getContent();
        model.addAttribute("products", productList);
        model.addAttribute("totalPages", products.getTotalPages());
        model.addAttribute("currentPage", page);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String postCreateProductPage(Model model,
            @ModelAttribute("newProduct") @Valid Product newProduct,
            BindingResult bindingResult,
            @RequestParam("avatarFile") MultipartFile avatarFile,
            @RequestParam("size") String[] size) {
        if (bindingResult.hasErrors()) {
            return "admin/product/create";
        }
        String image = this.uploadService.handleSaveUploadFile(avatarFile, "product");
        newProduct.setImage(image);
        newProduct.setSize(String.join(",", size));
        System.out.println("check size: " + newProduct.getSize());
        this.productService.createProduct(newProduct);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        Optional<Product> product = this.productService.fetchProductById(id);
        model.addAttribute("newProduct", product.get());
        model.addAttribute("size", product.get().getSize().split(","));
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String handleUpdateProduct(@ModelAttribute("newProduct") @Valid Product product,
            BindingResult bindingResult,
            @RequestParam("avatarFile") MultipartFile file,
            @RequestParam("size") String[] size) {
        if (bindingResult.hasErrors()) {
            return "admin/product/update";
        }
        // System.out.println("check id: " + product.getId());
        Product currentProduct = this.productService.fetchProductById(product.getId()).get();
        if (currentProduct != null) {
            if (!file.isEmpty()) {
                String img = this.uploadService.handleSaveUploadFile(file, "product");
                currentProduct.setImage(img);
            }
            currentProduct.setName(product.getName());
            currentProduct.setPrice(product.getPrice());
            currentProduct.setQuantity(product.getQuantity());
            currentProduct.setDetailDesc(product.getDetailDesc());
            currentProduct.setShortDesc(product.getShortDesc());
            currentProduct.setFactory(product.getFactory());
            currentProduct.setTarget(product.getTarget());
            currentProduct.setSize(String.join(",", size));

            this.productService.createProduct(currentProduct);
        }
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newProduct", new Product());
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String postDeleteProductPage(Model model, @ModelAttribute("newProduct") Product newProduct) {
        this.productService.deleteProduct(newProduct.getId());
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/{id}")
    public String getProductDetailPage(Model model, @PathVariable long id) {
        Product product = this.productService.fetchProductById(id).get();
        model.addAttribute("product", product);
        model.addAttribute("id", id);
        return "admin/product/detail";
    }

}
