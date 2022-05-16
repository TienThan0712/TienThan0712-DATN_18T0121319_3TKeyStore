package com.ThanTrongTien_DATN.KeyBoardStore.Service;

import org.json.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestTemplate;

@Service
public class GoogleCapchaService {
	private static final String SECRETS_KEY = "6LfTF_AfAAAAAIZd0OacRjbKv1ykiIAmkGCj1LNW";

	private static final String GOOGLE_ENDPOINT_URL = "https://www.google.com/recaptcha/api/siteverify";

	public boolean verifyGoogleCapcha(String capChaResponse) {
		RestTemplate restTemplate = new RestTemplate();
		String params = "secret=" + SECRETS_KEY + "&response=" + capChaResponse;
		String requestUrl = GOOGLE_ENDPOINT_URL + "?" + params;

		String response = restTemplate.getForObject(requestUrl, String.class);
		// ==> {"success": true} or {"success": false}

		if (!StringUtils.isEmpty(response)) {
			org.json.JSONObject jsonObject = new JSONObject(response);
			return jsonObject.getBoolean("success");
		}
		return false;
	}
}
