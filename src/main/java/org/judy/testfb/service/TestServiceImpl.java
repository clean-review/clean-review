package org.judy.testfb.service;

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.*;
import com.google.firebase.cloud.FirestoreClient;
import org.judy.testfb.entity.Judy;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TestServiceImpl implements TestService{

    public static final String COLLECTION_NAME="test";

    @Override
    public String insertTest(Judy test) throws Exception {

        Firestore firestore = FirestoreClient.getFirestore();

        ApiFuture<WriteResult> apiFuture = firestore.collection(COLLECTION_NAME).document(test.getMenu()).set(test);

        return apiFuture.get().getUpdateTime().toString();

    }

    @Override
    public List<Judy> getJudy() throws Exception {
        Firestore firestore = FirestoreClient.getFirestore();

        CollectionReference collectionReference = firestore.collection(COLLECTION_NAME);


        //DocumentReference documentReference = firestore.collection(COLLECTION_NAME).document(menu);

        ApiFuture<QuerySnapshot> apiFuture = collectionReference.get();

        QuerySnapshot querySnapshot = apiFuture.get();

        List<Judy> result = new ArrayList<>();

        querySnapshot.forEach(i ->{
            Judy judy = i.toObject(Judy.class);
            result.add(judy);
        });

        return result;
    }
}
