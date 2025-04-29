package com.example.DownyShoes.controller.client;

import com.example.DownyShoes.service.ProductService;
import com.example.DownyShoes.service.TryOnService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/api/try-on")
@RequiredArgsConstructor
public class TryOnController {

    private final TryOnService tryOnService;
    private final ProductService productService;

    @GetMapping("/images")
    public ResponseEntity<List<ProductService.ProductImageDTO>> getProductImages() {
        List<ProductService.ProductImageDTO> images = productService.getAllProductImages();
        return ResponseEntity.ok(images);
    }

    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> createTryOnTask(
            @RequestParam("modelImage") MultipartFile modelImage,
            @RequestParam(value = "dressImage", required = false) MultipartFile dressImage,
            @RequestParam(value = "pantsImage", required = false) MultipartFile pantsImage,
            @RequestParam("useProductImage") boolean useProductImage,
            @RequestParam(value = "productImageUrl", required = false) String productImageUrl) {
        try {
            // Kiểm tra đầu vào
            if (modelImage == null || modelImage.isEmpty()) {
                return ResponseEntity.badRequest().body("Model image is required");
            }
            if (!isImageFile(modelImage)) {
                return ResponseEntity.badRequest().body("Model image must be a valid image (jpg, png, jpeg)");
            }
            if (useProductImage) {
                if (productImageUrl == null || productImageUrl.trim().isEmpty()) {
                    return ResponseEntity.badRequest().body("Product image URL is required when using product image");
                }
                if (pantsImage != null && !pantsImage.isEmpty()) {
                    return ResponseEntity.badRequest().body("Pants image is not supported when using product image");
                }
            } else {
                if (dressImage == null || dressImage.isEmpty()) {
                    return ResponseEntity.badRequest().body("Dress image is required when not using product image");
                }
                if (!isImageFile(dressImage)) {
                    return ResponseEntity.badRequest().body("Dress image must be a valid image (jpg, png, jpeg)");
                }
                if (pantsImage != null && !pantsImage.isEmpty() && !isImageFile(pantsImage)) {
                    return ResponseEntity.badRequest().body("Pants image must be a valid image (jpg, png, jpeg)");
                }
            }

            String taskId = tryOnService.createTryOnTask(modelImage, dressImage, pantsImage, useProductImage ? productImageUrl : null);
            return ResponseEntity.ok(taskId);
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error processing try-on request: " + e.getMessage());
        }
    }

    @GetMapping(value = "/result/{taskId}", produces = MediaType.IMAGE_JPEG_VALUE)
    public ResponseEntity<byte[]> getTryOnResult(@PathVariable String taskId) {
        try {
            byte[] resultImage = tryOnService.getTryOnResult(taskId);
            if (resultImage == null || resultImage.length == 0) {
                return ResponseEntity.status(HttpStatus.ACCEPTED).body(null);
            }
            return ResponseEntity.ok()
                    .contentType(MediaType.IMAGE_JPEG)
                    .body(resultImage);
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(null);
        }
    }

    private boolean isImageFile(MultipartFile file) {
        if (file == null || file.isEmpty()) {
            return false;
        }
        String contentType = file.getContentType();
        return contentType != null && (
                contentType.equals("image/jpeg") ||
                contentType.equals("image/png") ||
                contentType.equals("image/jpg")
        );
    }
}