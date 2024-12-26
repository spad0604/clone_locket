package com.nguyengiap.locket;

import com.nguyengiap.locket.service.user_service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.nguyengiap.locket.model.friend_table.FriendTable;
import com.nguyengiap.locket.model.user.User;
import com.nguyengiap.locket.repository.user_repository.UserRepository;
import com.nguyengiap.locket.service.friend_table_service.FriendTableService;

import jakarta.annotation.PostConstruct;

@SpringBootApplication(scanBasePackages = "com.nguyengiap.locket")
public class LocketApplication {
	@Autowired
	private UserService userRepository;

	@Autowired
	private FriendTableService friendTableService;
	public static void main(String[] args) {
		SpringApplication.run(LocketApplication.class, args);
	}

	@PostConstruct
	public void init() {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encodedPassword = passwordEncoder.encode("admin123");

		User user1 = User.builder()
				.account("giapbacvan")
				.password(encodedPassword)
				.email("giapt2k29@cht.edu.vn")
				.firstName("Nguyen Van")
				.lastName("Giap")
				.avatarUrl("test")
				.build();
		userRepository.save(user1);

		User user2 = User.builder()
				.account("giapbacvan2")
				.password(encodedPassword)
				.email("giapt2k29@cht.edu.vn")
				.firstName("Nguyen Van")
				.lastName("Giap")
				.avatarUrl("test")
				.build();
		userRepository.save(user2);

		FriendTable friendTable = FriendTable.builder()
				.account1("giapbacvan")
				.account2("giapbacvan2")
				.build();

		friendTableService.save(friendTable);
	}

}
