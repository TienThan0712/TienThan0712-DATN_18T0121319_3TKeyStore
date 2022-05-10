package com.ThanTrongTien_DATN.KeyBoardStore;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication
@EnableCaching
public class KeyBoardStoreApplication {

	public static void main(String[] args) {
		SpringApplication.run(KeyBoardStoreApplication.class, args);
	}
}
