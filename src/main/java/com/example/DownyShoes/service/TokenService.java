package com.example.DownyShoes.service;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Service
@Slf4j
public class TokenService {

    @Value("${klingai.access-key-id}")
    private String accessKeyId;

    @Value("${klingai.access-key-secret}")
    private String accessKeySecret;

    public String generateApiToken() {
        try {
            Date expiredAt = new Date(System.currentTimeMillis() + 1800 * 1000);
            Date notBefore = new Date(System.currentTimeMillis() - 5 * 1000);
            Algorithm algorithm = Algorithm.HMAC256(accessKeySecret);

            Map<String, Object> header = new HashMap<>();
            header.put("alg", "HS256");

            return JWT.create()
                    .withIssuer(accessKeyId)
                    .withHeader(header)
                    .withExpiresAt(expiredAt)
                    .withNotBefore(notBefore)
                    .sign(algorithm);
        } catch (Exception e) {
            log.error("Failed to generate API token", e);
            return null;
        }
    }
}