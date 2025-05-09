package com.example.DownyShoes.service.userinfo;

import java.util.Map;
import java.util.Collections;


import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Service;

import com.example.DownyShoes.domain.Role;
import com.example.DownyShoes.domain.User;
import com.example.DownyShoes.service.UserService;

@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService {
    private final UserService userService;

    public CustomOAuth2UserService(UserService userService) {
        this.userService = userService;
    }

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2User oAuth2User = super.loadUser(userRequest);

        Map<String, Object> attributes = oAuth2User.getAttributes();

        // get provider
        String registrationId = userRequest.getClientRegistration().getRegistrationId();

        // Process oAuth2User
        String email = (String) attributes.get("email");
        String fullname = (String) attributes.get("name");

        Role userRole = userService.getRoleByName("USER");

        if (email != null) {
            User user = userService.getUserByEmail(email);
            if (user == null) {
                // create new user
                User oUser = new User();
                oUser.setEmail(email);
                oUser.setFullName(fullname);
                oUser.setProvider("GOOGLE");
                oUser.setPassword("123456");
                oUser.setPhone("0123456789");
                oUser.setAddress("abc");
                oUser.setRole(userRole);

                userService.saveUser(oUser);
            }
        }

        return new DefaultOAuth2User(
                Collections.singletonList(new SimpleGrantedAuthority(userRole.getName())),
                oAuth2User.getAttributes(),
                "email");
    }

}
