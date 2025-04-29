package com.example.DownyShoes.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
public class TryOnService {

    private static final String API_URL = "https://api.klingai.com/v1/images/kolors-virtual-try-on";

    private final TokenService tokenService;

    private String encodeImageToBase64(MultipartFile file) throws IOException {
        if (file == null || file.isEmpty()) {
            throw new IOException("File is null or empty");
        }
        byte[] bytes = file.getBytes();
        log.info("Encoded file {} with size {} bytes", file.getOriginalFilename(), bytes.length);
        return Base64.getEncoder().encodeToString(bytes);
    }

    private String encodeImageToBase64(byte[] imageBytes) {
        if (imageBytes == null || imageBytes.length == 0) {
            throw new IllegalArgumentException("Image bytes are null or empty");
        }
        log.info("Encoded image bytes with size {} bytes", imageBytes.length);
        return Base64.getEncoder().encodeToString(imageBytes);
    }

    // Hàm trung gian để kết hợp ảnh áo và quần
    private String combineImagesToBase64(MultipartFile dressImage, MultipartFile pantsImage) throws IOException {
        // Đọc ảnh áo và quần
        BufferedImage dressImg = ImageIO.read(dressImage.getInputStream());
        BufferedImage pantsImg = ImageIO.read(pantsImage.getInputStream());

        // Tạo canvas trắng (kích thước tùy chỉnh, ví dụ 600x800)
        int canvasWidth = 600;
        int canvasHeight = 800;
        BufferedImage canvas = new BufferedImage(canvasWidth, canvasHeight, BufferedImage.TYPE_INT_RGB);
        java.awt.Graphics2D g2d = canvas.createGraphics();
        g2d.setColor(java.awt.Color.WHITE);
        g2d.fillRect(0, 0, canvasWidth, canvasHeight);

        // Điều chỉnh kích thước ảnh áo và quần
        int imgWidth = 300;
        int imgHeight = 400;
        BufferedImage resizedDress = new BufferedImage(imgWidth, imgHeight, BufferedImage.TYPE_INT_ARGB);
        BufferedImage resizedPants = new BufferedImage(imgWidth, imgHeight, BufferedImage.TYPE_INT_ARGB);
        resizedDress.createGraphics().drawImage(dressImg.getScaledInstance(imgWidth, imgHeight, java.awt.Image.SCALE_SMOOTH), 0, 0, null);
        resizedPants.createGraphics().drawImage(pantsImg.getScaledInstance(imgWidth, imgHeight, java.awt.Image.SCALE_SMOOTH), 0, 0, null);

        // Dán ảnh áo và quần lên canvas
        g2d.drawImage(resizedDress, (canvasWidth - imgWidth) / 2, 50, null); // Áo ở phía trên
        g2d.drawImage(resizedPants, (canvasWidth - imgWidth) / 2, 450, null); // Quần ở phía dưới
        g2d.dispose();

        // Chuyển canvas thành Base64
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(canvas, "jpg", baos);
        return Base64.getEncoder().encodeToString(baos.toByteArray());
    }

    public String createTryOnTask(MultipartFile modelImage, MultipartFile dressImage, MultipartFile pantsImage, String dressImageUrl) throws IOException {
        // Generate API token
        log.info("Generating API token...");
        String apiToken = tokenService.generateApiToken();
        if (apiToken == null) {
            log.error("Failed to generate API token");
            throw new IOException("Failed to generate API token");
        }
        log.info("API token generated successfully");

        // Encode model image to Base64
        log.info("Encoding model image...");
        String modelImageBase64 = encodeImageToBase64(modelImage);

        // Encode dress image to Base64
        String clothImageBase64;
        if (dressImage != null && !dressImage.isEmpty()) {
            log.info("Encoding dress image from uploaded file...");
            if (pantsImage != null && !pantsImage.isEmpty()) {
                // Kết hợp ảnh áo và quần
                log.info("Combining dress and pants images...");
                clothImageBase64 = combineImagesToBase64(dressImage, pantsImage);
            } else {
                // Chỉ dùng ảnh áo
                clothImageBase64 = encodeImageToBase64(dressImage);
            }
        } else if (dressImageUrl != null && !dressImageUrl.isEmpty()) {
            log.info("Fetching dress image from URL: {}", dressImageUrl);
            byte[] imageBytes = fetchImageFromUrl(dressImageUrl);
            clothImageBase64 = encodeImageToBase64(imageBytes);
        } else {
            log.error("Dress image or URL is required");
            throw new IOException("Dress image or URL is required");
        }

        // Prepare request to KlingAI API
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("Authorization", "Bearer " + apiToken);

        String requestBody = String.format(
                "{\"model_name\": \"kolors-virtual-try-on-v1-5\", \"human_image\": \"%s\", \"cloth_image\": \"%s\", \"batch_size\": 1, \"task_type\": \"ai_try_on\"}",
                modelImageBase64, clothImageBase64
        );

        HttpEntity<String> request = new HttpEntity<>(requestBody, headers);
        RestTemplate restTemplate = new RestTemplate();
        log.info("Sending request to KlingAI API: {}", API_URL);
        ResponseEntity<Map> response = restTemplate.exchange(API_URL, HttpMethod.POST, request, Map.class);

        // Extract task ID from response
        if (response.getStatusCode() != HttpStatus.OK) {
            log.error("Failed to create try-on task, status code: {}", response.getStatusCode());
            throw new IOException("Failed to create try-on task: " + response.getStatusCode());
        }

        Map responseBody = response.getBody();
        if (responseBody == null || !responseBody.containsKey("data")) {
            log.error("Invalid response from KlingAI API: {}", responseBody);
            throw new IOException("Invalid response from KlingAI API");
        }

        String taskId = (String) ((Map) responseBody.get("data")).get("task_id");
        if (taskId == null) {
            log.error("Task ID not found in response: {}", responseBody);
            throw new IOException("Task ID not found in response");
        }

        log.info("Try-on task created successfully with taskId: {}", taskId);
        return taskId;
    }

    public byte[] getTryOnResult(String taskId) throws IOException {
        // Generate API token
        log.info("Generating API token for getting try-on result...");
        String apiToken = tokenService.generateApiToken();
        if (apiToken == null) {
            log.error("Failed to generate API token");
            throw new IOException("Failed to generate API token");
        }

        // Call KlingAI API to get result
        String url = API_URL + "/" + taskId;
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + apiToken);

        RestTemplate restTemplate = new RestTemplate();
        log.info("Fetching try-on result from: {}", url);
        ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.GET, new HttpEntity<>(headers), Map.class);

        if (response.getStatusCode() != HttpStatus.OK) {
            log.error("Failed to get try-on result, status code: {}", response.getStatusCode());
            throw new IOException("Failed to get try-on result: " + response.getStatusCode());
        }

        Map responseBody = response.getBody();
        if (responseBody == null || !responseBody.containsKey("data")) {
            log.error("Invalid response from KlingAI API: {}", responseBody);
            throw new IOException("Invalid response from KlingAI API");
        }

        Map data = (Map) responseBody.get("data");
        Map taskResult = (Map) data.get("task_result");

        // Check if task is completed
        if (taskResult == null || !taskResult.containsKey("images")) {
            log.warn("Task not completed yet for taskId: {}", taskId);
            throw new IOException("Task not completed yet");
        }

        // Extract result URL
        List<Map> images = (List<Map>) taskResult.get("images");
        String resultUrl = (String) images.get(0).get("url");

        // Fetch and return the image
        log.info("Fetching result image from: {}", resultUrl);
        return fetchImageFromUrl(resultUrl);
    }

    public byte[] fetchImageFromUrl(String imageUrl) throws IOException {
        log.info("Fetching image from URL: {}", imageUrl);
        java.net.URL url = new java.net.URL(imageUrl);
        try (java.io.InputStream in = url.openStream()) {
            byte[] imageBytes = org.apache.commons.io.IOUtils.toByteArray(in);
            log.info("Successfully fetched image from URL, size: {} bytes", imageBytes.length);
            return imageBytes;
        } catch (IOException e) {
            log.error("Failed to fetch image from URL: {}", imageUrl, e);
            throw new IOException("Failed to fetch image from URL: " + imageUrl, e);
        }
    }
}