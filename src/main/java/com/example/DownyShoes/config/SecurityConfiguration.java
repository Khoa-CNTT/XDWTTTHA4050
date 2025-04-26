package com.example.DownyShoes.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.example.DownyShoes.service.CustomUserDetailsService;
import com.example.DownyShoes.service.UserService;

import jakarta.servlet.DispatcherType;

@Configuration
@EnableMethodSecurity(securedEnabled = true)
public class SecurityConfiguration {
        private final UserService userService;

        public SecurityConfiguration(UserService userService) {
                this.userService = userService;
        }

        @Bean
        public PasswordEncoder passwordEncoder() {
                return new BCryptPasswordEncoder();
        }

        @Bean
        public UserDetailsService userDetailsService(UserService userService) {
                return new CustomUserDetailsService(userService);
        }

        @Bean
        public AuthenticationSuccessHandler customSuccessHandler(UserService userService) {
                return new CustomSuccessHandler(userService);
        }

        @Bean
        public DaoAuthenticationProvider authProvider(
                        PasswordEncoder passwordEncoder,
                        UserDetailsService userDetailsService) {

                DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
                authProvider.setUserDetailsService(userDetailsService);
                authProvider.setPasswordEncoder(passwordEncoder);
                authProvider.setHideUserNotFoundExceptions(false);

                return authProvider;
        }

        @Bean
        SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
                http
                                .authorizeHttpRequests(authorize -> authorize
                                                .dispatcherTypeMatchers(DispatcherType.FORWARD,
                                                                DispatcherType.INCLUDE)
                                                .permitAll()

                                                .requestMatchers("/", "/product/**", "/login", "/client/**", "/css/**",
                                                                "/js/**", "/client/images/**", "/register","/product/**")
                                                .permitAll()

                                                .requestMatchers("/admin/**").hasAuthority("ADMIN")

                                                .requestMatchers("/resources/**").permitAll()

                                                .anyRequest().authenticated())
                                .sessionManagement((sessionManagement) -> sessionManagement
                                                .sessionCreationPolicy(SessionCreationPolicy.ALWAYS)
                                                .invalidSessionUrl("/logout?expired")
                                                .maximumSessions(1)
                                                .maxSessionsPreventsLogin(false))

                                .logout(logout -> logout.deleteCookies("JSESSIONID").invalidateHttpSession(true))

                                .formLogin(formLogin -> formLogin
                                                .loginPage("/login")
                                                .failureUrl("/login?error")
                                                .successHandler(customSuccessHandler(userService))
                                                .permitAll())
                                .exceptionHandling(exceptionHandling -> exceptionHandling
                                                .accessDeniedPage("/access-denied"));

                return http.build();
        }

}
