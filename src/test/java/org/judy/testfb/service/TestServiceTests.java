package org.judy.testfb.service;


import org.judy.testfb.entity.Judy;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class TestServiceTests {

    @Autowired
    TestService testService;

    @Test
    public void testinsert() throws Exception{

        Judy judy = Judy.builder().menu("몰라요").price("100000").build();

        String test = testService.insertTest(judy);

        System.out.println(test);
    }

    @Test
    public void testGetJudy()  {

        try{

            System.out.println(testService.getJudy());
        }catch (Exception e){
            e.printStackTrace();
        }

    }

}
