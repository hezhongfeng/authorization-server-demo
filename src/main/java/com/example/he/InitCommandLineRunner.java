package com.example.he;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import org.springframework.security.oauth2.server.authorization.client.RegisteredClient;
import org.springframework.security.oauth2.server.authorization.client.RegisteredClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import static com.example.he.util.RegisteredClients.messagingClient;

@Component
public class InitCommandLineRunner implements CommandLineRunner {

  @Autowired
  private RegisteredClientRepository registeredClientRepository;

  @Override
  public void run(String... args) throws Exception {
    System.out.println("HHHHH555ApplicationRunner");

    RegisteredClient registeredClient = messagingClient();
    this.registeredClientRepository.save(registeredClient);
  }
}
