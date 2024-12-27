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
				.avatarUrl("https://scontent.fhan14-2.fna.fbcdn.net/v/t39.30808-6/469864381_2333442380387839_6591716545378037834_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeH2Xe6BZ6KTOp-bhyayPDG2tWit5q4OT1C1aK3mrg5PUPeotFReWdHyhYYuObCoX0qpGVZ97kK_4BAKaH79B5UD&_nc_ohc=nJsQcIfX3lIQ7kNvgGrkKtd&_nc_oc=AditKTFe1n8H654fZTyqwpce3y3WDtSf57KkKtRt5LpVYZIpRFXTTqw54NlPjEpygIAdnz6pMy3j8rE-l8dJ0jhP&_nc_zt=23&_nc_ht=scontent.fhan14-2.fna&_nc_gid=A_vIQgL_6UlYYaDb0JvqZz6&oh=00_AYBT9MB6L39kFhSgqoFxzbPTuwXTLUujsRHZxeGYClR1Ew&oe=67740E94")
				.build();
		userRepository.save(user1);

		User user2 = User.builder()
				.account("giapbacvan2")
				.password(encodedPassword)
				.email("giapt2k29@cht.edu.vn")
				.firstName("Nguyen Van")
				.lastName("Giap")
				.avatarUrl("https://avatars.githubusercontent.com/u/179314473?v=4")
				.build();
		userRepository.save(user2);

		User user3 = User.builder()
				.account("spad04")
				.password(encodedPassword)
				.email("giap6avan@gmail.com")
				.firstName("Nguyen Van")
				.lastName("Giap")
				.avatarUrl("https://scontent.fhan14-5.fna.fbcdn.net/v/t39.30808-6/468936523_2328489950883082_4626673279572716849_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeHYC22kIo4Y0IkWuXoI54Y77C79wq7LbMbsLv3Crstsxj11JK-TH7HU4xMB7S4wpDcbHhH2lOMk2K5CKLhjbksB&_nc_ohc=QQzxp1k7ieEQ7kNvgGdJkib&_nc_oc=Adjv7Q4JI7nKvHGKcY0jqjJL7AwYp13Cfy9yppuC6dN6aaoCXMRI3oI785rYJJAy-SmrKjwe5bjlX7fZpPyb1dfu&_nc_zt=23&_nc_ht=scontent.fhan14-5.fna&_nc_gid=AxdM_fwOx4di8Vn_gA8Yzu5&oh=00_AYBa-KHZ38x4EECP9YI-l90VeGyZcF2FxWTlw_4EyzMPfw&oe=67741FCF")
				.build();

		userRepository.save(user3);

		FriendTable friendTable = FriendTable.builder()
				.account1("giapbacvan")
				.account2("giapbacvan2")
				.build();

		friendTableService.save(friendTable);

		FriendTable friendTable1 = FriendTable.builder()
				.account1("giapbacvan")
				.account2("spad04")
				.build();
		friendTableService.save(friendTable1);
	}

}
