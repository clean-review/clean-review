package org.judy.testfb.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.judy.dto.OrderDTO;
import org.judy.testfb.entity.Judy;
import org.judy.testfb.service.TestService;
import org.judy.testfb.socket.Socket;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@Log4j2
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class TestController {

    private final Socket socket;

    private final TestService testService;

    @GetMapping("/getJudy")
    public List<Judy> getJudy(){
        try {
            log.info(testService.getJudy());
            return testService.getJudy();
        } catch (Exception e) {
            e.printStackTrace();
            log.info("=========================");
            return null;
        }


    }

    @PostMapping("/testOrder")
    public String getOrder(@RequestBody OrderDTO dto){

        log.info(dto);

        String orderinfo = dto.toString();

        socket.broadcast(orderinfo);

        return "success";
    }


}
