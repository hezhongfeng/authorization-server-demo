package com.example.he;

import java.time.Instant;
import java.util.UUID;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.oauth2.core.AuthorizationGrantType;
import org.springframework.security.oauth2.core.ClientAuthenticationMethod;
import com.example.he.oauth.entity.Client;
import com.example.he.oauth.repository.ClientRepository;

@SpringBootTest
class HeApplicationTests {

	@Autowired
	private ClientRepository clientRepo;

	@Test
	void contextLoads() {

		Client client = new Client();
		client.setId(UUID.randomUUID().toString());
		// client.setClientIdIssuedAt(Instant.now());
		client.setClientName("name");
		client.setClientId("messaging-client");
		client.setClientSecret("{noop}secret");
		client.setRedirectUris(
				"http://127.0.0.1:8080/login/oauth2/code/messaging-client-oidc,http://127.0.0.1:8080/authorized");
		client
				.setClientAuthenticationMethods(ClientAuthenticationMethod.CLIENT_SECRET_BASIC.getValue());
		client.setAuthorizationGrantTypes(AuthorizationGrantType.REFRESH_TOKEN.getValue() + ","
				+ AuthorizationGrantType.AUTHORIZATION_CODE.getValue() + ","
				+ AuthorizationGrantType.CLIENT_CREDENTIALS.getValue());
		client.setScopes("openid,message.read,message.write");

		String clientSettingString =
				"{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"settings.client.require-proof-key\":false,\"settings.client.require-authorization-consent\":true}";
		String tokenSettingString =
				"{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"settings.token.reuse-refresh-tokens\":true,\"settings.token.id-token-signature-algorithm\":[\"org.springframework.security.oauth2.jose.jws.SignatureAlgorithm\",\"RS256\"],\"settings.token.access-token-time-to-live\":[\"java.time.Duration\",300.000000000],\"settings.token.access-token-format\":{\"@class\":\"org.springframework.security.oauth2.core.OAuth2TokenFormat\",\"value\":\"self-contained\"},\"settings.token.refresh-token-time-to-live\":[\"java.time.Duration\",3600.000000000]}";


		client.setClientSettings(clientSettingString);
		client.setTokenSettings(tokenSettingString);

		clientRepo.save(client);
	}

}
