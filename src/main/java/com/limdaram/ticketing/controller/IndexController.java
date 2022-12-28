package com.limdaram.ticketing.controller;

import com.limdaram.ticketing.service.reply.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    @Autowired
    private ReplyService replyService;

    @RequestMapping("")
    public String index() {
        return "/ticketing/member/login";
    }

}
