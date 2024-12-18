package com.nguyengiap.locket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.nguyengiap.locket.model.user.User;
import com.nguyengiap.locket.repository.user_repository.UserRepository;

import jakarta.annotation.PostConstruct;

@SpringBootApplication(scanBasePackages = "com.nguyengiap.locket")
public class LocketApplication {
	@Autowired
	private UserRepository userRepository;

	public static void main(String[] args) {
		SpringApplication.run(LocketApplication.class, args);
	}

	@PostConstruct
	public void init() {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encodedPassword = passwordEncoder.encode("admin123");

		User user = User.builder()
		.account("giapbacvan")
		.password(encodedPassword)
		.email("giapt2k29@cht.edu.vn")
		.firstName("Nguyen Van")
		.lastName("Giap")
		.avatarUrl("test")
		.build();

		userRepository.save(user);
	}

}
