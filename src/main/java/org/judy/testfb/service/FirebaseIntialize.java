package org.judy.testfb.service;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.io.FileInputStream;

@Service
public class FirebaseIntialize {

    @Value("classpath:silent-kiosk-d4b4e-firebase-adminsdk-ilnzr-ac87c639cd.json")
    private Resource resource;


    @PostConstruct
    public void initialize(){
        try {
            FileInputStream serviceAccount =
                        new FileInputStream(resource.getFile());

            FirebaseOptions options = new FirebaseOptions.Builder()
                    .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                    .build();

            FirebaseApp.initializeApp(options);
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
