package org.judy.testfb.service;

import org.judy.testfb.entity.Judy;

import java.util.List;

public interface TestService {

    public String insertTest(Judy test) throws Exception;

    List<Judy> getJudy() throws Exception;
}
