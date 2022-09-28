package com.example.he;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import com.example.he.oauth.entity.Client;
import com.example.he.oauth.repository.ClientRepository;
import org.springframework.security.oauth2.server.authorization.client.RegisteredClient;
import org.springframework.security.oauth2.server.authorization.client.RegisteredClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import static com.example.he.util.RegisteredClients.messagingClient;
import java.util.List;

@Component
public class InitCommandLineRunner implements CommandLineRunner {

  @Autowired
  private RegisteredClientRepository registeredClientRepository;

  @Autowired
  private ClientRepository clientRepo;

  @Override
  public void run(String... args) throws Exception {
    System.out.println("HHHHH555ApplicationRunner");


    List<Client> clients = clientRepo.findAll();

    for (Client client : clients) {
      System.out.print(client.getClientName());
    }

    // RegisteredClient registeredClient = messagingClient();
    // this.registeredClientRepository.save(registeredClient);
  }
}
