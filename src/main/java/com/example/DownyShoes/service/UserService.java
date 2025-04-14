package com.example.DownyShoes.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.DownyShoes.domain.Role;
import com.example.DownyShoes.domain.User;
import com.example.DownyShoes.domain.dto.RegisterDTO;
import com.example.DownyShoes.repository.RoleRepository;
import com.example.DownyShoes.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public List<User> getAllUsersByEmail(String email) {
        return this.userRepository.findOneByEmail(email);
    }

    public User handleSaveUser(User newUser) {
       return this.userRepository.save(newUser);

    }

    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public void deleteUserById(long id) {
        this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    public User registerDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setPhone(registerDTO.getPhone());
        user.setAddress(registerDTO.getAddress());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());
        return user;
    }

    public boolean isEmailExist(String email) {
        return this.userRepository.existsByEmail(email);
    }

    public boolean isPhoneExist(String phone) {
        return this.userRepository.existsByPhone(phone);
    }

    public User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }
}
